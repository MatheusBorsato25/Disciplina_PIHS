.global main

.data
    num:      .quad 0
    msg_in:     .asciz "Digite um número: "
    fmt:    .asciz "%lld"
    msg_out_par:    .asciz "O número %lld é par.\n"
    msg_out_impar:    .asciz "O número %lld é ímpar.\n"

.text

main:
    movq $msg_in, %rdi
    call printf

    movq $fmt, %rdi
    movq $num, %rsi
    call scanf

    movq num, %rax
    movq $2, %rbx
    idivq %rbx

    cmpq $0, %rdx
    jne bloco_impar

    # Bloco - Par
    movq $msg_out_par, %rdi
    movq num, %rsi
    call printf

    jmp fim

bloco_impar:
    movq $msg_out_impar, %rdi
    movq num, %rsi
    call printf

fim:
    movq $60, %rax
    movq $0, %rdi
    syscall


