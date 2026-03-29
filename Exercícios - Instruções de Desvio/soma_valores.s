.global main

.data
    num:      .quad 0
    valor_soma:        .quad 0
    soma:     .quad 0
    msg_in:     .asciz "Digite a quantidade de números desejada: "
    msg_soma:   .asciz "%lldº número: "
    fmt:    .asciz "%lld"
    msg_out:    .asciz "\nA soma dos valores digitados é: %lld\n"

.text

main:
    # Recebe a quantidade de números:
    movq $msg_in, %rdi
    call printf

    movq $fmt, %rdi
    movq $num, %rsi
    call scanf

    movq num, %rbx
    movq soma, %r12
    movq $1, %r13

    # Soma os valores até a quantidade ser >= 1
loop:
    cmpq $1, %rbx
    jge soma_valores

    jmp fim

soma_valores:
    movq $msg_soma, %rdi
    movq %r13, %rsi
    call printf

    movq $fmt, %rdi
    movq $valor_soma, %rsi
    call scanf

    movq valor_soma, %r14
    addq %r14, %r12
    incq %r13
    decq %rbx

    jmp loop

fim:
    movq $msg_out, %rdi
    movq %r12, %rsi
    call printf

    movq $60, %rax
    movq $0, %rdi
    syscall
