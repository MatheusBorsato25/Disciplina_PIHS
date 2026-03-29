.global _start

.data
    fmt:    .asciz "%d"
    msg_input:  .asciz "Digite um número: "
    msg:    .asciz "\nO produto desses números é: %d\n"
    msg_saida:    .asciz "Número digitado: %d\n"

.bss
    num1:   .long
    num2:   .long

.text
_start:

    # 1º Número:
    mov $msg_input, %rdi
    call printf

    mov $fmt, %rdi
    mov $num1, %rsi
    call scanf
    
    mov $msg_saida, %rdi
    mov num1, %rsi
    mov %rsi, %rbx
    call printf

    # 2º Número:
    mov $msg_input, %rdi
    call printf

    mov $fmt, %rdi
    mov $num2, %rsi
    call scanf
    
    mov $msg_saida, %rdi
    mov num2, %rsi
    mov %rsi, %rax
    mul %rbx
    mov %rax, %rbx
    call printf

    # Resultado:
    mov $msg, %rdi
    mov %rbx, %rsi
    call printf

    mov $60, %rax
    mov $0, %rdi
    syscall
