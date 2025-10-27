.data
src: .string "hello, world"
dst: .space 100

.text
main:
 la s0, src
 la s1, dst
 
 
loop:
 lb t0, 0(s0)
 sb t0, 0(s1)
  
 addi s0, s0, 1
 addi s1, s1, 1
 
cond: 
 beq t0, zero, endloop
 j loop
 
 
endloop:
 li a7, 4
 la a0, dst
 ecall
 
 li a7, 10
 ecall
   
 