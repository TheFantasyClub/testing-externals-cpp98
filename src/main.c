#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include "testing.h"

int main ( void )
{
  dummy_function();
  testing_external = 1;
  printf("Testing success!\n");
  return EXIT_SUCCESS;
}
