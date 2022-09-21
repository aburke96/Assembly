section   .text
global _start 
  
_start:   
mov   edx,len 
mov   ecx,msg 
mov   ebx,1 
mov   eax,4 
int   0x80 
  
mov   eax,1 
int   0x80 

section   .data
msg db '––––––––––––––'
n_line DB 0AH,0DH,""
msg1 db 'Hello, world', 0xa 
n_line1 DB 0AH,0DH,""
msg2 db '––––––––––––––'
len equ $ - msg 