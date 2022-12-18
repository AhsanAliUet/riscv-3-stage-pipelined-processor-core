j configure
j main
j h1  #timer interrupt handler
j h2  #external interrupt handler

main:
    addi x22, x0, 1
    addi x23, x0, 1
    addi x24, x0, 1
    addi x25, x0, 1
    addi x26, x0, 1
    addi x27, x0, 1
    addi x28, x0, 1
    addi x29, x0, 1
    addi x30, x0, 1
    addi x31, x0, 1
    j exit

h1:
    # lui x1, 0xfffff
    # addi x1, x1, 0xff

    # addi x10, x0, 10
    # xor x10, x10, x1  #toggle x10
    # nop
    addi x20, x0, 20
    mret
h2:
    addi x21, x0, 10
    mret

exit:
    j exit

configure:
    addi x5, x0, 8
    csrrw x0, mstatus, x5 #mie

    addi x1, x0, 1
    slli x2, x1, 7     #timer interrupt enable, mie[7]
    slli x3, x1, 11    #external interrupt enable, mie[11]
    add x4, x2, x3     #both timer and external interrupts

    csrrw x0, mie, x4  #mtie and meie

    j main
