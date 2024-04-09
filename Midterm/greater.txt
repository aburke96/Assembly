// Find the greatest of the three registers
// Registers: R1, R2, R3
// Put the largest value into R0
// R0 does not need to be initialized

@7          // indicates what value is going into register 1
D=A
@1          // 7 –> R1
M=D         

@11         // indicates what value is going into register 2
D=A
@2          // 11 –> R2
M=D         

@5          // indicates what value is going into register 3
D=A
@3          // 5 –> R3
M=D         

@1          // within R1
D=M         // D = R1
@2
D=D-M       // D = R1 - R2
@IF_1       // jump to IF_1 if R1 >= R2
D;JGE

@2          // within R2
D=M         // D = R2
@3
D=D-M       // D = R2 - R3
@IF_2       // jump to IF_2 if R2 >= R3
D;JGE

@3          // within R3
D=M         // D = R3
@0
M=D         // R0 = R3
@END
0;JMP       // jump to END

(IF_2)
@2          // R2 conditional statement
D=M         // D = R2
@0
M=D         // R0 = R2
@END
0;JMP       // jump to END

(IF_1)
@1          // R1 conditional statement 
D=M         // D = R1
@3
D=D-M       // D = R1 - R3
@IF_3       // jump to IF_3 if R1 >= R3
D;JGE

@3          
D=M         // D = R3
@0
M=D         // R0 = R3
@END
0;JMP       // jump to END

(IF_3)
@1          // R3 conditional statment 
D=M         // D = R1
@0          // else store greatest value into R0
M=D         // R0 = R1

(END)
