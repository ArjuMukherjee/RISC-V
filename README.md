# RISC-V
Single Cycle RISCV 32I Instruction Set Implementation

## Architecture

<img src="https://github.com/ArjuMukherjee/RISC-V/blob/master/Architecture.png">

## Instructions Tested

| Address | Binary Instruction                       | Assembly            | Description          |
| ------- | ---------------------------------------- | ------------------- | -------------------- |
| 0x04    | `0000000_11001_10000_000_01101_0110011`  | `add x13, x16, x25` | R-type addition      |
| 0x08    | `0100000_00011_01000_000_00101_0110011`  | `sub x5, x8, x3`    | R-type subtraction   |
| 0x0C    | `0000000_00011_00010_111_00001_0110011`  | `and x1, x2, x3`    | R-type bitwise AND   |
| 0x10    | `0000000_00101_00011_110_00100_0110011`  | `or x4, x3, x5`     | R-type bitwise OR    |
| 0x14    | `000000000011_10101_000_10110_0010011`   | `addi x22, x21, 3`  | I-type immediate add |
| 0x18    | `000000000001_01000_110_01001_0010011`   | `ori x9, x8, 1`     | I-type immediate OR  |
| 0x1C    | `000000001111_00101_010_01000_0000011`   | `lw x8, 15(x5)`     | Load word            |
| 0x20    | `000000000011_00011_010_01001_0000011`   | `lw x9, 3(x3)`      | Load word            |
| 0x24    | `0000000_01111_00101_010_01100_0100011`  | `sw x15, 12(x5)`    | Store word           |
| 0x28    | `0000000_01110_00110_010_01010_0100011`  | `sw x14, 10(x6)`    | Store word           |
| 0x2C    | `0_000000_01001_01001_000_0110_0_1100011`| `beq x9, x9, 12`    | Branch if equal      |

