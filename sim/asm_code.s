addi x5, x0, 8
csrrw x0, mstatus, x5 #mie

addi x1, x0, 1
slli x2, x1, 7    #timer interrupt
slli x3, x1, 11   #external interrupt
add x4, x2, x3    #both timer and external interrupts

csrrw x0, mie, x4  #mtie and meie
csrrw x0, mip, x2  #pending is only timer interrupt

stop:
    j stop