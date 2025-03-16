# Script 3: Serie de Fibonacci
.data
    mensaje_pedir_fib: .asciiz "Ingrese la cantidad de términos de Fibonacci: "
    mensaje_resultado_fib: .asciiz "Serie Fibonacci: "
    mensaje_suma_fib: .asciiz "Suma total: "
    espacio: .asciiz " "
    salto_linea: .asciiz "\n"

.text
.globl main  # Aseguramos que el punto de entrada sea 'main'

main:  # Cambio de 'main_fib' a 'main'
    # Pedir la cantidad de términos
    li $v0, 4
    la $a0, mensaje_pedir_fib
    syscall
    
    # Leer el número ingresado
    li $v0, 5
    syscall
    move $t0, $v0  # Guardamos la cantidad de términos en $t0
    
    # Inicializar variables para Fibonacci
    li $t1, 0  # Primer número de la serie
    li $t2, 1  # Segundo número de la serie
    li $t3, 0  # Contador
    li $t4, 0  # Suma total de la serie
    
    # Mostrar mensaje "Serie Fibonacci: "
    li $v0, 4
    la $a0, mensaje_resultado_fib
    syscall

loop_fib:
    beq $t3, $t0, end_loop_fib  # Si alcanzamos el límite, terminamos
    
    # Imprimir número actual
    li $v0, 1
    move $a0, $t1
    syscall
    
    # Espacio entre números
    li $v0, 4
    la $a0, espacio
    syscall
    
    # Sumar el valor actual a la suma total
    add $t4, $t4, $t1
    
    # Calcular el siguiente número de Fibonacci
    move $t5, $t1  # Guardamos el valor actual
    add $t1, $t1, $t2  # Nuevo término = suma de los dos anteriores
    move $t2, $t5  # Actualizamos el valor anterior
    
    addi $t3, $t3, 1  # Incrementar contador
    j loop_fib  # Repetir el bucle

end_loop_fib:
    # Salto de línea
    li $v0, 4
    la $a0, salto_linea
    syscall
    
    # Mostrar mensaje "Suma total: "
    li $v0, 4
    la $a0, mensaje_suma_fib
    syscall
    
    # Imprimir la suma total
    li $v0, 1
    move $a0, $t4
    syscall
    
    # Terminar programa
    li $v0, 10
    syscall
