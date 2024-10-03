                        includelib              kernel32.lib
GetStdHandle            proto                   
WriteConsoleA           proto
ReadConsoleA            proto
Console                   =                     -11
Keyboard                  =                     -10
MaxBuf                    =                      20
ExitProcess             proto

msgout                  macro                   msg
                        lea                     rdx, msg
                        mov                     r8,lengthof msg
                        call                    v_asc
                        endm



                        .code
main                    proc


                        sub                     rsp, 40


                        mov                     rcx, Console
                        call                    GetStdHandle
                        mov                     stdout, rax
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
inloop:                 mov	                    rdx,r12
                        mov                     r8,1
                        call	                v_asc

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



v_asc	                proc
		                lea	                    r9,nbwr	
		                mov	                    rcx,stdout	
		                sub	                    rsp,40	
		                call	                WriteConsoleA	
		                add	                    rsp,40	
	                    ret	
	
v_asc	                endp
        


                        .data
pmsg                    byte                    "Please enter text message: "
keymsg                  byte                    MaxBuf DUP(?)
newln                   byte                    0DH, 0AH
stdout                  qword                   ?
nbwr                    qword                   ?
nbrd                    qword                   ?
stdin                   qword                   ?

                        end