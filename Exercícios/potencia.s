.global main

.data
    base:      .quad 0
    expoente:        .quad 0
    msg_b:     .asciz "Digite a base inteira (!= 0): "
    msg_exp:   .asciz "Digite o expoente natural: "
    fmt:    .asciz "%lld"
    msg_out:    .asciz "\nResultado: %lld\n"

.text
main:
    push %rbp

    movq $msg_b, %rdi
    call printf
    movq $fmt, %rdi
    movq $base, %rsi
    call scanf

    movq $msg_exp, %rdi
    call printf
    movq $fmt, %rdi
    movq $expoente, %rsi
    call scanf

    movq base, %rdi
    movq expoente, %rsi
    call potencia
    movq %rax, %rsi

    movq $msg_out, %rdi
    call printf

    pop %rbp
    ret

potencia:
    push %rbp
    movq %rsp, %rbp
    
    push %rbx
    push %rcx
    push %r8

    movq $0, %rbx
    movq %rdi, %rcx
    movq %rsi, %r8
    movq $1, %rax

comparacao:
    cmp %rbx, %r8
    jle fim_procedimento
    imulq %rcx
    subq $1, %r8
    jmp comparacao

fim_procedimento:
    pop %r8
    pop %rcx
    pop %rbx
    movq %rbp, %rsp
    pop %rbp
    ret

