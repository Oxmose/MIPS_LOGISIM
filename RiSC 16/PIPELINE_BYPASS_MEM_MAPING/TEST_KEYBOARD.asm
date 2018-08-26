# ENTER A COMMAND ON KEYBOARD COMPONENT
# command : hi : TTY will answer >Hi!
# else : TTY will answer ERROR
#

addi    r2, r0, 4
addi    r3, r0, 4
addi    r6, r0, 62
addi    r7, r0, 10
addi    r5, r0, 8

main:   lw r1, r0, 1 #READ KEYBOARD
        nop
        beq r0, r1, main
        nop
        nop
        beq r1, r5, bspc
        nop
        nop
        beq r1, r7, eval
        nop
        nop
        
save:   sw r1, r2, 0
        sw r1, r0, 3
        addi r2, r2, 1
        addi r1, r0, 0
        beq r0, r0, main
        nop
        nop 
        
bspc:   beq r2, r3, main
        nop
        nop
        addi r2, r2, -1
        addi r1, r0, 0
        sw r7, r0, 3
        
refresh: beq r3, r2, endrefresh
         nop
         nop
         lw r4, r3, 0
         nop
         nop
         sw r4, r0, 3
         addi r3, r3, 1
         beq r0, r0, refresh
         nop
         nop
        
endrefresh: addi r3, r0, 4
        beq  r0, r0, main
        nop
        nop
        
eval:   sw r7, r0, 3
        addi r4, r0, -24 #h
        addi r5, r0, -23 #i
        
        lw r1, r3, 0
        nop
        beq r1, r4, hieval #r1 == h        
        nop
        nop
        
        beq r0, r0, error
        nop
        nop
        
upmain: beq r0, r0, main
        nop
        nop
        
hieval: addi r3, r3, 1
        lw r1, r3, 0
        nop
        beq r1, r5, hievala #r1 == i
        nop
        nop
        
        beq r0, r0, error
        nop
        nop 
        
hievala: addi r3, r3, 1
        beq r3, r2, hifunc #r3 == r2
        nop
        nop
        beq r0, r0, error
        nop
        nop        

hifunc: addi r4, r0, -56
        addi r3, r0, 33
        sw r6, r0, 3 # >
        sw r4, r0, 3 # H
        sw r5, r0, 3 # i
        sw r3, r0, 3 # !       
        sw r7, r0, 3 # endline
        beq r0, r0, endfunc
        nop
        nop

endfunc: addi    r1, r0, 0
        addi    r2, r0, 4
        addi    r3, r0, 4
        addi    r5, r0, 8
        beq r0, r0, upmain
        nop
        nop
        
error:  addi r1, r0, -59
        addi r2, r0, -46
        addi r3, r0, -49
        sw r1, r0, 3
        sw r2, r0, 3
        sw r2, r0, 3
        sw r3, r0, 3
        sw r2, r0, 3
        sw r7, r0, 3
        beq r0, r0, endfunc
        