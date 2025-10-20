.data

promptOne: .string "Please enter a value to add: "
promptTwo: .string "\nPlease add another value to add: "
promptThree: .string "The result is: "
clearConsole: .string "\1bx[H\1bx[2J"


.text
main:




addi  a7, zero, 4 # This part is adding Immediate which is rd = rs1 + SignExt(imm)
la, a0, promptOne # la here is loading a0 (x10 address to the stack) and using promptOne 
ecall



#This is still reading the a7 address, and it's second parameter Zero, I'm not sure about yet, but the 5 is the system call to read the interger that is being passed
addi a7, zero, 5
ecall

addi a7, zero, 1
ecall

mv s1, a0

# Now we grabbing the second value but here is the thing, I want to be able to print out the value before actually storing the value inside of a register 
addi a7, zero 4 # TODO: Figure out how tf to check this in the register - I have la = Load Address, but not sure how loading the address will allow us to sys call it
la, a0, promptTwo
ecall


addi a7, zero, 5
ecall

addi a7, zero, 1
ecall
mv s2, a0

li a7, 10
ecall

