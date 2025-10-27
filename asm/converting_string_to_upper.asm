.data
str: .string "Hello, world!\n"

.text
main:
 la s0, str
 
 
loop_cond:
 lb t1, 0(s0)
 beq t1, zero, endloop
  
cond1:
 li t1, 97
 blt t1, t2, endif
 
cond2:
 li t1, 122
 bgt t1, t2, endif
 
then:
 addi t1, t1, 032
 sb t1, 0(s0)
 
endif:
 addi s0, s0, 1
 j loop_cond
 
endloop:
 li a7, 4
 la a0, str
 ecall
 
 li a7, 10
 ecall
 