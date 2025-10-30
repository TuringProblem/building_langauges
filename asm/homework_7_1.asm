############################################################
# @author: Andrew
# @Since: 20251029
############################################################

.data
prompt:    .string "Enter your name: "
helloMsg:  .string "Hello, "
newline:   .string "\n"
name:      .space 100

.text
.globl main
main:
    la   a0, prompt
    li   a7, 4
    ecall

    la   a0, name
    li   a1, 100
    li   a7, 8
    ecall

    la   a0, helloMsg
    li   a7, 4
    ecall

    la   a0, name
    li   a7, 4
    ecall

    la   a0, newline
    li   a7, 4
    ecall

    li   a7, 10
    ecall
