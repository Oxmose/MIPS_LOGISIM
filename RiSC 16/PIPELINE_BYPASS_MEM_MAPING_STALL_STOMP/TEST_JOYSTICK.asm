#MOVE A PIXEL ON THE SCREEN DEPENDING ON THE JOYSTICK POSITION
#POSITIONS :
#   TOP 
#   CENTER
#   BOTTOM
#   LEFT
#   RIGHT

main: lw r1, r0, 0
movi r2, 0x000f #mask for x coordinates
movi r3, 0x00f0 #mask for y coordinates

movi r6, 0x8000
movi r7, 0x0080

# GET THE X COORDINATES
nand r4, r1, r2
nand r2, r4, r4

addi r4, r0, 4
addi r5, r0, 2

beq r2, r4, left
beq r2, r5, center
addi r2, r0, 1
beq r0, r0, gety

left: movi r2, 0x8000
beq r0, r0, gety

center: movi r2, 0x0080

# GET THE Y COORDINATES

gety: nand r4, r1, r3
nand r3, r4, r4

addi r4, r0, 0
shift: beq r3, r0, endshift
addi r3, r3, -16
addi r4, r4, 1
beq r0, r0, shift
endshift: addi r3, r4, 0

addi r4, r0, 3
addi r5, r0, 2

beq r3, r4, top
beq r3, r5, midle
addi r3, r0, 0
beq r0, r0, draw

top: addi r3, r0, 15
beq  r0, r0, draw

midle: addi r3, r0, 8

draw: nop
# R2 = X, R3 = Y
addi r1, r0, 0
blank: beq r1, r3, drawpoint
sw r0, r0, 2
addi r1, r1, 1
beq r0, r0, blank
drawpoint: sw r2, r0, 2
addi r4, r0, 15
endblank: beq r1, r4, main
addi r1, r1, 1
sw r0, r0, 2
beq r0, r0, endblank

