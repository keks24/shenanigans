#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <wiringPi.h>

int main()
{
    if(wiringPiSetup() == -1)
        exit(1);

    pinMode(7, OUTPUT);

    while(true)
    {
        digitalWrite(7, 1);
        printf("LED on.\n");
        delay(1000);
        digitalWrite(7, 0);
        printf("LED off.\n");
        delay(1000);
    }

    return 0;
}
