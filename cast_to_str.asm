global _start
_start:
    mov eax, 123456
    call cast_to_str

    mov ecx, esi
    mov eax, 4
    mov ebx, 1
    mov edx, 22
    int 0x80

    mov eax, 1
    int 0x80

cast_to_str:
    push ebp
    mov ebp, esp

    loop:
        xor edx, edx
        mov ebx, 10
        div ebx
        add edx, 48

        push edx

        cmp eax, 0
        jne loop

    mov esi, esp

    mov esp, ebp
    pop ebp
    ret