
addi x1, x0, 1
slli x2, x1, 10  # chip select of data memory
addi x3, x0, 3   # data to be stored at data memory

addi x2, x2, 4    # word number
sw x3, 0(x2)