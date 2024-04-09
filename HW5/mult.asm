@sum   // value @sum, is now stored in register A.
M=0    // RAM[@sum] is now 0.
@i	   // value @i, is now stored in register A.
M=1    // RAM[@i] is now 1.

(LOOP) // Start of the loop.
@i     // value @i, is now stored in register A.
D=M    // register D is now holding the value RAM[@i].
@R0    // register A is now holding the value @R0.
D=D-M  // register D is now holding the value of @i - RAM[@R0].
@END   // A is now equal to the value @END.
D;JGT  // if(@i-@R0) > 0 jump to (END).

@R1	   // A = @R1.
D=M    // D = RAM[@R1].
@sum   // A = @sum.
M=D+M  // RAM[@sum] += RAM[@R1].
@i	   // A = @i.
M=M+1  // RAM[@i]++.
@LOOP  // A = @LOOP.
0;JMP  // jump to (LOOP).

(END)
@sum   // A = @sum.
D=M	   // D = RAM[@sum].
@R2    // A = @R2.
M=D    // RAM[@R2] = RAM[@sum].