// Find the greatest value in an array of 5 elements
// and place the result in register R0

@R0         // Set register 0 to store value into
M=-1        // Initialize R0 to -1

@5          // Set the size of array to 5
D=A         // Data register equal to address register 
@SIZE       // Set the size variable to A-register 
M=D         // Memory equal to data 

// Initialize the array with the given values
// You can modify these values to match your requirements
@1          // Set address register to 1
D=M         // Store value of memory address into data register
@ARR        // Set address register to array variable 
M=D         // Store value in data register into array
@2          // Set address register to 2
D=M         // Value of memore address goes into array
@ARR+1      // Set the address register to the address of the array variable +1
M=D         // Store val in data register
@3          // Set register
D=M         // Store val in memory register
@ARR+2      // Set register
M=D         // Store val in data register 
@4          // Set register
D=M         // Store val in memory register
@ARR+3      // Set register
M=D         // Store val in data register
@5          // Set register
D=M         // Store val in memory
@ARR+4      // Set address register to address of ARR+4
M=D         // Store val

// Loop through the array
@0          // Set register
D=A         // Store value
@SIZE       // Set register 
D=M-D       // Sub val
@LOOP       // Set register to address of LOOP
D;JGE       // Jump to loop

// Load the current element into D
@ARR            // Set register 
D=M             // Store val
@0              // Set register 
A=D+A           // Add val
D=M             // Store val

// Compare the current element with R0
@R0             // Set address register to R0
D=M-D           // Minus the value
@NEXT           // Set address register to address of NEXT
D;JGT           // Jump to loop

// Move the current element into R0
@R0             // Set address register of R0
M=D             // Store the value into data register into R0 

// Next iteration
@0              // Set address register to 0
D=A             // Store the value of 0 zero into data register
@1              // Set address register to 1
M=M+D           // Add data register value to memory register value
@LOOP           // Set address register to address of loop
0;JMP           // Jump to the loop 

// End of the loop
@END_LOOP       // Set address register to the address of end loop
0;JMP           // Jump to the end loop 

// Variables and Labels
(SIZE)          // SIZE label
@0              // Set address register to 0
M=0             // Store into mem location

(ARR)           // ARR label
@0              // Set address register to 0
M=0             // Store val 0 into mem location

(LOOP)          // Loop label
// Loop condition check: i < size
// If i >= size, exit the loop
(END_LOOP)      // State the end of the end loop
@END_LOOP       // Set address rergister to end loop address 
0;JMP           // Jump to end loop

// ERROR WITHIN LAST LINE -- loop continutes to run thru last line and previous line over and over
