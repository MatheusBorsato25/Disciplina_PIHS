.global main

.data
    num1:      .quad 0
    num2:      .quad 0
    num3:      .quad 0
    msg_in:     .asciz "Digite um número: "
    fmt:    .asciz "%lld"
    msg_out:    .asciz "Números digitados em ordem não decrescente: %lld, %lld, %lld.\n"

.text

main:
    # Recebe os números:
    movq $msg_in, %rdi
    call printf

    movq $fmt, %rdi
    movq $num1, %rsi
    call scanf

    movq $msg_in, %rdi
    call printf

    movq $fmt, %rdi
    movq $num2, %rsi
    call scanf

    movq $msg_in, %rdi
    call printf

    movq $fmt, %rdi
    movq $num3, %rsi
    call scanf

    movq num1, %rsi
    movq num2, %rdx
    movq num3, %rcx

    # Comparações:
primeira_comparacao:
    cmpq %rsi, %rdx
    jge segunda_comparacao
    
    movq %rsi, %rbx
    movq %rdx, %rsi
    movq %rbx, %rdx

segunda_comparacao:
    cmpq %rdx, %rcx
    jge terceira_comparacao

    movq %rdx, %rbx
    movq %rcx, %rdx
    movq %rbx, %rcx

terceira_comparacao:
    cmpq %rsi, %rdx
    jge fim

    movq %rsi, %rbx
    movq %rdx, %rsi
    movq %rbx, %rdx

fim:
    movq $msg_out, %rdi
    call printf

    movq $60, %rax
    movq $0, %rdi
    syscall
