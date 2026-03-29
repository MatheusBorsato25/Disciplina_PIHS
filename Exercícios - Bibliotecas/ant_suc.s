.global _start

.data
    fmt:    .asciz "%d"
    msg_input:  .asciz "Digite um número: "
    msg_saida:    .asciz "O sucessor de %d é: %d.\nO antecessor de %d é: %d.\n"

.bss
    num:   .long

.text
_start:

    # Número:
    mov $msg_input, %rdi
    call printf

    mov $fmt, %rdi
    mov $num, %rsi
    call scanf
    
    # Cálculo do Sucessor e Antecessor:
    mov num, %rbx
    mov %rbx, %rax
    add $1, %rax
    mov %rax, %rcx
    mov %rbx, %rax
    sub $1, %rax

    # Resultado:
    mov $msg_saida, %rdi
    mov %rbx, %rsi
    mov %rcx, %rdx
    mov %rbx, %rcx
    mov %rax, %r8
    call printf

    mov $60, %rax
    mov $0, %rdi
    syscall
