.global main

.data
    num:      .quad 0
    res:      .quad 1
    msg_in:     .asciz "Digite um número: "
    fmt:    .asciz "%lld"
    msg_out:    .asciz "%lld! = %lld\n"

.text

main:
    movq $msg_in, %rdi
    call printf

    movq $fmt, %rdi
    movq $num, %rsi
    call scanf

    movq num, %rcx
    movq res, %rax

loop:
    cmpq $1, %rcx
    jg calcula_resultado

    jmp fim

calcula_resultado:
    imulq %rcx
    subq $1, %rcx
    jmp loop

fim:
    movq $msg_out, %rdi
    movq num, %rsi
    movq %rax, %rdx
    call printf

    movq $60, %rax
    movq $0, %rdi
    syscall
