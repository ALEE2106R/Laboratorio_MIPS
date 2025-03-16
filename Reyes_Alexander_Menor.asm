# Script 2: Encontrar el número menor
.data
    mensaje_pedir_menor: .asciiz "Ingrese la cantidad de números a comparar (3-5): "
    mensaje_ingreso_menor: .asciiz "Ingrese un número: "
    mensaje_menor: .asciiz "El número menor es: "

.text
.globl main  # Define la etiqueta global correctamente

main:  # La etiqueta debe ser 'main', no 'main_menor'
    li $v0, 4
    la $a0, mensaje_pedir_menor
    syscall
    
    li $v0, 5
    syscall
    move $t0, $v0 
    
    li $t1, 3
    blt $t0, $t1, main
    li $t1, 5
    bgt $t0, $t1, main
    
    li $t2, 0
    li $t3, 2147483647 
loop_menor:
    beq $t2, $t0, end_loop_menor
    
    li $v0, 4
    la $a0, mensaje_ingreso_menor
    syscall
    
    li $v0, 5
    syscall
    
    blt $v0, $t3, actualizar_menor
    j siguiente_menor

actualizar_menor:
    move $t3, $v0

siguiente_menor:
    addi $t2, $t2, 1
    j loop_menor

end_loop_menor:
    li $v0, 4
    la $a0, mensaje_menor
    syscall
    
    li $v0, 1
    move $a0, $t3
    syscall
    
    li $v0, 10
    syscall
