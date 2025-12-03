# @author Andrew
# @since 2025-11-11
.data
prompt1:    .string "Enter first operand: "
prompt2:    .string "Enter second operand: "
result_msg: .string "The result is "
newline:    .string "\n"

.text
main:
    addi sp, sp, -4
    sw ra, 0(sp)
    
    la a0, prompt1
    li a7, 4
    ecall
    
    li a7, 5
    ecall
    mv t0, a0           # Save first operand in t0
    
    la a0, prompt2
    li a7, 4
    ecall
    
    li a7, 5
    ecall
    mv t1, a0           # Save second operand in t1
    
    mv a0, t0
    mv a1, t1
    jal ra, product
    mv t2, a0           # Save result
    
    la a0, result_msg
    li a7, 4
    ecall
    
    mv a0, t2
    li a7, 1
    ecall
    
    la a0, newline
    li a7, 4
    ecall
  
    lw ra, 0(sp)
    addi sp, sp, 4
    li a0, 0
    li a7, 10
    ecall

# sum(a, b) - Returns a + b
# Arguments: a0 = a, a1 = b
# Returns: a0 = a + b
sum:
    add a0, a0, a1
    ret

# product(a, b) - Returns a * b using repeated addition
# Handles negative numbers correctly
# Arguments: a0 = a, a1 = b
# Returns: a0 = result
product:
    addi sp, sp, -20
    sw ra, 16(sp)
    sw s0, 12(sp)
    sw s1, 8(sp)
    sw s2, 4(sp)
    sw s3, 0(sp)
    
    mv s0, a0           # s0 = a
    mv s1, a1           # s1 = b
    li s3, 0            # s3 = sign flag (0 = positive, 1 = negative)
    
    bge s0, zero, check_b
    sub s0, zero, s0    # Make a positive
    xori s3, s3, 1      # Flip sign flag
    
check_b:
    bge s1, zero, do_multiplication
    sub s1, zero, s1    # Make b positive
    xori s3, s3, 1      # Flip sign flag
    
do_multiplication:
    li s2, 0            # s2 = result = 0
    li t0, 0            # t0 = i = 0
    
product_loop:
    bge t0, s0, product_done    # if i >= a, exit loop
    
    mv a0, s2
    mv a1, s1
    jal ra, sum
    mv s2, a0           # Update result
    
    addi t0, t0, 1      # i++
    j product_loop
    
product_done:
    beq s3, zero, return_result
    sub s2, zero, s2    # Negate result
    
return_result:
    mv a0, s2           # Return result
    
    lw s3, 0(sp)
    lw s2, 4(sp)
    lw s1, 8(sp)
    lw s0, 12(sp)
    lw ra, 16(sp)
    addi sp, sp, 20
    ret
