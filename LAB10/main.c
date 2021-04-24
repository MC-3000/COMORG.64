#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <wiringPi.h>
int main (void) {

int array[3] = {0,2,3};

void sigintHandler(int sig_num)
{
    signal(SIGINT, sigintHandler);
    printf("\n Cannot be terminated using Ctrl+C \n");
    fflush(stdout);
}
printf("LED 0-7 by wiringPi\n");
if (wiringPiSetup() == -1) {
printf("Setting up problem ... Abort!");
exit (1);
}
for(int i=0; i<4; i++){
pinMode(array[i], OUTPUT);
}
int NUM[8][3] = {{0,0,0},{0,0,1},{0,1,0},{0,1,1},{1,0,0},{1,0,1},{1,1,0},{1,1,1}};
while(1){
for (int i=0; i<8; i++ ) {
digitalWrite(array[0],NUM[i][0]);
digitalWrite(array[1],NUM[i][1]);
digitalWrite(array[2],NUM[i][2]);
printf("b%d%d%d \n",NUM[i][0],NUM[i][1],NUM[i][2]);
delay(1000);
}
}
return 0;
}

