#ifndef HEADER_H
#define HEADER_H

// This is an example of a header (.h) file
// In our main.c we link to this header file using:
//      #include "include/header.h"
// We specify the path from our src directory to the header file using <path to header file>/<header file name here>
// since the header.h file is in the include directory we use "include/header.h" (the relative path from src).

int hFunc(int a, int b);

#endif