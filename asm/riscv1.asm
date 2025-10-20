.data

promptOne: .string "Please enter a value to add: "
promptTwo: .string "Please add another value to add: "
promptThree: .string "The result is: "


.text
main:

addi  a7, zero, 4
la, a0, promptOne
ecall


#This is still reading the a7 address, and it's second parameter Zero, I'm not sure about yet, but the 5 is the system call to read the interger that is being passed
addi a7, zero, 5
ecall
mv s1, a0

li a7, 10
ecall

