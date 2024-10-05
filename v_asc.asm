                        includelib              kernel32.lib
GetStdHandle            proto                   
WriteConsoleA           proto
ReadConsoleA            proto
Keyboard                  =                     -10
MaxBuf                    =                      20
ExitProcess             proto
v_asc                   proto
v_open                  proto
v_asc1                  proto


msgout                  macro                   msg
                        lea                     rdx, msg
                        mov                     r8,lengthof msg
                        call                    v_asc
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
inloop:                 call                    v_asc1
                        msgout                  newln
                        inc                     r12
                        dec                     r13
                        jg                      inloop


                        mov                     r8, nbrd
                        cmp                     r8, 2
                        jg                      nxtlin

                        add                     rsp, 40
                        ;mov                    rcx, 0
                        ;call                   ExitProcess

main                    endp

                        .data
pmsg                    byte                    "Please enter text message: "
keymsg                  byte                    MaxBuf DUP(?)
newln                   byte                    0DH, 0AH
nbrd                    qword                   ?
stdin                   qword                   ?

                        end