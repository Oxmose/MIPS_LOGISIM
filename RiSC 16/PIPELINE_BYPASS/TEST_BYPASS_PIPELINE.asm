            beq     r0, r7, main
            nop
            nop
            jalr    r7, r7
            nop
            nop
            

main:       lui     r5, 0x0040      #load 10bit 0x0040 into r5

            addi    r1, r0, 5       #store 5 to r1
            addi    r2, r0, 4       #store 4 to r2
            addi    r3, r0, 0       #store 0 to r3

            nand    r4, r0, r7      #store nand between r0 and r7 in r4

            addi    r0, r0, 0       #nop

            sw      r1, r5, 0       #store r1 into r5 content adress 
            sw      r2, r5, 1       #store r2 into r5 + 1 content adress

mult:       beq     r3, r1, endmult #r3 == r1 ? endmult : continue
            nop
            nop
            add     r6, r6, r2      #r6 = r6 + r2
            addi    r3, r3, 1       #++r3
            beq     r0, r0, mult    #dummy goto, for test purposes only
            nop
            nop

endmult:    sw      r6, r0, 0       #store result of mult into 0x0000
            lw      r3, r0, 0       #load result of mult (contained at 0x0000) into r3
            beq     r0, r0, end     #dummy test
            nop
            nop
        
end:        lw      r7, r5, 0       #load r5 adress content into r7
            nop                     # nop to prevent the bypass to load the adress sent by ALU (the bypass will load the mem value)
            add     r6, r7, r2      #store r7 + r2 into r6
            
stop:       jalr    r7, r0          #jump to 0 (for jalr test purposes)

        
#INFOS
#At the end of execution (expected) :
#    Registers:
#        r0 = 0x0000
#        r1 = 0x0005
#        r2 = 0x0004
#        r3 = 0x0014
#        r4 = 0xffff
#        r5 = 0x0040
#        r6 = 0x0009
#        r7 = 0x0023
#    Memory:
#        0x0000 = 0x0014
#        0x0040 = 0x0005
#        0x0041 = 0x0004
        
        


