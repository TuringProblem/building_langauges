# Stack

> LIFO (Last In First Out)

in RISC-V, the stack is apart of the memory that goes DOWN, while the HEAP goes up (Heap is for dynamic mem)


> SP = Stack Pointer, the stack pointer will always point to the last occupied location. and if you wanted to put something in the stack you need to move one space down (subtract 4 bytes >> 4) then you can use the store instruction to store the `sw t1 o(sp)`




```
push(5) -> sp >> 4 then put the 5 in stack
push(7)
push(2)
pop() -> take out the 2 then return the stack one place up, adding 4 bytes (<< 4)
push(4)
pop()
pop()
```

### Another example

```

BEFFFAE8 {DATA}: AB000001 <- sp indeces would also start!!!!! AT THE BOTTTTTTTTTTTTTOMMMMMMMMMMMM
Assume you have 4 elements

foo
bar
baz
bum



```

When it comes to function calls, the caller can choose which registers to save in the stack if it would like their values retained.

The called function (callee) on the other hand, has the responsibility of saving any registers code named `s#` and `ra` if it's going to use them

### PRESERVED:

- s0-s11
- ra
- sp

### NON-PRESERVED:
- t0-t6


```asm
addi sp, sp, -4 # making space in the stack
sw t1, 0(sp) # storing the value in the stack
jal foo

...

foo:
addi sp, sp, 4 # making space in the stack
lw t1, 0(sp) # loading the value from the stack
jr ra
```


### EX 2:

```asm

addi sp, sp, -8 # saving space for 2 data items

addi sp, sp, -4 # making space in the stack
sw s0, 0(sp) # storing the value in the stack


add t0, a0, a1
add t1, a2, a3

```

## Conditionals

- Jump and link (jal rd, imm)

> `rd = PC + 4; PC += imm`

- Jump and link register (jalr rd, rs1, imm)

> `rd = PC +4; PC = [rs] + SignExt(imm)`  

--------

<table>
<tr><td>Pseudoinstruction</td><td>Assembly</td>
</tr>

</table>

-------


## **Conditions & loops**

- Conditional Statements
> 


```c
if (i == j) f = g + h;

f = f - i;
```
***Equivalent Assembly***

```asm
so = f, s1 = g, s2 = h
s3 = i, s4 = j

bne s3, s4, l1
add s0, s1, s2

l1: sub s0, s0, s3
```


```c
if (i == j) {
    f = g + h;
} else {
    f = g - I;
}
```

***Equivalent Assembly***

```asm
bne s3, s4a, L1
add s0 ,s1, s2
j done

L1: sub s0, s0, s3

done:
```

-------

## **Loops**

> A loop is just a reflexive statement that repeats itself

```c
int pow = 1;
int x = 0;

while (pow != 128) {
    pow = pow * 2;
    x = x + 1;
}
```

***Equivalent Assembly***

```asm
#s0 = pow, s1 = x

addi s0, zero, 1 #power
add s1, zero, zero #x
addi t0, zero, 128

while: beq s0, t0, done
    slli, s0, s0, 1 # multiplying by 2
    addi, s1, s1, 1 # adding 1 to x
    j while # jumps back to the while loop

done:



``````
### For loop example

```c
int sum = 0;
int i;

for (i = 0; i != 10; i = i + 1) {
    sum = sum + i;
}

```

***Equivalent Assembly***

```asm
#so = i, s1 = suo
addi s1, zero, 0
addi s0,, zero, zero
addi t0, zero, 10

for: beq s0, t0, done


done:
```


-----


# ***Arrays using for loop***


