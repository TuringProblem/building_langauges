#include <stdio.h>

int main() {
  float value1 = 3.5;
  float result = 0;

  if (value1 < 7)
    result = 7 + value1;
  else
    result = value1 / 7;

  printf("%f\n", result);   
}
