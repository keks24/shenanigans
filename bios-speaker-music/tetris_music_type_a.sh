#!/bin/bash
C=261
Cis=277
D=293
Dis=311
E=329;
F=349;
Fis=369;
G=391;
Gis=415;
A=440;
Ais=466;
H=493;
tact=1700;

for i in `seq 2`
do
    #sleep $(( tact / 4 / 1000 ))
    sleep 0.425
    beep -f $(( E * 2 )) -l $(( tact / 4 )) 
    beep -f $(( E * 2 )) -l $(( tact / 4 ));
    beep -f $(( H * 1 )) -l $(( tact / 8 ));
    beep -f $(( C * 2 )) -l $(( tact / 8 ));
    beep -f $(( D * 2 )) -l $(( tact / 4 ));
    beep -f $(( C * 2 )) -l $(( tact / 8 ));
    beep -f $(( H * 1 )) -l $(( tact / 8 ));
    beep -f $(( A * 1 )) -l $(( tact / 4 ));
    beep -f $(( A * 1 )) -l $(( tact / 8 ));
    beep -f $(( C * 2 )) -l $(( tact / 8 ));
    beep -f $(( E * 2 )) -l $(( tact / 8 ));
    beep -f $(( E * 2 )) -l $(( tact / 8 ));
    beep -f $(( D * 2 )) -l $(( tact / 8 ));
    beep -f $(( C * 2 )) -l $(( tact / 8 ));
    beep -f $(( H * 1 )) -l $(( tact / 2 )); 
    beep -f $(( C * 2 )) -l $(( tact / 8 ));
    beep -f $(( D * 2 )) -l $(( tact / 4 ));
    beep -f $(( E * 2 )) -l $(( tact / 4 ));
    beep -f $(( C * 2 )) -l $(( tact / 4 ));
    beep -f $(( A * 1 )) -l $(( tact / 4 ));
    beep -f $(( A * 1 )) -l $(( tact / 4 ));
    sleep 0.6375
    #sleep $(( tact / (8 / 3) / 1000 ));
    beep -f $(( D * 2 )) -l $(( tact / 3 ));
    beep -f $(( F * 2 )) -l $(( tact / 8 ));
    beep -f $(( A * 2 )) -l $(( tact / 8 ));
    beep -f $(( A * 2 )) -l $(( tact / 8 ));
    beep -f $(( G * 2 )) -l $(( tact / 8 ));
    beep -f $(( F * 2 )) -l $(( tact / 8 ));
    beep -f $(( E * 2 )) -l $(( tact / 3 ));
    beep -f $(( C * 2 )) -l $(( tact / 8 ));
    beep -f $(( E * 2 )) -l $(( tact / 8 ));
    beep -f $(( E * 2 )) -l $(( tact / 8 ));
    beep -f $(( D * 2 )) -l $(( tact / 8 ));
    beep -f $(( C * 2 )) -l $(( tact / 8 ));
    beep -f $(( H * 1 )) -l $(( tact / 4 ));
    beep -f $(( H * 1 )) -l $(( tact / 8 ));
    beep -f $(( C * 2 )) -l $(( tact / 8 ));
    beep -f $(( D * 2 )) -l $(( tact / 4 ));
    beep -f $(( E * 2 )) -l $(( tact / 4 ));
    beep -f $(( C * 2 )) -l $(( tact / 4 ));
    beep -f $(( A * 1 )) -l $(( tact / 4 ));
    beep -f $(( A * 1 )) -l $(( tact / 4 ));
done
