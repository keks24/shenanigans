#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <wiringPi.h>

int main()
{
    if(wiringPiSetup() == -1)
        exit(1);

    while(true)
    {
        if(digitalRead(7) == 1) 
            printf("On!!\n");

        else
            printf("Off!!\n");

        delay(100);
    }

    return 0;
}
