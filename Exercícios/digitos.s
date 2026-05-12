.global main

.data
    numero:    .quad 0
    msg_in:    .asciz "Digite um número inteiro: "
    msg_out:   .asciz "Dígito: %lld\n"
    fmt:       .asciz "%lld"

.text
main:
    pushq %rbp
    movq %rsp, %rbp

    movq $msg_in, %rdi
    call printf

    movq $fmt, %rdi
    movq $numero, %rsi
    call scanf

    movq numero, %rax
    movq $10, %rbx
    movq $0, %r12 

    cmpq $0, %rax
    jne loop_divisao
    pushq $0
    incq %r12
    jmp exibe_digitos

loop_divisao:
    cmpq $0, %rax
    je exibe_digitos

    xor %rdx, %rdx
    divq %rbx

    pushq %rdx
    incq %r12
    jmp loop_divisao

exibe_digitos:
    cmpq $0, %r12
    je fim

    movq $msg_out, %rdi
    popq %rsi
    xor %rax, %rax
    call printf

    decq %r12
    jmp exibe_digitos

fim:
    movq %rbp, %rsp
    popq %rbp
    ret


    
