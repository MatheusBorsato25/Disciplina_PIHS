.global main

.data
    num1:      .quad 0
    num2:      .quad 0
    msg_in:     .asciz "Digite um número: "
    fmt:    .asciz "%lld"
    msg_out:    .asciz "Números digitados em ordem não decrescente: %lld, %lld.\n"

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

    movq num1, %rsi
    movq num2, %rdx

    # Compara os números:
    cmpq %rsi, %rdx
    jl troca_numeros

    jmp fim

troca_numeros:

    movq %rsi, %rbx
    movq %rdx, %rsi
    movq %rbx, %rdx

fim:
    movq $msg_out, %rdi
    call printf

    movq $60, %rax
    movq $0, %rdi
    syscall
