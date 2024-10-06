v_asc	            proto		
		            .code		
v_hex1	            proc		
		            push	            rbx
	                lea	                rdx,nib2	
	                lea             	rbx,dig	
	                mov	                al,[r12]	
	                shr	                al,4	
	                xlat		
	                mov	                [rdx],al	

	                mov	                al,[r12]	
	                and             	al,1111b	
		            xlat		
	                mov	                [rdx+1],al	

	                mov	                r8,2	
	                call	            v_asc	

	                pop	                rbx
	                ret	

v_hex1	            endp		

v_bin1              proc
                    push                rdi
                    mov                 dl, [r12]
                    lea                 rdi, bits8
                    cld
                    mov                 cl,7
v_bin1              endp

                    .data		
dig	                byte	            "0123456789"	
	                byte	            "ABCDEF"	
nib2	            byte	            2 DUP (?)	
bits8               byte                8 DUP(?)
        	        end		