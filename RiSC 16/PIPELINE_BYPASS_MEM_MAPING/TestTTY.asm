#PREPARE FOR BONJOUR

addi r1, r0, -62 #B
addi r2, r0, -17 #o
addi r3, r0, -18 #n
addi r4, r0, -22 #j
addi r5, r0, -11 #u
addi r6, r0, -14 #r
addi r7, r0, 8  #BS

# BONJOUR 
sw   r1, r0, 3
sw   r2, r0, 3
sw   r3, r0, 3
sw   r4, r0, 3
sw   r2, r0, 3
sw   r5, r0, 3
sw   r6, r0, 3

# PREPARE FOR BON TEST
addi r4, r0, -12 #t
addi r5, r0, -27 #e
addi r6, r0, -13 #s

# CLEAR BY DEL
sw   r7, r0, 3
sw   r7, r0, 3
sw   r7, r0, 3
sw   r7, r0, 3
sw   r7, r0, 3
sw   r7, r0, 3
sw   r7, r0, 3

addi r7, r0, 32 #SPACE

# BON TEST
sw   r1, r0, 3
sw   r2, r0, 3
sw   r3, r0, 3

sw   r7, r0, 3

sw   r4, r0, 3
sw   r5, r0, 3
sw   r6, r0, 3
sw   r4, r0, 3

# NEW LINE
addi r7, r0, 10 #NL
nop
nop
sw   r7, r0, 3

# PREPARE TO 1 + 1 = 2
addi r1, r0, 1
add  r2, r1, r1
addi r3, r0, 43 #+
addi r4, r0, 61 #=

addi r1, r1, 48 #1 ascii
addi r2, r2, 48 #1+1 result in ascii
nop

# DISPLAY 1+1=2
sw r1, r0, 3
sw r3, r0, 3
sw r1, r0, 3
sw r4, r0, 3
sw r2, r0, 3

