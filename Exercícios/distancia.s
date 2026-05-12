.global main
.data
    p1:     .asciz "Ponto 1:"
    p2:     .asciz "Ponto 2:"
    msg_x:     .asciz "\nDigite a coordenada x: "
    msg_y:     .asciz "Digite a coordenada y: "
    msg_out:      .asciz "\nValor da Distância: %.2f\n"
    fmt:    .asciz "%f"

.bss
    .lcomm  x1, 4   
    .lcomm  y1, 4
    .lcomm  x2, 4
    .lcomm  y2, 4
    .lcomm  resultado, 4
.text
main:
    finit
    pushq %rbp

    movq $p1, %rdi
    call printf

    movq $msg_x, %rdi
    call printf
    movq $fmt, %rdi
    movq $x1, %rsi
    call scanf

    movq $msg_y, %rdi
    call printf
    movq $fmt, %rdi
    movq $y1, %rsi
    call scanf 

    movq $p2, %rdi
    call printf

    movq $msg_x, %rdi
    call printf
    movq $fmt, %rdi
    movq $x2, %rsi
    call scanf 

    movq $msg_y, %rdi
    call printf
    movq $fmt, %rdi
    movq $y2, %rsi
    call scanf

    flds x2
    flds x1
    fsub %st(0), %st(1)
    fstps x2  
    fmul %st(0), %st(0)
    flds y2
    flds y1
    fsub %st(0), %st(1)
    fstps y2
    fmul %st(0), %st(0)
    fadd %st(1), %st(0)
    fsqrt

    fsts resultado

    movq $msg_out, %rdi
    movss resultado, %xmm0
    cvtss2sd %xmm0, %xmm0
    movq $1, %rax
    call printf
    
    pop %rbp
    ret

