# ENTER A COMMAND ON KEYBOARD COMPONENT
# commands : 
#       hi : TTY will answer >Hi!
#       d  : TTY will answer >Drawing...
#            DISPLAY will draw a smiley
#            you can type d multiple times to see the smiley scroll down in cycle
# else : TTY will answer ERROR
#
# You can go bakc with backspace, it will erase the last character 
# and print on a new line the command
#

###################### INIT + MAIN ######################
addi    r2, r0, 4   #r2 contains the adress we start to store information
addi    r3, r0, 4   #r3 is equal to r2, it is used for loop purposes
addi    r6, r0, 62  #r6 contains the ascii character ">"
addi    r7, r0, 10  #r7 contains the ascii character "Line Feed"
addi    r5, r0, 8   #r5 contains the ascii character "Backspace"

main:   lw r1, r0, 1        #READ KEYBOARD     
        beq r1, r0, main    #if r1 is empty, go to main
        beq r1, r5, bspc    #if r1 contains the Backspace ascii character, go to bspc
        beq r1, r7, eval    #if r1 cintains the Line Feed ascii character, evaluate a command 
        
###################### END INIT + MAIN ###################### 

        
###################### IF r1 is not empty, not a line feed and not a backspace ######################

save:   sw r1, r2, 0        #save r1 into adress that r2 contains
        sw r1, r0, 3        #display r1 ascii character into TTY
        addi r2, r2, 1      #++r2
        addi r1, r0, 0      #r1 = 0
        beq r0, r0, main    #go to main
        
###################### END SAVE ######################
 

###################### IF r1 is a backspace ######################

bspc:       beq r2, r3, main        #if memory doens't contain anything
            addi r2, r2, -1         #r2 -= 1
            addi r1, r0, 0          #r1 = 0
            sw r7, r0, 3            #display what r7 contains into TTY
        
refresh:    beq r3, r2, endrefresh #if we finished reading all the characters the memory contains
            lw r4, r3, 0           #load the content or memory at adress r3 into r4
            sw r4, r0, 3           #display the last character read from memory
            addi r3, r3, 1         #++r3
            beq r0, r0, refresh    #goto refresh
      
endrefresh: addi r3, r0, 4      #reset r3 value (to 4)
            beq  r0, r0, main   #goto main

###################### END BACKSPACE MANAGEMENT ######################
         

###################### EVALUATE THE COMMAND ######################
eval:   sw r7, r0, 3
        addi r4, r0, -24 #h
        addi r5, r0, -23 #i
        addi r6, r0, -28 #d     
        
        lw r1, r3, 0                    #load a character from keyboard
        
        beq r1, r4, hieval              #if command starts with a h
        beq r1, r6, deval               #if command starts with a d
        beq r0, r0, errorpjump          #else, command is wrong
        
###################### END EVALUATE ######################        
         

###################### DRAWING FUNCTION EVALUATION ######################

deval:  addi r3, r3, 1
        beq r3, r2, writed      #if command length == 1 execute drawing function     
        beq r0, r0, errorpjump  #else display error 
        
###################### END ######################


###################### HI FUNCTION EVALUATION ######################
        
hieval:     addi r3, r3, 1
            lw r1, r3, 0         
            beq r1, r5, hievala #if second letter is a "i" continue evaluation        
            beq r0, r0, errorpjump  #else display error         

hievala:    addi r3, r3, 1
            beq r3, r2, hifunc #if command length == 1 execute hi function         
            beq r0, r0, errorpjump #else display error

###################### END EVALUATION ######################  


###################### HI FUNCTION ######################
#DISPLAY ">HI!" in TTY
#########################################################
        
hifunc: addi r6, r0, 62
        addi r4, r0, -56
        addi r3, r0, 33        
        sw r6, r0, 3    # >
        sw r4, r0, 3    # H
        sw r5, r0, 3    # i
        sw r3, r0, 3    # !       
        sw r7, r0, 3    # endline
        beq r0, r0, endfuncpjump

###################### END HI FUNCTION ######################


###################### FIRST PARTIAL JUMP TO MAIN ######################

mainpjump: beq r0, r0, main

###################### END FIRST PARTIAL JUMP ###################### 

###################### FIRST PARTIAL JUMP TO ENDFUNC ######################

endfuncpjump: beq r0, r0, endfunc

###################### END FIRST PARTIAL JUMP ###################### 


###################### DRAWING FUNCTION ######################
#DRAW A SMILE ON THE DISPLAY
#WRITE ">Drawing..." ON TTY
#########################################################

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
        
   
###################### SECOND PARTIAL JUMP TO MAIN ######################

mainspjump: beq r0, r0, mainpjump

###################### END SECOND PARTIAL JUMP ######################  

###################### FIRST PARTIAL JUMP TO ERROR ######################

errorpjump: beq r0, r0, error

###################### END FIRST PARTIAL JUMP ###################### 
   

###################### WRITE ">Drawing..." INTO TTY ######################

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
        beq  r0, r0, backdr

###################### END WRITE ON TTY ######################

###################### END DRAWING FUNCTION ######################

         
###################### RESET REGISTERS ######################
       
endfunc:    addi    r1, r0, 0
            addi    r2, r0, 4
            addi    r3, r0, 4
            addi    r5, r0, 8
            addi    r6, r0, 62
            addi    r7, r0, 10
            beq r0, r0, mainspjump                           
   
###################### END RESET REGISTER ######################

   
###################### DISPLAY "ERROR" INTO TTY ######################

error:  addi r1, r0, -59    #ASCII : E
        addi r2, r0, -46    #ASCII : R
        addi r3, r0, -49    #ASCII : O
        sw r1, r0, 3
        sw r2, r0, 3
        sw r2, r0, 3
        sw r3, r0, 3
        sw r2, r0, 3
        sw r7, r0, 3
        beq r0, r0, endfunc

###################### END ERROR DISPLAY ######################