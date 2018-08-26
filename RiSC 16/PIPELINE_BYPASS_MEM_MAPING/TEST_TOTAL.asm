# ENTER A COMMAND ON KEYBOARD COMPONENT
# commands : 
#       hi : TTY will answer >Hi!
#       d  : TTY will answer >Drawing...
#            DISPLAY will draw a smiley
#            you can type d multiple times to see the smiley scroll down in cycle
# else : TTY will answer ERROR
#

addi    r2, r0, 4
addi    r3, r0, 4
addi    r6, r0, 62
addi    r7, r0, 10
addi    r5, r0, 8

main:   lw r1, r0, 1 #READ KEYBOARD
        nop
        beq r1, r0, main
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
        addi r6, r0, -28 #d
        
        lw r1, r3, 0
        nop
        beq r1, r4, hieval #r1 == h        
        nop
        nop
        
        beq r1, r6, deval #r1 == d
        nop
        nop
        
        beq r0, r0, errorj
        nop
        nop
        
upmain: beq r0, r0, main
        nop
        nop
        
deval:  addi r3, r3, 1
        beq r3, r2, dfunc
        nop
        nop
        beq r0, r0, errorj
        nop
        nop
        
hieval: addi r3, r3, 1
        lw r1, r3, 0
        nop
        beq r1, r5, hievala #r1 == i
        nop
        nop
        
        beq r0, r0, errorj
        nop
        nop 
        
hievala: addi r3, r3, 1
        beq r3, r2, hifunc #r3 == r2
        nop
        nop
        beq r0, r0, errorj
        nop
        nop    
        

        
hifunc: addi r6, r0, 62
        addi r4, r0, -56
        addi r3, r0, 33        
        sw r6, r0, 3 # >
        sw r4, r0, 3 # H
        sw r5, r0, 3 # i
        sw r3, r0, 3 # !       
        sw r7, r0, 3 # endline
        beq r0, r0, endfuncj
        nop
        nop

errorj: beq r0, r0, erj
        nop
        nop
        
upmainsec: beq r0, r0, upmain
        nop
        nop

endfuncj: beq r0, r0, endfunc
        nop
        nop
        
dfunc:  beq r0, r0, writedj
        nop
        nop     
        
backdr: movi    r3, 0x1008
        movi    r4, 0x381c
        movi    r5, 0x3ffc
        movi    r6, 0x1ff8
        movi    r7, 0x0ff0        
        addi r1, r0, 0
        addi r2, r0, 15 
        
clear:  addi r1, r1, 1
        sw      r0, r0, 2
        beq     r1, r2, clear
        nop
        nop
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
        beq     r0, r0, endfunc
        nop
        nop
        
erj:    beq r0, r0, error
        nop
        nop

writedj: beq r0, r0, writed
        nop
        nop

endfunc: addi    r1, r0, 0
        addi    r2, r0, 4
        addi    r3, r0, 4
        addi    r5, r0, 8
        addi    r6, r0, 62
        addi    r7, r0, 10
        beq r0, r0, upmainsec
        nop
        nop      
        
backd:  beq r0, r0, backdr
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
        nop
        nop
        
writed: addi r1, r0, 62  #>
        addi r2, r0, -60 #D
        addi r3, r0, -14 #r
        addi r4, r0, -31 #a
        addi r5, r0, -9  #w
        addi r6, r0, -23 #i
        addi r7, r0, -18 #n
        sw   r1, r0, 3
        addi r1, r0, -25 #g
        sw   r2, r0, 3
        addi r2, r0, 46  #.
        sw   r3, r0, 3
        addi r3, r0, 10  #LF
        sw   r4, r0, 3
        sw   r5, r0, 3
        sw   r6, r0, 3
        sw   r7, r0, 3
        sw   r1, r0, 3
        sw   r2, r0, 3
        sw   r2, r0, 3
        sw   r2, r0, 3
        sw   r3, r0, 3
        beq  r0, r0, backd
        