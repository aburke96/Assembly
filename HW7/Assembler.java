import java.io.FileOutputStream;
import java.io.FileNotFoundException;
import java.util.Scanner;
import java.io.PrintWriter;

public class Assembler {
	
	public static void main(String[] args) {

		String inputFileName, outputFileName;
		PrintWriter outputFile = null; 
		SymbolTable symbolTable;
		int romAddress, ramAddress;
	
		if(args.length == 1) {
			System.out.println("command line arg = " + args[0]);
			inputFileName = args[0];
		}
		else
		{
			Scanner keyboard = new Scanner(System.in);

			System.out.println("Please enter assembly file name you would like to assemble.");
			System.out.println("Don't forget the .asm extension: ");
			inputFileName = keyboard.nextLine();
					
			keyboard.close();
		}
		
		outputFileName = inputFileName.substring(0,inputFileName.lastIndexOf('.')) + ".hack";
							
		try 
		{
			outputFile = new PrintWriter(new FileOutputStream(outputFileName));
		} 
		catch (FileNotFoundException ex) 
		{
			System.err.println("Could not open output file " + outputFileName);
			System.err.println("Run program again, make sure you have write permissions, etc.");
			System.exit(0);
		}
		
		Code codeTable = new Code();
		symbolTable = new SymbolTable();
			
		firstPass(inputFileName, symbolTable);
		System.out.println("Done with first pass...");
		
		secondPass(inputFileName, symbolTable, outputFile);
		System.out.println("Done with second pass...");
		
		outputFile.close();
	}

	private static void firstPass(String inputFileName, SymbolTable symbolTable) 
	{
		Parser parse = new Parser(inputFileName);
		String symbol = "";
		int romAddress;
		
		while(parse.hasMoreCommands())
		{
			parse.advance();
			romAddress = parse.getLineNumber();
			
			if(parse.getCommandType() == 'L')
			{
				symbol = parse.getSymbol();
				symbolTable.addEntry(symbol, romAddress);
			}
		}
	}
	
	private static void secondPass(String inputFileName, SymbolTable symbolTable, PrintWriter outputFile) 
{
    Parser parse = new Parser(inputFileName);
    Code codeTable = new Code();
    
    String outputCode = "";
    int ramAddress = 16;
    
    while(parse.hasMoreCommands())
    {
        parse.advance();
        
        if(parse.getCommandType() == 'C')
        {
            String comp = codeTable.getComp(parse.getComp());
            String dest = codeTable.getDest(parse.getDest());
            String jump = codeTable.getJump(parse.getJump());

            if(comp == null || dest == null || jump == null)
            {
                System.out.println("Syntax error at line number: " + parse.getLineNumber() + "\nShutting down now...");
                System.exit(0);
            }
            else
            {
                outputCode = "111" + comp + dest + jump;
                System.out.println(outputCode);
                outputFile.println(outputCode);
            }
        }
        else if(parse.getCommandType() == 'A')
			{
				int num = 0;
				String numbers = "0123456789";
				String symbol = "";
				
				symbol = parse.getSymbol();
				
				if(numbers.indexOf(symbol.charAt(0)) != -1)
				{
					try
					{
						num = Integer.parseInt(symbol);
					}
					catch(NumberFormatException e)
					{
						System.out.println(e.getMessage());
						System.out.println("Wrong variable name at line number: " + parse.getLineNumber() + "\nShutting down now...");
						System.exit(0);
					}
					
					outputCode =  "0" + codeTable.decimalToBinary(num);
					outputFile.println(outputCode);
				}
				else
				{
					if(symbolTable.contains(symbol))
					{
						num = symbolTable.getAddress(symbol);
						
						outputCode = "0" + codeTable.decimalToBinary(num);
						outputFile.println(outputCode);
					}
					else
					{
						if(!symbolTable.addEntry(symbol, ramAddress))
						{
							System.out.println("Syntax error at line number: " + parse.getLineNumber() + "\nShutting down now...");
							System.exit(0);
						}
					}
					outputCode = "0" + codeTable.decimalToBinary(ramAddress);
					outputFile.println(outputCode);
					ramAddress++;
				}
			}
		}	
	}					
}