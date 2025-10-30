# Homwork 7

### 1)

Write an asm program for the following C code:

```c

#include <stdio.h>


int main() {
    char name[100];
    printf("Enter your name: ");
    scanf("%s", name); // this stores the input into the name array

    printf("Hello, %s\n", name);
    return 0;
}
```

### 2)

Write an asm program for the following C code:

```cpp
#include <iostream>

int z[8] = { 22, 33, 44, 55, 66, 77, 88, 99 };

int getSum(int a, int b) {
    int result = a + b + z[3];
    return; 
}

int main() {
    int i, j, k;
    std::cout << "Please enter the first value to add: ";
    std::cin >> i;
    std::cout << "Please enter the second value to add: ";
    std::cin >> j;
    k = getSum(i, j);
    std::cout << "The sum is: " << k << std::endl;
}
```


