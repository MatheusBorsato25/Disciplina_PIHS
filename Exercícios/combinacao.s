.global main

.data
    msg1:   .asciz "Vamos calcular o valor de C(n, p)\n"
    msg2:   .asciz "Digite o valor de n: "
    msg3:   .asciz "Digite o valor de p: "
    msg4:   .asciz "\nO resultado é %lld.\n"
    msg5:   .asciz "\nEntrada inválida!\n"
    fmt:    .asciz "%lld"
    n:  .quad 0
    p:  .quad 0

.text
main:

    # Recebe n e p
    movq $msg1, %rdi
    subq $8, %rsp
    call printf
    addq $8, %rsp
    
    movq $msg2, %rdi
    subq $8, %rsp
    call printf
    addq $8, %rsp

    movq $fmt, %rdi
    movq $n, %rsi
    subq $8, %rsp
    call scanf
    addq $8, %rsp
    
    movq $msg3, %rdi
    subq $8, %rsp
    call printf
    addq $8, %rsp

    movq $fmt, %rdi
    movq $p, %rsi
    subq $8, %rsp
    call scanf
    addq $8, %rsp

    # Validação
    movq n, %rbx
    movq p, %rcx
    cmp %rcx, %rbx
    jl entrada_invalida
    cmp $0, %rbx
    jl entrada_invalida
    cmp $0, %rcx
    jl entrada_invalida
    
    # Calcula n!
    movq n, %rdi
    call fatorial
    movq %rax, %r8

    # Calcula p!
    movq p, %rdi
    call fatorial
    movq %rax, %r9

    # Calcula (n - p)!
    movq n, %rdi
    movq p, %rcx
    subq %rcx, %rdi
    call fatorial

    # Calcula a combinação
    imulq %r9
    movq %rax, %r9
    movq %r8, %rax
    movq $0, %rdx
    idivq %r9

    movq $msg4, %rdi
    movq %rax, %rsi 
    subq $8, %rsp
    call printf
    addq $8, %rsp
    
    movq $60, %rax
    movq $0, %rdi
    syscall

fatorial:
    push %rbp
    movq %rsp, %rbp
    push %rbx
    movq $1, %rax
    movq $1, %rbx

loop:
    cmp %rbx, %rdi
    jle end_loop
    imulq %rdi
    decq %rdi
    jmp loop
    
end_loop:
    pop %rbx
    movq %rbp, %rsp
    pop %rbp 
    ret

entrada_invalida:
    movq $msg5, %rdi
    subq $8, %rsp
    call printf
    addq $8, %rsp
    
    movq $60, %rax
    movq $0, %rdi
    syscall
