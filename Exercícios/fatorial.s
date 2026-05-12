.global main

.data
    msg_in:     .asciz "Digite um número: "
    msg_out:        .asciz "\nO fatorial desse número é %lld\n"
    fmt:       .asciz "%lld"
    n:      .quad 0

.text
main:
    push %rbp
    
    movq $msg_in, %rdi
    call printf
    movq $fmt, %rdi
    movq $n, %rsi
    call scanf

    movq n, %rdi
    call fatorial

    movq $msg_out, %rdi
    movq %rax, %rsi
    call printf

    pop %rbp
    ret

fatorial:
    push %rbp
    movq %rsp, %rbp
    push %rdi
    push %rbx

    movq $0, %rbx
    movq $1, %rax

comparacao:
    cmp %rbx, %rdi
    jg multiplicacao
    jmp fim

multiplicacao:
    mulq %rdi
    subq $1, %rdi
    jmp comparacao

fim:
    pop %rbx
    pop %rdi
    movq %rbp, %rsp
    pop %rbp 
    ret

