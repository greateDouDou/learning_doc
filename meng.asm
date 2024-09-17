                    includelib      kernel32.lib
ExitProcess         proto
                    .code ; code section
asmmain                proc
                    sub             rsp,8
                    mov             rcx,1 ; pass peremeter to ExitProcess; 传参数
                    call            ExitProcess
                    add             rsp,8
asmmain                endp
                    end    