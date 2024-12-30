INCLUDE Irvine32.inc

.data
array SWORD -6, -3, -1, -10, 10, 30, 40, 4  ; Array of 16-bit integers
arraySize DWORD (SIZEOF array) / 2          ; Number of elements in the array
sumEven DWORD 0                           

.code
asmfunc proc
    xor eax, eax                ; Clear EAX 
    mov esi, OFFSET array       ; Load address of the array into ESI
    mov ecx, arraySize          ; Load the number of elements

next_element:
    movsx ebx, WORD PTR [esi]   ; Load current element
    test bx, 1                  ; Check if the number is even
    jnz skip_add            
    add eax, ebx                ; Add to the even sum

skip_add:
    add esi, 2                  ; Move to the next element
    loop next_element          

    ret                        
asmfunc endp

end
