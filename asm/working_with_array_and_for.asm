.data
v: .half 5, 7, 1, 5, 4
newline: .string "\n"

.text 
main:
li s0, 0 # s0 = i
li s1, 5 # s1 =_ 5
la s2, v # s2 = v

cond:
 bge s0, s1, enloop # if i >= 5, goto
 endloop

body: 
 slli t1, s0, 1 # t1 = i * 2 - we need to multiply by 2 because we know that each address is 2 bytes away
 add t2, s2, t1 # t2 = [v + (i * 2)]
lh t3 0(t2) # t3 = v[i]

li a7, 1 # Syscall to print an int
mv a0, t3 
ecall

li a7, 4 #Syscall to print a newline
newline
la a0, newline
ecall

addi s0, s0, 1
j cond #back to the loop

endloop:
 li a7, 10
 ecall
