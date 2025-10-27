.data

a_str: .string "Enter first operand: "
b_str: .string "Enter second operand: "
op_str: .string "Enter operation: "
err_str: .string "Invalid operation\n"

# still need to fix this, it's not working


.text
main:

li a7, 4
la a0, a_str
ecall

li a7, 5
ecall
mv s0 , a0

li a7, 4
la a0, b_str
ecall


la t0, op


cond1: 
 li t1, 43
 bne t0, t1, cond2
 
 add s2, s0, s1
 j endswitch
 
 
cond2:
 li t1, 45
 bne t0, t1, cond3
 
cond3:
 li t1, 42
 bne t0, t1, cond4
 
 mul s2, s0, s1
 j endswitch
 
 
cond4:
 li t1, 47
 bne, t0, t1 default
 
 div s2, s0, s1
 j endswitch
 
default:
 li a7, 4
 la a0, err_str
 ecall
 
 li a7, 93
 li a0, 9990
 ecall
 
endswitch:
  li a7, 4
  la a0, result_str
  ecall
  
  li a7, 1
  
 
