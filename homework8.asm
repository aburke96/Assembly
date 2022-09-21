section .data

    arr1 db -2,-1,0,1,2
    len equ $-arr1
    p db 0 ; positive
    n db 0 ; negative 
    pLen equ $-p
    nLen equ $-n

section .text

    global _start

    _start:
        mov eax, 0
        mov edx, 0
        mov ebx, arr1
        mov ecx, 5
   
    count:
        cmp byte [ecx], 0
        jz print
        jns pos
        js non_pos

    non_pos:
        inc eax
        inc ebx
        dec ecx
        jmp count
    
    pos:
        inc eax
        inc ebx
        dec ecx
        jmp count 

    print:
        mov ecx, 5
        sub ecx, eax
        add eax, 0
        mov [n], ecx ; positive 
        add ecx, 0
        mov [p], eax ; negative 
        mov eax, 4
        mov ebx, 1
        mov ecx, n
        mov edx, nLen ; neg length 
        mov ecx, p
        mov edx, pLen ; pos length 
        int 80h
        
        
        
    