                        includelib                    kernel32.lib
GetStdHandle            proto
WriteConsoleA           proto
Console                 =                           -11

                        .code
v_open                  proc
                        mov                         rcx, Console
                        sub                         rsp, 40
                        call                        GetStdHandle
                        add                         rsp, 40
                        mov                         stdout, rax
                        ret
v_open                  endp


v_asc                   proc    
                        lea                         r9, nbwr
                        mov                         rcx, stdout
                        sub                         rsp, 40
                        call                        WriteConsoleA
                        add                         rsp, 40
                        ret
v_asc                   endp

v_asc1                  proc
                        mov                         r8, 1
                        lea                         r9, nbwr
                        mov                         rdx, r12
                        mov                         rcx, stdout
                        sub                         rsp, 40
                        call                        WriteConsoleA
                        add                         rsp, 40
                        ret
v_asc1                  endp

                        .data
stdout                  qword                       ?
nbwr                    qword                       ?
                        end