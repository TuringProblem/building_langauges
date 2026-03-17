#include <stdio.h>

int main() {
  int *value = malloc(sizeof(int));

  *value = 5;

  printf("%d\n", *value);
  free(value);
  return 0;
}
