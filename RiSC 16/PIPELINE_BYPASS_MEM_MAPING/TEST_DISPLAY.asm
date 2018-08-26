# DRAW CHECK PATERN
invert: nop
movi    r1, 0xaaaa
movi    r2, 0x5555
movi    r3, 0x1008
movi    r4, 0x381c
movi    r5, 0x3ffc
movi    r6, 0x1ff8
movi    r7, 0x0ff0

sw      r1, r0, 2
sw      r2, r0, 2
sw      r1, r0, 2
sw      r2, r0, 2
sw      r1, r0, 2
sw      r2, r0, 2
sw      r1, r0, 2
sw      r2, r0, 2
sw      r1, r0, 2
sw      r2, r0, 2
sw      r1, r0, 2
sw      r2, r0, 2
sw      r1, r0, 2
sw      r2, r0, 2
sw      r1, r0, 2
sw      r2, r0, 2

#DRAW A SMILEY

sw      r0, r0, 2
sw      r0, r0, 2

sw      r3, r0, 2
sw      r4, r0, 2
sw      r3, r0, 2

sw      r0, r0, 2
sw      r0, r0, 2

sw      r5, r0, 2
movi    r5, 0x07e0

sw      r6, r0, 2
movi    r6, 0x03c0

sw      r7, r0, 2
movi    r7, 0x0180

sw      r5, r0, 2
sw      r6, r0, 2
sw      r7, r0, 2

sw      r0, r0, 2
sw      r0, r0, 2
sw      r0, r0, 2


beq r0, r0, invert