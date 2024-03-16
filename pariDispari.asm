section .data
msg1 db "Addizione: ", 
len1 equ $ - msg1
msg2 db "Moltiplicazione: ", 
len2 equ $ - msg2
msgOdd db "Il numero è dispari", 0xA
lenOdd equ $ - msgOdd
msgEven db "Il numero è pari", 0xA
lenEven equ $ - msgEven

new_line db 0xA
len3 equ $ - new_line

section .bss
sum resb 1
mol resb 1

section .text
global _start

_start:
mov	eax, 3
mov	ebx, 5

add	eax, ebx
add	eax, '0'
mov	[sum], eax

mov	ecx, msg1
mov	edx, len1
mov	ebx, 1
mov	eax, 4
int	80h

mov	ecx, sum
mov	edx, 1
mov	ebx, 1
mov	eax, 4
int	80h

mov ecx, new_line
mov edx, len3
mov eax, 4
mov ebx, 1
int 80h

mov eax, [sum]
sub eax, 0	
and eax, 1
jz pari1
jnz dispari1

pari1:
mov eax, 4
mov ebx, 1
mov ecx, msgEven
mov edx, lenEven
int 80h
jmp moltiplicazione

dispari1:
mov eax, 4
mov ebx, 1
mov ecx, msgOdd
mov edx, lenOdd
int 80h
jmp moltiplicazione

moltiplicazione:
mov	eax, 3
mov	ebx, 3

mul ebx;
add eax, '0'
mov [mol], eax

mov	ecx, msg2
mov	edx, len2
mov	ebx, 1
mov	eax, 4
int	80h

mov	ecx, mol
mov	edx, 1
mov	ebx, 1
mov	eax, 4
int	80h

mov ecx, new_line
mov edx, len3
mov eax, 4
mov ebx, 1
int 80h

mov eax, [mol]
sub eax, 0	
and eax, 1
jz pari2
jnz dispari2

pari2:
mov eax, 4
mov ebx, 1
mov ecx, msgEven
mov edx, lenEven
int 80h
jmp end

dispari2:
mov eax, 4
mov ebx, 1
mov ecx, msgOdd
mov edx, lenOdd
int 80h
jmp end

end:
mov	eax, 1
mov	ebx, 0
int	80h