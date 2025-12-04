.text
main:
    add x0, x0, x0      # Instruction 1: NOP (x0 always stays 0)
    add x16, x1, x2     # Instruction 2: x16 = 1 + 2 = 3
    add x17, x3, x5     # Instruction 3: x17 = 3 + 1 = 4
    sub x18, x17, x16   # Instruction 4: x18 = 4 - 3 = 1
    and x19, x7, x3     # Instruction 5: x19 = 3 AND 3 = 3
    or  x20, x4, x6     # Instruction 6: x20 = 0 OR 2 = 2
    add x21, x8, x9     # Instruction 7: x21 = 0 + 1 = 1
    sub x22, x10, x11   # Instruction 8: x22 = 2 - 3 = -1 = 15
    and x23, x12, x13   # Instruction 9: x23 = 0 AND 1 = 0
    or  x24, x14, x15   # Instruction 10: x24 = 2 OR 3 = 3
