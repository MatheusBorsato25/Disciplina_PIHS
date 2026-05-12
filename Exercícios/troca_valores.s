.global main

.data
    msg1:   .asciz "Digite um valor para rax: "
    msg2:   .asciz "Digite um valor para rbx: "
    msg4:   .asciz "Troca - rax: %lld, rbx: %lld\n"
    fmt:    .asciz "%lld"
    n1:  .quad 0
    n2:  .quad 0

.text
main:

    # Recebe n1 e n2
    movq $msg1, %rdi
    subq $8, %rsp
    call printf
    addq $8, %rsp
    
    movq $fmt, %rdi
    movq $n1, %rsi
    subq $8, %rsp
    call scanf
    addq $8, %rsp

    movq $msg2, %rdi
    subq $8, %rsp
    call printf
    addq $8, %rsp

    movq $fmt, %rdi
    movq $n2, %rsi
    subq $8, %rsp
    call scanf
    addq $8, %rsp

    # Posiciona nos registradores:
    movq n1, %rax
    movq n2, %rbx

    # Troca valores
    call troca_valores    

    # Mostra estado final:
    movq $msg4, %rdi
    movq %rax, %rsi
    movq %rbx, %rdx
    subq $8, %rsp
    call printf
    addq $8, %rsp
    
    movq $60, %rax
    movq $0, %rdi
    syscall

troca_valores:
    push %rbp
    movq %rsp, %rbp
    push %rcx

    # Troca
    movq %rax, %rcx
    movq %rbx, %rax
    movq %rcx, %rbx

    pop %rcx
    movq %rbp, %rsp
    pop %rbp 
    ret

