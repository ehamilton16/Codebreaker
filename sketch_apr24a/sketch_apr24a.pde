#include <MeggyJrSimple.h>    // Required code, line 1 of 2.
/*

make a struct/array for the code + history
L/R to change current dot
U/D to change current color
A to lock in
*/

int marker = 0;

int var1 = 0;
int var2 = 0;
int var3 = 0;

int col1[] = {0,0,0,0,0,0,0,0};  // initializing array for first column of guesses
int col2[] = {0,0,0,0,0,0,0,0};  // array for second column of guesses
int col3[] = {0,0,0,0,0,0,0,0};  // array for third column of guesses

void setup()
{
  MeggyJrSimpleSetup();
}

void loop()
{
} // closes loop

void updateHistory() //updates the history of guesses
  {                  // basically it copies the guess up one
    col1[marker]=var1;
    col2[marker]=var2;
    col3[marker]=var3;
    marker++;
  }
