############################################################
# @author: Andrew
# @Since: 20251029
############################################################

.data
prompt1:  .string "Please enter the first value to add: "
prompt2:  .string "Please enter the second value to add: "
resultMsg: .string "The result is "
newline:  .string "\n"

z: .word 22,33,44,55,66,77,88,99 


.text
main:
    lui  sp, 0x7fffe
    addi sp, sp, -4

    addi sp, sp, -12
    sw   s0, 0(sp)
    sw   s1, 4(sp)
    sw   s2, 8(sp)

    la   a0, prompt1
    li   a7, 4
    ecall

    li   a7, 5
    ecall
    mv   s0, a0

    la   a0, prompt2
    li   a7, 4
    ecall

    li   a7, 5
    ecall
    mv   s1, a0

    mv   a0, s0
    mv   a1, s1
    jal  getSum
    mv   s2, a0

    la   a0, resultMsg
    li   a7, 4
    ecall

    mv   a0, s2
    li   a7, 1
    ecall

    la   a0, newline
    li   a7, 4
    ecall

    lw   s0, 0(sp)
    lw   s1, 4(sp)
    lw   s2, 8(sp)
    addi sp, sp, 12

    li   a7, 10
    ecall
    
getSum:
    addi sp, sp, -4
    sw   ra, 0(sp)

    la   t0, z
    lw   t1, 12(t0) # We need to grab the [3] element :)

    add  t2, a0, a1
    add  a0, t2, t1

    lw   ra, 0(sp)
    addi sp, sp, 4
    ret
