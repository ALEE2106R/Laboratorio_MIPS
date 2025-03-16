# Script 1: Encontrar el número mayor
.data
    mensaje_pedir: .asciiz "Ingrese la cantidad de números a comparar (3-5): "
    mensaje_ingreso: .asciiz "Ingrese un número: "
    mensaje_mayor: .asciiz "El número mayor es: "
    salto_linea: .asciiz "\n"

.text
.globl main
main:
    # Mostrar mensaje de entrada
    li $v0, 4
    la $a0, mensaje_pedir
    syscall
    
    # Leer cantidad de números
    li $v0, 5
    syscall
    move $t0, $v0 # Guardamos la cantidad de números en $t0
    
    # Validar mínimo 3, máximo 5
    li $t1, 3
    blt $t0, $t1, main
    li $t1, 5
    bgt $t0, $t1, main
    
    # Leer números y encontrar el mayor
    li $t2, 0  # Contador de números
    li $t3, -2147483648  # Inicializar con el menor número posible
loop:
    beq $t2, $t0, end_loop
    
    # Mostrar mensaje de ingreso
    li $v0, 4
    la $a0, mensaje_ingreso
    syscall
    
    # Leer número
    li $v0, 5
    syscall
    
    # Comparar con el mayor actual
    bgt $v0, $t3, actualizar_mayor
    j siguiente

actualizar_mayor:
    move $t3, $v0

siguiente:
    addi $t2, $t2, 1
    j loop

end_loop:
    # Mostrar resultado
    li $v0, 4
    la $a0, mensaje_mayor
    syscall
    
    li $v0, 1
    move $a0, $t3
    syscall
    
    li $v0, 10
    syscall