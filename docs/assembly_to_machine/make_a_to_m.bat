
::riscv64-unknown-elf-as -c -o build/startup.o src/startup.s -march=rv32i -mabi=ilp32
rmdir -r build
mkdir build
riscv64-unknown-elf-as -c -o build/asm_to_m_code_code.o src/asm_to_m_code.s -march=rv32i -mabi=ilp32
riscv64-unknown-elf-gcc -o build/asm_to_m_code.elf build/asm_to_m_code.o -T linker.ld -nostdlib -march=rv32i -mabi=ilp32
riscv64-unknown-elf-objcopy -O binary --only-section=.data* --only-section=.text* build/asm_to_m_code.elf build/asm_to_m_code.bin
python3 maketxt.py build/asm_to_m_code.bin > build/asm_to_m_code.txt
riscv64-unknown-elf-objdump -S -s build/asm_to_m_code.elf > build/asm_to_m_code.dump