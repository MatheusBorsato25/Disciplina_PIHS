.global _start

.data
    fmt:    .asciz "%d"
    msg_input:  .asciz "Digite um número: "
    msg:    .asciz "O cubo de %d é: %d\n"

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
    
    # Cálculo do Cubo:
    mov num, %rbx
    mov %rbx, %rax
    mul %rbx
    mul %rbx

    # Resultado:
    mov $msg, %rdi
    mov %rbx, %rsi
    mov %rax, %rdx
    call printf

    mov $60, %rax
    mov $0, %rdi
    syscall
