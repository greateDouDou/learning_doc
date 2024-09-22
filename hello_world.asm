                        includelib              kernel32.lib
GetStdHandle            proto                   
WriteConsoleA           proto
Console                 equ                     -11
ExitProcess             proto

                        .code
main                    proc
                        sub                     rsp, 40

                        mov                     rcx, Console
                        call                    GetStdHandle
                        mov                     stdout, rax

                        mov                     rcx, stdout
                        lea                     rdx, msg
                        mov                     r8, lengthof msg
                        lea                     r9, nbwr
                        call                    WriteConsoleA

                        add                     rsp, 40
                        ;mov                     rcx, 0
                        ;call                    ExitProcess

main                    endp

                        .data
msg                     byte                    "hello world"
stdout                  qword                   ?
nbwr                    qword                   ?

                        end