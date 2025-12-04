    .data
value1: .float 35.0
result: .float 0.0

    .text
    .globl main
main:

    flw      f0, value1, t0

    # Load immediate 7.0 into f1
    li       t1, 0x40E00000
    fmv.w.x  f1, t1

    flt.s    t2, f0, f1            # t2 = 1 if f0 < f1
    beq      t2, x0, ELSE         # if t2==0 go to ELSE

THEN:
    # result = 7 + value1
    fadd.s   f2, f1, f0            # f2 = f1 + f0
    fsw      f2, result, t0
    j        END

ELSE:
    # result = value1 / 7
    fdiv.s   f2, f0, f1            # f2 = f0 / f1
    fsw      f2, result, t0

END:
    
    flw      f10, result, t0
    li       a7, 2                # syscall: print float
    ecall

    li       a7, 10               # exit
    ecall
