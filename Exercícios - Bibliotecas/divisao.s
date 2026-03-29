.global _start

.data
    fmt:    .asciz "%d"
    msg_input:  .asciz "Digite um número: "
    msg_quociente:    .asciz "\nO quociente da divisão de %d por %d é: %d\n"
    msg_resto:    .asciz "O resto da divisão de %d por %d é: %d\n"
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
    mov %rsi, %r12
    call printf

    # 2º Número:
    mov $msg_input, %rdi
    call printf

    mov $fmt, %rdi
    mov $num2, %rsi
    call scanf
    
    mov $msg_saida, %rdi
    mov num2, %rsi
    mov %rsi, %r13
    call printf

    # Cálculo:
    mov $0, %rdx
    mov %r12, %rax
    div %r13
    mov %rdx, %rbx # Salva o resto

    # Resultado:
    mov $msg_quociente, %rdi
    mov %r12, %rsi
    mov %r13, %rdx
    mov %rax, %rcx
    call printf

    mov $msg_resto, %rdi
    mov %r12, %rsi
    mov %r13, %rdx
    mov %rbx, %rcx
    call printf

    mov $60, %rax
    mov $0, %rdi
    syscall
