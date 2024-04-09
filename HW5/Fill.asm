(CHECK)
@KBD		// A = @KBD (Memory reference for the keyboard).
D=M      	// D = RAM[@KBD] (Saving the input from the keyboard in register D).
@BLACK		// A = @BLACK.
D;JGT		// if D (the keyboard value) value 
				//is greater than 0, jump to (BLACK).
@WHITE 		// A = @WHITE.
0;JMP		// else jump to (WHITE).

(BLACK)		// Turning the screen black.
@24576		// A = @24576.	
D=M			// D = RAM[@24576].
@Position	// A = @Position.
			// if @Position is at the max of the screen, do nothing.
D=D-M		// RAM[@24576] = RAM[@24576] - @Position.
@CHECK		// A = @CHECK.
D;JEQ		// if((RAM[@24576] - @Position) == 0), jump to (CHECK).
			// else start to blacken the screen.
@Position   // A = @Position.
A=M			// A = RAM[@Position].
M=-1		// RAM[@Position] = -1.

			// Going to the next position.
@Position	// A = @Position
D=M+1		// D = RAM[@Pasition] + 1.
@Position	// A = @Position.
M=D			// RAM[@Position] = RAM[@Position] + 1.

@CHECK		// A = @CHECK.
			// Run a check to make sure the user is still holding the key.
0;JMP		// Jump to (CHECK).

(WHITE)		// Turning the screen white. 
			// if @Position is at the left top of the screen, do nothing.
@SCREEN		// A = @SCREEN.
D=A-1    	// D = @SCREEN - 1.
			// if it is D=A there will be a line on the left top of the screen 
					//that can not be removed.
@Position	// A = @Position.
D=D-M		// D = (@SCREEN - 1) - RAM[@Position].
@CHECK		// A = @CHECK.
D;JEQ		// if(D == 0), Jump to (CHECK).
			// else start to whiten the screen.
			
@Position	// A = @Position
M=0			// RAM[@Position] = 0.

			// Draw back the position.
@Position	// A = @Position.
D=M-1		// D = RAM[@Position] - 1.
@Position	// A = @Position.
M=D			// RAM[@Position] = RAM[@Position] - 1.

			// Check if there is was any key pressed by the user.
@CHECK		// A = @CHECK.
0;JMP		// Jump to (CHECK).