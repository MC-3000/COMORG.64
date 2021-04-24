#include <stdio.h>
#include <stdlib.h>
#include <wiringPi.h>
#define BUTTON_PIN 29
int time1[3] = {1000,500,250};
int array[3] = {0,2,3};
int NUM[14][3] = {{0,0,0},{0,0,1},{0,1,0},{0,1,1},{1,0,0},{1,0,1},{1,1,0},{1,1,1},{1,1,0},{1,0,1},{1,0,0},{0,1,1},{0,1,0},{0,0,1}};
static volatile int Interrupt1 = 1;
static int counter = 1800;
void myInterrupt(void)
{  Interrupt1++;
    if(Interrupt1==2)
    {
        counter=1800;
    }
    else if(Interrupt1==3)
    {
        counter=1000;
    }
    else if(Interrupt1==4)
    {
        counter=200;
        Interrupt1=1;
    }

    printf("Adjust I = %d C = %d\n",Interrupt1,counter);

}
int main(void)
{
    Interrupt1 = 1;
    wiringPiSetup();
    wiringPiISR(BUTTON_PIN, INT_EDGE_FALLING, &myInterrupt);
    printf("LED 0-7-0 by wiringPi\n");
    printf("Default I = %d C = %d\n",Interrupt1,counter);
    for(int i=0; i<4; i++)
    {
        pinMode(array[i], OUTPUT);
    }
    for(;;)
    {
        for (int i=0; i<14; i++ )
        {
            digitalWrite(array[0],NUM[i][0]);
            digitalWrite(array[1],NUM[i][1]);
            digitalWrite(array[2],NUM[i][2]);
            printf("time: %d binary: b%d%d%d \n",counter,NUM[i][0],NUM[i][1],NUM[i][2]);
            delay(counter);
        }
    }
    return 0;
}

