#PRINCIPIOS DE COMPUTADORES
#ALGORITMO DE EUCLIDES
.data
# Seccion declaracion de datos
enunc:	.asciiz "\n----------- ALGORITMO DE EUCLIDES(m.c.d)----------- ";
op1:		.asciiz "\n Introduzca el primer valor: ";
op2:		.asciiz "\n Introduzca el segundo valor: ";
coc:	.asciiz "\n El cociente es: ";
rest:	.asciiz "\n El resto es: ";
max:	.asciiz "\n El m.c.d es: ";
cociente:	.word 0	#resultado de division dividendo
resto:		.word 0	#resultado de div. resto
mcd:		.word 0	#resultado mcd


.text # Seccion de codigo de usuario
      
		main: # La etiqueta main es el inicio


	li $v0,4	# $v0 = 4 funcion print string
	la $a0,enunc	# Sa0 = direccion de la cadena a imprimir
	syscall
	
	li $v0,4	# $v0 = 4 funcion print string
	la $a0,op1	# Sa0 = direccion de la cadena a imprimir
	syscall
	
	li $v0,5	#cojemos el entero por pantalla
	syscall
	
	move $s0,$v0	#movemos el valor que leemos por pantalla a s0 que sera nuestro op1

	li $v0,4	# $v0 = 4 funcion print string
	la	$a0,op1	# Sa0 = direccion de la cadena a imprimir
	syscall
	
	li $v0,5	#cojemos el entero por pantalla
	syscall

	move $s1,$v0	#movemos el valor que leemos por pantalla a s0 que sera nuestro op2

#-------------------------------
if: blt $s0,$s1,else
	b endif
else:
		move $t0,$s0
		move $s0,$s1		#ponemos en $s0 siempre el mayor de los dos
		move $s1,$t0

endif:


move $t0,$zero


     
	div $s0,$s1
	mflo $t0		#cociente
	mfhi $t1		#resto

while: beq $t1,$zero,endwhile
      
	move $s0,$s1
	move $s1,$t1
	move $s3,$t1		#copia de nuestro resto antes de ser 0
	div $s0,$s1

	mflo $t0	#cociente
	mfhi $t1	#resto
	b while

endwhile:



	sw $t0,cociente
	sw $t1,resto
	sw $s3,mcd

#	li $v0, 4
#	la,$a0,coc #enunc result cociente
#	syscall
      
      

#	li $v0,1
#	lw $a0,cociente #resultado cociente
#	syscall
      

#	li $v0, 4
#	la,$a0,rest #enunc result  div resto
#	syscall
      

#	li $v0,1
#	lw $a0,resto #resultado resto     
#	syscall
      
      

	li $v0, 4     
	la,$a0,max #enunc m.c.d
	syscall      


	li $v0,1      
	lw $a0,mcd #resultado mcd
	syscall
     


 
# se hace una salida limpia del sistema (exit es codigo 10)
      
	li $v0, 10
	syscall 

# END
										
									#CODIGO C++
#int main(){
#int op1,op2,resto,cociente;
#cout<<"\t----------- ALGORITMO DE EUCLIDES(m.c.d)----------- ";
#	cout <<"Introduzca el op1"<<endl;
#	cin>>op1;
#	cout <<"Introduzca el op2"<<endl;
#	cin>> op2;
#	if(op2>op1){
#		int aux=op1;
#		op1=op2;
#		op2=aux;	
#	}
#	int max;
#	resto=op1/op2;
#	cociente=op1%op2;      //resto
#	
#	while(resto!=0){
#	resto=op1/op2;
#	max=resto;
#	cociente=op1%op2;      //resto
#	}
#	
#cout <<"El m.c.d es:"<<max<<endl;
#return 0;
#}
