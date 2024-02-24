.nds
.include ".\include\symbol.s"

.open NDSFileName,0x0
MainNDSFilesize         equ filesize(NDSFileName)
.org MainNDSFilesize
.if     (MainNDSFilesize <= 0x00008000)
    .fill (0x00008000 - MainNDSFilesize),0xFF
    .notice "NDS size is 32KB."
.elseif (MainNDSFilesize <= 0x00010000)
    .fill (0x00010000 - MainNDSFilesize),0xFF
    .notice "NDS size is 64KB."
.elseif (MainNDSFilesize <= 0x00020000)
    .fill (0x00020000 - MainNDSFilesize),0xFF
    .notice "NDS size is 128KB."
.elseif (MainNDSFilesize <= 0x00040000)
    .fill (0x00040000 - MainNDSFilesize),0xFF
    .notice "NDS size is 256KB."
.elseif (MainNDSFilesize <= 0x00080000)
    .fill (0x00080000 - MainNDSFilesize),0xFF
    .notice "NDS size is 512KB."
.elseif (MainNDSFilesize <= 0x00100000)
    .fill (0x00100000 - MainNDSFilesize),0xFF
    .notice "NDS size is 1MB."
.elseif (MainNDSFilesize <= 0x00200000)
    .fill (0x00200000 - MainNDSFilesize),0xFF
    .notice "NDS size is 2MB."
.elseif (MainNDSFilesize <= 0x00400000)
    .fill (0x00400000 - MainNDSFilesize),0xFF
    .notice "NDS size is 4MB."
.elseif (MainNDSFilesize <= 0x00800000)
    .fill (0x00800000 - MainNDSFilesize),0xFF
    .notice "NDS size is 8MB."
.elseif (MainNDSFilesize <= 0x01000000)
    .fill (0x01000000 - MainNDSFilesize),0xFF
    .notice "NDS size is 16MB."
.elseif (MainNDSFilesize <= 0x02000000)
    .fill (0x02000000 - MainNDSFilesize),0xFF
    .notice "NDS size is 32MB."
.elseif (MainNDSFilesize <= 0x04000000)
    .fill (0x04000000 - MainNDSFilesize),0xFF
    .notice "NDS size is 64MB."
.elseif (MainNDSFilesize <= 0x08000000)
    .fill (0x08000000 - MainNDSFilesize),0xFF
    .notice "NDS size is 128MB."
.elseif (MainNDSFilesize <= 0x10000000)
    .fill (0x10000000 - MainNDSFilesize),0xFF
    .notice "NDS size is 256MB."
.elseif (MainNDSFilesize <= 0x20000000)
    .fill (0x20000000 - MainNDSFilesize),0xFF
    .notice "NDS size is 512MB."
.endif

.notice "NDS size (trim) is 0x" + tohex(MainNDSFilesize,8)
.close

