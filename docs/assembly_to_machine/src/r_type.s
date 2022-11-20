

# Base Address for on-board Switches, LED Display, and GPIO in/out
#define GPIO_SWs    0x80001400
#define GPIO_LEDs   0x80001404
#define GPIO_INOUT  0x80001408


# Base Address to Enable and write to display
#define SegEn_ADDR    0x80001038
#define SegDig_ADDR   0x8000103C

#define DELAY 0x100000
# Enables_Reg = 0x80001038
# Digits_Reg = 0x8000103C


.globl main

main: li t0, SegEn_ADDR
      li t1, 0xFC                       # enable regs determines if corresponding digit is on or off
      li t2, 0x71
      sw t1, 0(t0)
      sw t2, 4(t0)
      li t1,GPIO_SWs               # base address of GPIO memory-mapped registers
      li t1, 0xFFFF                # set direction of GPIOs
      sw t1, 8(t1)               # GPIO_INOUT = 0xFFFF

repeat:
        read: li s9, DELAY
                addi s10,s9, 1
                bne s10, s9, read
                lw t2,0(t1)
                srli t1, t1, 16     # shift val to the right by 32 bits

addi t3,t2, 0x3
andi t4, t2, 0x1fe
srli t4, t4,2
li t6, 0xfe00
and t5,t6,t2
srli t5, t5, 9

beq t3, x0, addition
li s2, 0x1
beq t3, s2, subtraction
li s3, 0x2
beq t3, s3, bit_and
li s4, 0x3
beq t3, s4, bit_or

# perform add operation
addition: add s11, t4, t5
         j display_7seg

# perform subraction operation
subtraction: sub s11, t4,t5
             j display_7seg

# perform equals and operation
bit_and: and s11, t4, t5
         j display_7seg

# perform equals or operation
bit_or: or s11, t4, t5
        j display_7seg

display_7seg: sw s11, 4(t0)
                li s10, 0x0
                li s9, DELAY
                delay_display: addi s10, s10, 1
                bne s10, s9, delay_display

j repeat

.end