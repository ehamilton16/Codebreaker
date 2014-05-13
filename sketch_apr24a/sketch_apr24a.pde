#include <MeggyJrSimple.h>    // Required code, line 1 of 2.
/*

make a struct/array for the code + history
L/R to change current dot
U/D to change current color
A to lock in
*/

int marker = 8;

int var1 = 0;
int var2 = 0;
int var3 = 0;

struct Point // name for the class
{
  int x;
  int y;
  int color;
};

Point ca1 = {0,0,1}; // ca means code a, first column coords
Point ca2 = {0,1,0};
Point ca3 = {0,2,0};
Point ca4 = {0,3,0};
Point ca5 = {0,4,0};
Point ca6 = {0,5,0};
Point ca7 = {0,6,0};
Point ca8 = {0,7,0};

Point cb1 = {1,0,1}; // ca means code b, second column coords
Point cb2 = {1,1,0};
Point cb3 = {1,2,0};
Point cb4 = {1,3,0};
Point cb5 = {1,4,0};
Point cb6 = {1,5,0};
Point cb7 = {1,6,0};
Point cb8 = {1,7,0};

Point cc1 = {2,0,1}; // ca means code c, third column coords
Point cc2 = {2,1,0};
Point cc3 = {2,2,0};
Point cc4 = {2,3,0};
Point cc5 = {2,4,0};
Point cc6 = {2,5,0};
Point cc7 = {2,6,0};
Point cc8 = {2,7,0};

Point g1 = {0,0}; // guess row coords
Point g2 = {1,0};
Point g3 = {2,0};

Point col1[8] = {ca1, ca2, ca3, ca4, ca5, ca6, ca7, ca8};  // initializing array for first column of guesses
Point col2[8] = {cb1, cb2, cb3, cb4, cb5, cb6, cb7, cb8};  // array for second column of guesses
Point col3[8] = {cc1, cc2, cc3, cc4, cc5, cc6, cc7, cc8};  // array for third column of guesses

Point guess[3] = {g1, g2, g3}; // array for the row for the guess, used for the cursor

void setup()
{
  MeggyJrSimpleSetup();
}

void loop()
{
  drawGame();

DisplaySlate();
} // closes loop

void updateHistory() //updates the history of guesses (basically it copies the guess up one spot)
  {                   
    col1[marker].color=var1;
    col2[marker].color=var2;
    col3[marker].color=var3;
    marker++;
  }
  
void changeColor()
  {
    CheckButtonsPress();
      if (Button_Up)
        
  }

void drawGame()
{
  for (int i = 0; i < marker; i++)
  {
    DrawPx(col1[i].x, col1[i].y, col1[i].color);
    DrawPx(col2[i].x, col2[i].y, col2[i].color);
    DrawPx(col3[i].x, col3[i].y, col3[i].color);
  }
}

    
/*

int dotNum
if button right, dotNum ++
if button left, dotNum --
if dotNum > 3, dotNum = 1
if dotNum < 0, dotNum = 3

make array
save three dots to guess array
depending on dotnum, if dotnum == 0, cursor

Draw dotNum,0,CursorColor

delay(..)
Redraw the dots from the array

*/
