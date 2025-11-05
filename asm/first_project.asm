# 8-Queens Problem - RISC-V Assembly
# This program finds the queen's location for a given cell number (0-63)

.data
    queens: .word 0, 4, 7, 5, 2, 6, 1, 3    
    prompt: .string "Enter the cell number (0 to 63): "
    output: .string "Queen Located on cell "
    by:     .string " by "
    
.text
.globl main

# Main function: Prompts user for cell number and displays the queen's location
# for that cell's column
main:
    la a0, prompt        
    li a7, 4               
    ecall
    
    li a7, 5               
    ecall
    mv s0, a0              
    
    mv a0, s0               
    jal ra, printCell       
    
    li a7, 10          
    ecall

# Function: printCell
# Calculates and prints the queen's row and column for a given cell number
# Arguments: a0 = cell number (0-63)
# Returns: void (prints output)
printCell:
    addi sp, sp, -16      
    sw ra, 12(sp)       
    sw s0, 8(sp)           
    sw s1, 4(sp)        
    sw s2, 0(sp)            
    
    mv s0, a0               
    li t0, 8                
    rem s1, s0, t0          
    
    mv a0, s1        
    jal ra, getRow  
    mv s2, a0             
    
    la a0, output           
    li a7, 4                
    ecall
    
    mv a0, s2              
    li a7, 1               
    ecall
    
    la a0, by           
    li a7, 4           
    ecall
   
    mv a0, s1          
    li a7, 1     
    ecall
  
    lw s2, 0(sp)         
    lw s1, 4(sp)          
    lw s0, 8(sp)
    lw ra, 12(sp)     
    addi sp, sp, 16     
    
    jr ra

# Function: getRow
# Returns the row position of the queen in the given column
# Arguments: a0 = column number (0-7)
# Returns: a0 = row number where queen is located
getRow:
    addi sp, sp, -4         
    sw s0, 0(sp)            
    
    mv s0, a0       
    
    la t0, queens      
    slli t1, s0, 2       
    add t0, t0, t1          
    lw a0, 0(t0)            
    
    lw s0, 0(sp)         
    addi sp, sp, 4       
    
    jr ra