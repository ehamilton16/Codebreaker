#include <MeggyJrSimple.h>    // Required code, line 1 of 2.
/*

make a struct/array for the code + history  ** DONE **
L/R to change current dot  ** DONE **
U/D to change current color ** DONE (half, do down button) **
A to lock in 
*/

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

int marker = 8;

byte blinker = 0;

int var1 = 0;
int var2 = 0;
int var3 = 0;

boolean dunGuessd = false; // for when player enters guess

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

Point col1[8] = {ca1, ca2, ca3, ca4, ca5, ca6, ca7, ca8};  // initializing array for first column of guesses
Point col2[8] = {cb1, cb2, cb3, cb4, cb5, cb6, cb7, cb8};  // array for second column of guesses
Point col3[8] = {cc1, cc2, cc3, cc4, cc5, cc6, cc7, cc8};  // array for third column of guesses

byte guess[3]; // array for the row for the guess, used for the cursor

void setup()
{
  MeggyJrSimpleSetup();
}

void loop()
{
  lockGuess();
  dunGuessd = false; // sets
  
    drawGame();
  
  do {guessing();} while (dunGuessd == false); // as long as no guess has been made, does guessing method

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
      if (Button_Up);
        
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

    

void memorizeGuess()   // method to save color of guess
{
  for (int x = 0; x < 3; x++) {
    guess[x] = ReadPx(x,0);  // reading the pixel to know which color to save
  }
}

/*  was causing delay for guess changing, problematic :c

void cursorBlink()   // method to blink cursor
  {
   CheckButtonsPress();
   
   if (Button_Right && blinker < 2)  // moves cursor if right button, and doesnt let it go past guessing area
     blinker++;
   
   if (Button_Left && blinker > 0)  // moves cursor if left button, doesnt let it go past guessing area
     blinker--;
     
   DrawPx(blinker,0,FullOn);  // draws cursor
     DisplaySlate();
     delay(200);  // delay for cursor blink
   
   for (int x = 0; x < 3; x++) 
     {
     DrawPx(x,0,guess[x]);  // redraws guess from the array
     }
   DisplaySlate();
   delay(200);  // delay for reshowing guess color
  }
*/

void guessing()  // guessing method
  {
    memorizeGuess();
    //cursorBlink();
    CheckButtonsDown();
   
   if (Button_Right && blinker < 2)  // moves cursor if right button, and doesnt let it go past guessing area
     blinker++;
   
   if (Button_Left && blinker > 0)  // moves cursor if left button, doesnt let it go past guessing area
     blinker--;
    
    if (Button_Up)
    {
      if (blinker == 0)  // if the cursor is on the first dot
      {
        if (col1[0].color < 6)  // defines color limits, only colors 1-6
          col1[0].color++;  // adds one to color value
        else 
          (col1[0].color = 1);  // loops colors back to 1 when you hit color limit
      }
      if (blinker == 1)  // if the cursor is on the second dot
      {
        if (col2[0].color < 6) // defines color limits, only colors 1-6
          col2[0].color++; // adds one to color value
        else (col2[0].color = 1); // loops colors back to 1 when you hit color limit
      }
        
      if (blinker == 2) // if the cursor is on the third dot
      {
        if (col3[0].color < 6) // defines color limits, only colors 1-6
          col3[0].color++; // adds one to color value
        else (col3[0].color = 1); // loops colors back to 1 when you hit color limit
      }
    }
    DrawPx(blinker,0,FullOn);  // draws cursor
     DisplaySlate();
     delay(250);
    for (int x = 0; x < 3; x++) 
     {
     DrawPx(x,0,guess[x]);  // redraws guess from the array
     }
    drawGame(); // displays the newly colored dots
    DisplaySlate();
    delay(250);
  }
    
void lockGuess() // lock in guess method
  {
  CheckButtonsPress();
    if (Button_A)
      {
      dunGuessd = true;
      for (int y = 7; y >= 0; y--) 
      {
        col1[y].color = col1[y-1].color;
        col2[y].color = col2[y-1].color;
        col3[y].color = col3[y-1].color;
        }
      }
      drawGame();
      DisplaySlate();
    //col1[1].color = col1[0].color
  }


