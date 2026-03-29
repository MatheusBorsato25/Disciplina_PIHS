.global _start

.data
    fmt:    .asciz "%d"
    msg_input:  .asciz "Digite um número: "
    msg:    .asciz "\nA soma desses quatro números é: %d\n"
    msg_saida:    .asciz "Número digitado: %d\n"

.bss
    num1:   .long
    num2:   .long
    num3:   .long
    num4:   .long

.text
_start:
    mov $0, %rbx

    # 1º Número:
    mov $msg_input, %rdi
    call printf

    mov $fmt, %rdi
    mov $num1, %rsi
    call scanf
    
    mov $msg_saida, %rdi
    mov num1, %rsi
    add %rsi, %rbx
    call printf

    # 2º Número:
    mov $msg_input, %rdi
    call printf

    mov $fmt, %rdi
    mov $num2, %rsi
    call scanf
    
    mov $msg_saida, %rdi
    mov num2, %rsi
    add %rsi, %rbx
    call printf

    # 3º Número:
    mov $msg_input, %rdi
    call printf

    mov $fmt, %rdi
    mov $num2, %rsi
    call scanf
    
    mov $msg_saida, %rdi
    mov num2, %rsi
    add %rsi, %rbx
    call printf

    # 4º Número:
    mov $msg_input, %rdi
    call printf

    mov $fmt, %rdi
    mov $num2, %rsi
    call scanf
    
    mov $msg_saida, %rdi
    mov num2, %rsi
    add %rsi, %rbx
    call printf

    # Resultado:
    mov $msg, %rdi
    mov %rbx, %rsi
    call printf

    mov $60, %rax
    mov $0, %rdi
    syscall
