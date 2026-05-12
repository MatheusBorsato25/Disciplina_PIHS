.global main

.data
    x:    .quad 0
    y:    .quad 0
    msg_x:    .asciz "Digite o limite de X: "
    msg_y:    .asciz "Digite o limite de Y: "
    msg_out_ponto:   .asciz " (%lld, %lld) \n"
    fmt:       .asciz "%lld"

.text
main:
    pushq %rbp

    movq $msg_x, %rdi
    call printf
    movq $fmt, %rdi
    movq $x, %rsi
    call scanf

    movq $msg_y, %rdi
    call printf
    movq $fmt, %rdi
    movq $y, %rsi
    call scanf

    movq x, %r12
    movq y, %r13
    xor %r14, %r14
    xor %r15, %r15

inicio:
    cmp %r14, %r12
    jg loop
    jmp fim
loop:
    incq %r14
    cmp %r15, %r13
    jg loop_interno
    jmp fim
loop_interno:
    incq %r15
    movq $msg_out_ponto, %rdi
    movq %r14, %rsi
    movq %r15, %rdx
    call printf
    cmp %r15, %r13
    jg loop_interno
    xor %r15, %r15
    jmp inicio
fim:
    popq %rbp
    ret


    
