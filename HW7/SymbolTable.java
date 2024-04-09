import java.util.HashMap;

public class SymbolTable {
	
	private static final String INITIAL_VALID_CHARS = "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm_.$:";
	private static final String ALL_VALID_CHARS = "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm_.$:0123456789";
	
	private HashMap<String,Integer> symbolTable;
	
	public SymbolTable()
	{
		symbolTable = new HashMap<>(30);
		
		symbolTable.put("R0", 0);
		symbolTable.put("R1", 1);
		symbolTable.put("R2", 2);
		symbolTable.put("R3", 3);
		symbolTable.put("R4", 4);
		symbolTable.put("R5", 5);
		symbolTable.put("R6", 6);
		symbolTable.put("R7", 7);
		symbolTable.put("R8", 8);
		symbolTable.put("R9", 9);
		symbolTable.put("R10", 10);
		symbolTable.put("R11", 11);
		symbolTable.put("R12", 12);
		symbolTable.put("R13", 13);
		symbolTable.put("R14", 14);
		symbolTable.put("R15", 15);
		
		symbolTable.put("SCREEN", 16384);
		symbolTable.put("KBD", 24576);
		symbolTable.put("SP", 0);
		symbolTable.put("LCL", 1);
		symbolTable.put("ARG", 2);
		symbolTable.put("THIS", 3);
		symbolTable.put("THAT", 4);
		symbolTable.put("WRITE", 18);
		symbolTable.put("END", 22);
		symbolTable.put("i", 16);
		symbolTable.put("sum", 17);
	}
	
	public boolean addEntry(String symbol, int address )
	{
		if(this.contains(symbol))
		{
			System.out.println("That symbol is already in the table...");
			return false;
		}
		else if(this.isValidName(symbol))
		{
			symbolTable.put(symbol, address);
		}
		
		return true;
	}

	public boolean contains(String symbol)
	{
		return this.symbolTable.containsKey(symbol);
	}
	
	public int getAddress(String symbol) {
		if (this.contains(symbol)) {
			return symbolTable.get(symbol);
		} else {
			throw new IllegalArgumentException("Symbol '" + symbol + "' was not found in the table.");
		}
	}
	

	private static boolean isValidName(String symbol) {
		if (!INITIAL_VALID_CHARS.contains(Character.toString(symbol.charAt(0)))) {
			System.out.println("Invalid symbol name...");
			return false;
		}
	
		for (int i = 1; i < symbol.length(); i++) {
			if (!ALL_VALID_CHARS.contains(Character.toString(symbol.charAt(i)))) {
				System.out.println("Invalid symbol name...");
				return false;
			}
		}
	
		return true;
	}
	
}