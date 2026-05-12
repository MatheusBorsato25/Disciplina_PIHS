.global main

.data
    msg_in:     .asciz "Digite um lado ( > 0 ): "
    fmt:    .asciz "%lld"
    msg_equilatero:     .asciz "Triângulo Equilátero\n"
    msg_isosceles:      .asciz "Triângulo Isósceles\n"
    msg_escaleno:       .asciz "Triângulo Escaleno\n"
    x:      .quad 0
    y:      .quad 0
    z:      .quad 0

.text
main:
    push %rbp
    
    movq $msg_in, %rdi
    call printf
    movq $fmt, %rdi
    movq $x, %rsi
    call scanf

    movq $msg_in, %rdi
    call printf
    movq $fmt, %rdi
    movq $y, %rsi
    call scanf

    movq $msg_in, %rdi
    call printf
    movq $fmt, %rdi
    movq $z, %rsi
    call scanf

    movq x, %rbx
    movq y, %rcx
    movq z, %rdx

    cmp %rbx, %rcx
    jne compara2
    cmp %rbx, %rdx
    jne confirma_isosceles # x = y e x != z
    jmp confirma_equilatero # x = y e x = z

compara2:
    cmp %rbx, %rdx
    je confirma_isosceles # x != y e x = z
    cmp %rcx, %rdx
    je confirma_isosceles # x != y, x != z e y = z 
    jmp confirma_escaleno

confirma_equilatero:
    movq $msg_equilatero, %rdi
    call printf
    jmp fim

confirma_isosceles:
    movq $msg_isosceles, %rdi
    call printf
    jmp fim

confirma_escaleno:
    movq $msg_escaleno, %rdi
    call printf

fim:
    pop %rbp 
    ret

