#include <stdio.h>
#include "include/header.h"

/**
 * @brief Example main to test if the linking of object files works as intended.
 * 
 * @return int 0 on success.
 */
int main() {
    printf("Hello World! %d\n", hFunc(2, 7));
    
    return 0;
}