                        includelib              kernel32.lib
GetStdHandle            proto                   
WriteConsoleA           proto
ReadConsoleA            proto
Console                 equ                     -11
Keyboard                equ                     -10
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
                        lea                     rdx, pmsg
                        mov                     r8, lengthof pmsg
                        lea                     r9, nbwr
                        call                    WriteConsoleA

                        mov	                    rcx,stdin
                        mov                     r8,24
                        lea	                    rdx,keymsg
                        lea	                    r9,nbrd
                        call	                ReadConsoleA

                        lea	                    rdx,keymsg
                        mov	                    r8,nbrd
                        lea	                    r9,nbwr
                        mov                     rcx, stdout
                        call	                WriteConsoleA

                        add                     rsp, 40
                        ;mov                     rcx, 0
                        ;call                    ExitProcess

main                    endp


                        .data

pmsg                    byte                    "Please enter text message: "
keymsg                  byte                    20 DUP(?)
stdout                  qword                   ?
nbwr                    qword                   ?
nbrd                    qword                   ?
stdin                   qword                   ?

                        end