
%include "asm_io.inc"

segment .data
shift_left db       "Shifting Left",0
shift_right db      "Shifting Right",0
ashift_left db      "Arithmetic Shifting Left", 0
ashift_right db     "Arithmetic Shifting Right", 0
rshift_left db      "Rotate Shifting Left", 0
rshift_right db     "Rotate Shifting Right", 0
rcshift_left db     "Rotate Shifting Left with Carry", 0
rcshift_right db    "Rotate Shifting Right with Carry", 0
move db             "Move value", 0
andprompt db        "AND operation", 0
orprompt db         "OR operation", 0
xorprompt db        "XOR operation", 0
notprompt db        "NOT operation", 0
clearcarry db       "Clear carry flag", 0

segment .bss
 
segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha

        mov     bx, 0B59DH

        dump_regs 0               ; dump out register values

;========= shifting left
        call    print_nl
        mov     eax, shift_left
        call    print_string
        call    print_nl

        shl     bx, 2
        dump_regs 0               ; dump out register values

;========= shifting right
        call    print_nl
        mov     eax, shift_right
        call    print_string
        call    print_nl

        shr     bx, 1
        dump_regs 0               ; dump out register values  

;========= shifting rotate right
        call    print_nl
        mov     eax, rshift_right
        call    print_string
        call    print_nl

        ror     bh, 2
        dump_regs 1               ; dump out register values  

;========= shifting left
        call    print_nl
        mov     eax, shift_left
        call    print_string
        call    print_nl

        shl     bx, 2
        dump_regs 2               ; dump out register values  

;========= shifting right
        call    print_nl
        mov     eax, shift_right
        call    print_string
        call    print_nl

        shr     bx, 3
        dump_regs 3               ; dump out register values  

;========= rotate shifting left with carry
        call    print_nl
        mov     eax, rcshift_left
        call    print_string
        call    print_nl

        rcl     bh, 3
        dump_regs 4               ; dump out register values  

;========= moving value to ebx register
        call    print_nl
        mov     eax, move
        call    print_string
        call    print_nl

        mov     cl, 2
        dump_regs 5               ; dump out register values

;========= shift right
        call    print_nl
        mov     eax, shift_right
        call    print_string
        call    print_nl

        shr     bx, cl
        dump_regs 6               ; dump out register values  

;========= shift arithmetic right
        call    print_nl
        mov     eax, ashift_right
        call    print_string
        call    print_nl

        sar     bh, 1
        dump_regs 7               ; dump out register values 

;========= rotate shifting right with carry
        call    print_nl
        mov     eax, rcshift_right
        call    print_string
        call    print_nl

        rcr     bh, 4
        dump_regs 8               ; dump out register values  

;========= shift arithmetic left
        call    print_nl
        mov     eax, ashift_left
        call    print_string
        call    print_nl

        sal     bx, 2
        dump_regs 9               ; dump out register values

;========= and operation
        call    print_nl
        mov     eax, andprompt
        call    print_string
        call    print_nl

        and     bl, 0FEEDH
        dump_regs 10               ; dump out register values

;========= shifting rotate right
        call    print_nl
        mov     eax, rshift_right
        call    print_string
        call    print_nl

        ror     bx, 4
        dump_regs 11               ; dump out register values  

;========= shift arithmetic right
        call    print_nl
        mov     eax, ashift_right
        call    print_string
        call    print_nl

        sar     bx, 2
        dump_regs 12               ; dump out register values 

;========= shift arithmetic right
        call    print_nl
        mov     eax, ashift_right
        call    print_string
        call    print_nl

        sar     bl, 3
        dump_regs 13               ; dump out register values 

;========= shifting rotate left
        call    print_nl
        mov     eax, rshift_left
        call    print_string
        call    print_nl

        rol     bx, 2
        dump_regs 14               ; dump out register values  

;========= xor operation
        call    print_nl
        mov     eax, xorprompt
        call    print_string
        call    print_nl

        xor     bx, 0DABBH
        dump_regs 15               ; dump out register values

;========= shifting rotate left
        call    print_nl
        mov     eax, rshift_left
        call    print_string
        call    print_nl

        rol     bl, 3
        dump_regs 16               ; dump out register values  

;========= shifting rotate right
        call    print_nl
        mov     eax, rshift_right
        call    print_string
        call    print_nl

        ror     bx, 3
        dump_regs 17               ; dump out register values  

;========= shifting rotate right
        call    print_nl
        mov     eax, orprompt
        call    print_string
        call    print_nl

        or     bx, 1337H
        dump_regs 18               ; dump out register values  

;========= shifting right
        call    print_nl
        mov     eax, shift_right
        call    print_string
        call    print_nl

        shr     bl, 1
        dump_regs 19               ; dump out register values 

;========= not operation
        call    print_nl
        mov     eax, orprompt
        call    print_string
        call    print_nl

        not     bx
        dump_regs 20               ; dump out register values   

;========= shift rotate right
        call    print_nl
        mov     eax, rshift_right
        call    print_string
        call    print_nl

        ror     bx, 2
        dump_regs 21               ; dump out register values   

;========= clear carry flag
        call    print_nl
        mov     eax, clearcarry
        call    print_string
        call    print_nl

        clc
        dump_regs 22               ; dump out register values

;========= rotate shifting left with carry
        call    print_nl
        mov     eax, rcshift_left
        call    print_string
        call    print_nl

        rcl     bx, 2
        dump_regs 23               ; dump out register values

;========= shifting left
        call    print_nl
        mov     eax, shift_left
        call    print_string
        call    print_nl

        shl     bh, 4
        dump_regs 24               ; dump out register values 

;========= rotate shifting right with carry
        call    print_nl
        mov     eax, rcshift_right
        call    print_string
        call    print_nl

        rcr     bx, 2
        dump_regs 25               ; dump out register values  

        ; exit 

        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret


