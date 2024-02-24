.nds
.include ".\include\symbol.s"

.open NDSFileName,0x0
arm9offset  equ readu32(NDSFileName, 0x20)
arm9size    equ readu32(NDSFileName, 0x2C)
.org arm9offset + arm9size
    .word 0xDEC00621
    .word 0x00000B5C

.close