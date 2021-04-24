# COMORG.64
LAB10
--main.c
======================================================================================
int NUM[8][3] = {{0,0,0},{0,0,1},{0,1,0},{0,1,1},{1,0,0},{1,0,1},{1,1,0},{1,1,1}}; ///   เก็บตัวแปล binary 3 bit 0-7 
while(1){
for (int i=0; i<8; i++ ) {
digitalWrite(array[0],NUM[i][0]); 
digitalWrite(array[1],NUM[i][1]);
digitalWrite(array[2],NUM[i][2]);
printf("b%d%d%d \n",NUM[i][0],NUM[i][1],NUM[i][2]);
delay(1000);
}
}
