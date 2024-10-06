                        includelib              kernel32.lib
GetStdHandle            proto                   
WriteConsoleA           proto
ReadConsoleA            proto
Keyboard                  =                     -10
MaxBuf                    =                      20
Console                   =                           -11
ExitProcess             proto
v_open                  proto
v_asc1                  proto
v_hex1                  proto


msgout                  macro                   msg
                        lea                     rdx, msg
                        mov                     r8,lengthof msg
                        call                    v_asc
                        endm


disp                    macro                   sub, tail
                        call                    sub
                        msgout                  tail
                        endm


                        .code
main                    proc


                        sub                     rsp, 40


                        call                    v_open
                        mov                     rcx, Keyboard
                        call                    GetStdHandle
                        mov                     stdin, rax

nxtlin:                 msgout                  pmsg

                        mov	                    rcx,stdin
                        mov                     r8,20
                        lea	                    rdx,keymsg
                        lea	                    r9,nbrd
                        call	                ReadConsoleA

                        lea                     r12,keymsg
                        mov                     r13,nbrd 


                        lea	                    r12, keymsg
                        mov                     r13, nbrd
inloop:                 disp                    v_hex1, tab
                        disp                    v_asc1, newln
                        msgout                  newln
                        inc                     r12
                        dec                     r13
                        jg                      inloop


                        mov                     r8, nbrd
                        cmp                     r8, 2
                        jg                      nxtlin

                        add                     rsp, 40
                    

main                    endp

v_asc                   proc    
                        lea                     r9, nbwr
                        mov                     rcx, stdout
                        sub                     rsp, 40
                        call                    WriteConsoleA
                        add                     rsp, 40
                        ret
v_asc                   endp

v_open                  proc
                        mov                     rcx, Console
                        sub                     rsp, 40
                        call                    GetStdHandle
                        add                     rsp, 40
                        mov                     stdout, rax
                        ret
v_open                  endp

v_asc1                  proc
                        mov                     r8, 1
                        lea                     r9, nbwr
                        mov                     rdx, r12
                        mov                     rcx, stdout
                        sub                     rsp, 40
                        call                    WriteConsoleA
                        add                     rsp, 40
                        ret
v_asc1                  endp


                        .data
pmsg                    byte                    "Please enter text message: "
keymsg                  byte                    MaxBuf DUP(?)
newln                   byte                    0DH, 0AH
tab                     byte                    09H
nbrd                    qword                   ?
stdin                   qword                   ?
stdout                  qword                   ?
nbwr                    qword                   ?

                        end