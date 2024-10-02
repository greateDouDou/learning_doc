                        includelib              kernel32.lib
GetStdHandle            proto                   
WriteConsoleA           proto
ReadConsoleA            proto
Console                 equ                     -11
Keyboard                equ                     -10
MaxBuf                  =                        20
ExitProcess             proto

                        .code
main                    proc


                        sub                     rsp, 40


                        mov                     rcx, Console
                        call                    GetStdHandle
                        mov                     stdout, rax
                        mov                     rcx, Keyboard
                        call                    GetStdHandle
                        mov                     stdin, rax

                        mov                     rcx, stdout
                        lea                     rdx, msg
                        mov                     r8, lengthof msg
                        lea                     r9, nbwr
                        call                    WriteConsoleA

 nxtlin:                mov	                    rcx,stdin
                        mov                     r8,20
                        lea	                    rdx,keymsg
                        lea	                    r9,nbrd
                        call	                ReadConsoleA

                        lea                     r12,keymsg
                        mov                     r13,nbrd 


inloop:                        lea	                    rdx,keymsg
                        mov	                    r8,1
                        mov                     rdx,r12
                        lea	                    r9,nbwr
                        mov                     rcx, stdout
                        call	                WriteConsoleA

                        mov                     rcx,stdout
                        lea                     rdx,newln
                        mov                     r8,2
                        lea                     r9,nbrd
                        call                    WriteConsoleA
                        inc                     r12
                        dec                     r13
                        jg                      inloop


                        mov                     r8, nbrd
                        cmp                     r8, 2
                        jg                      nxtlin

                        add                     rsp, 40
                        ;mov                     rcx, 0
                        ;call                    ExitProcess

main                    endp


                        .data

msg                    byte                    "Please enter text message: "
keymsg                  byte                    MaxBuf DUP(?)
newln                   byte                    0DH, 0AH
stdout                  qword                   ?
nbwr                    qword                   ?
nbrd                    qword                   ?
stdin                   qword                   ?

                        end