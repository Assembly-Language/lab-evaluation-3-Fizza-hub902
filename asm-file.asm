INCLUDE Irvine32.inc

.data
msg db "Assembly procedure ended now.", 0
msg1 db "Sum of even values: ", 0
msg2 db "Sum of odd values: ", 0
array SWORD -6, -3, -1, -10, 10, 30, 40, 4  ; Array of 16-bit integers
arraySize DWORD (SIZEOF array) / 2          ; Number of elements in the array
sumEven DWORD 0                             ; Variable for sum of even values
sumOdd DWORD 0                              ; Variable for sum of odd values

.code
sum_values proc
    xor eax, eax                ; Clear EAX (even sum)
    xor edx, edx                ; Clear EDX (odd sum)
    mov esi, OFFSET array       ; Load address of array into ESI
    mov ecx, arraySize          ; Load the number of elements

next_element:
    movsx ebx, WORD PTR [esi]   ; Load current element
    test bx, 1                  ; Check if the number is odd
    jnz add_to_odd
    add eax, ebx                ; Add to even sum
    jmp skip_add

add_to_odd:
    add edx, ebx                ; Add to odd sum

skip_add:
    add esi, 2                  ; Move to next element (SWORD is 2 bytes)
    loop next_element           ; Loop through all elements

    mov sumEven, eax            ; Store the even sum
    mov sumOdd, edx             ; Store the odd sum
    ret
sum_values endp

end
