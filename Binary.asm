v_asc                       proto
                            .code
v_bin1                      proc
                            push                        rdi
                            mov                         dl, [r12]
                            lea                         rdi, bits8
                            cld
                            mov                         cl,7

nxtbit:                     mov                         al,dl
                            shr                         al,cl   
                            and                         al,1
                            add                         al,'0'
                            stosb
                            dec                         cl
                            jge                         nxtbit

                            lea                         rdx,bits8
                            mov                         r8,8
                            call                        v_asc

                            pop                         rdi
                            ret
v_bin1                      endp

                            .data
bits8                       byte                        8 DUP(?)
                            end