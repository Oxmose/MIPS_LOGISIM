nop # test jalr
nop
nop
beq r0, r0, end
addi r1, r0, 1
addi r3, r1, 2
end: addi r5, r0, 1

addi r1, r1, 3
sw r1, r0, 4
beq r0, r0, notend
sw r1, r0, 5 
lw r2, r0, 4
notend: nop

jalr r7, r0
addi r4, r0, 5
