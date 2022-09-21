segment .data
    s db "A", 0
    sLen equ $-s

segment .text
    global _start
    
_start:
    mov byte [s], 0x61

start_loop:
    mov eax, 1
    mov eax, s
    inc byte [s]
    
    
    cmp eax, 5Ah
    jle start_loop
    jg end_loop


end_loop:
    mov eax, 1
    mov ebx, 0
    int 0x80 


