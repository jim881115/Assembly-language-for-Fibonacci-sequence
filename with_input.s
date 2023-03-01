.text
.globl main

main:
        li     $v0,   5        		#輸入n
	syscall

        move   $a1,   $v0		#a1=n
        blt    $a1,   2,   done		#n<2的話,done

        li     $t0,   0			#初始值第0項和第1項
        li     $t1,   1
	li     $v0,   1			#因為n>=2,先print第0項和第1項
	li     $a0,   0
        syscall
	li     $v0,   4
	la     $a0,   space
        syscall
	li     $v0,   1
	li     $a0,   1
        syscall
      
fib:    add    $t2,   $t0,  $t1		#fin(n)=fin(n-1)+fin(n-2)
        move   $t0,   $t1        	#更新,t0=t1
        move   $t1,   $t2        	#t1=t2
        sub    $a1,   $a1,  1		#n--

	sw     $t2,   result		#print fib(n)
	li     $v0,    4
	la     $a0,    space
        syscall
        move    $a0,   $t2   
        li     $v0,    1
        syscall
	bgt    $a1,   1,    fib		#還有n>1項要算的話,fib
	beq    $a1,   1,    exit

done:	li     $v0,   1			#n= =1||n= =0,print 0
	li     $a0,   0
        syscall
	li     $v0,   4
	la     $a0,   space
        syscall
	beq    $a1,    0,   exit	#n= =1
	li     $v0,   1			#print 1
	li     $a0,   1
        syscall

exit:	li     $v0,    4
	la     $a0,    nextline
        syscall
	li     $v0,    10
        syscall				#結束

.data
result: .word  0
space:   .asciiz  " "
nextline: .asciiz "\n"