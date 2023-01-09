
addi x1, x0, 1
slli x2, x1, 11     #chip select of uart
addi x4, x0, 0x12
sw x4, 0(x2)

end:
    j end