.data
  stringOne: .string "Something"
  stringTwo: .string "Something else"
  stringThree: .string "Something else else"

.text
main:
  jal subProgram


subProgram:
  addi sp, sp, -4 # allocate next space in stack
  sw ra, 0(sp) # strore return address at the tpo of stack

  la a0, stringOne
  li a7, 4
  ecall 
  addi t0, zero, 10
  jal subProgramTwo

  la a0, stringThree
  li a7, 4
  ecall


subProgramTwo:

  la a0, stringTwo

