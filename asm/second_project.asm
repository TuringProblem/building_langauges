.data
    resistors: .word 10, 12, 15, 18, 22, 27, 33, 39, 47, 56, 68, 82, 100, 120, 150, 180, 220, 270, 330, 390, 470, 560, 680, 820, 1000, 1200, 1500, 1800, 2200, 2700, 3300, 3900, 4700, 5600, 6800, 8200, 10000, 12000, 15000, 18000, 22000, 27000, 33000, 39000, 47000, 56000, 68000, 82000, 100000
    
    array_size: .word 49
    
    prompt:         .string "Enter desired resistance (0 to quit): "
    result_msg:     .string "Selected resistor from stock: "
    ohms:           .string " ohms\n"
    negative_msg:   .string "Error: Negative resistance is invalid!\n"
    too_small_msg:  .string "Error: Value is smaller than smallest resistor in stock (10 ohms)\n"
    too_large_msg:  .string "Error: Value is larger than largest resistor in stock (100000 ohms)\n"
    newline:        .string "\n"
    goodbye:        .string "Program terminated.\n"

.text
.globl main

# Main function: Continuously prompts user for resistance values and finds the closest match
# from the resistor stock. Validates input for negative values, out-of-range values, and 
# terminates when user enters 0.
main:
main_loop:
    la a0, prompt
    li a7, 4
    ecall
    
    li a7, 5
    ecall
    mv s0, a0
    
    beqz s0, exit_program
    
    bltz s0, handle_negative
    
    li t0, 10
    blt s0, t0, handle_too_small
    
    li t0, 100000
    bgt s0, t0, handle_too_large
    
    mv a0, s0
    jal ra, find_resistor
    mv s1, a0
    
    la a0, result_msg
    li a7, 4
    ecall
    
    mv a0, s1
    li a7, 1
    ecall
    
    la a0, ohms
    li a7, 4
    ecall
    
    la a0, newline
    li a7, 4
    ecall
    
    j main_loop

handle_negative:
    la a0, negative_msg
    li a7, 4
    ecall
    j main_loop

handle_too_small:
    la a0, too_small_msg
    li a7, 4
    ecall
    j main_loop

handle_too_large:
    la a0, too_large_msg
    li a7, 4
    ecall
    j main_loop

exit_program:
    la a0, goodbye
    li a7, 4
    ecall
    
    li a7, 10
    ecall

# Function: find_resistor
# Searches through the resistor array to find the largest value that does not exceed
# the desired resistance. Returns the closest match from available stock.
# Arguments: a0 = desired resistance value
# Returns: a0 = closest resistor value not greater than input
find_resistor:
    addi sp, sp, -20
    sw ra, 16(sp)
    sw s0, 12(sp)
    sw s1, 8(sp)
    sw s2, 4(sp)
    sw s3, 0(sp)
    
    mv s0, a0
    
    la s1, resistors
    lw s2, array_size
    
    li s3, 10
    li t0, 0
    
find_loop:
    bge t0, s2, find_done
    
    slli t1, t0, 2
    add t2, s1, t1
    lw t3, 0(t2)
    
    bgt t3, s0, skip_update
    
    mv s3, t3
    
skip_update:
    addi t0, t0, 1
    j find_loop
    
find_done:
    mv a0, s3
    
    lw s3, 0(sp)
    lw s2, 4(sp)
    lw s1, 8(sp)
    lw s0, 12(sp)
    lw ra, 16(sp)
    addi sp, sp, 20
    
    jr ra