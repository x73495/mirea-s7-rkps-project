1 PRINT TAB(27);"BIG6"
2 PRINT TAB(20);"CREATIVE COMPUTING"
3 PRINT TAB(18);"MORRISTOWN, NEW JERSEY"
4 PRINT:PRINT:PRINT
10 PRINT "  THIS PROGRAM IS A DICE WHEEL GAME IN WHICH"
20 PRINT "YOU CAN BET ON ANY NUMBER BETWEEN ONE AND SIX"
30 PRINT "AND UP TO THREE NUMBERS."
40 PRINT "  THE HOUSE LIMIT IS FROM $1 TO $500!!"
50 PRINT "TO END THIS PROGRAM TYPE THE WORD 'STOP'."
60 PRINT "GOOD LUCK!"
65 PRINT:PRINT
67 DIM S(3)
70 GOTO 90
80 PRINT "YOU CANNOT BET ON LESS THAN ONE OR MORE THAN THREE NUMBERS."
90 PRINT "HOW MANY NUMBERS DO YOU WANT TO BET ON";
100 INPUT N$:IF N$="STOP" THEN 3360
110 N=VAL(N$)
120 IF N=2 THEN 370
130 IF N=3 THEN 600
140 IF N>3 OR N<1 THEN 80
190 PRINT "WHAT NUMBER";
200 INPUT V
210 IF V<=6 OR V>=1 THEN 260
240 PRINT "YOU CAN ONLY BET ON AN INTEGER FRON ONE TO SIX."
250 GOTO 190
260 PRINT "WAGER";
270 INPUT F
280 IF F<=500 OR F >=1 THEN 330
310 PRINT "THE HOUSE LIMIT IS FROM $1 TO $500"
320 GOTO 260
330 GOSUB 1870
340 S2=V:S3=F:GOSUB 2060
360 GOTO 3260
370 PRINT "WHAT TWO NUMBERS";
380 INPUT V,P
390 IF V<=6 OR V>=1 OR P<=6 OR P>=1 THEN 460
440 PRINT "YOU CAN ONLY BET ON AN INTEGER FROM ONE TO SIX."
450 GOTO 370
460 PRINT "WAGER ON BOTH";
470 INPUT F,I
480 IF F<=500 OR F>=1 OR I<=500 OR I>=1 THEN 550
530 PRINT "THE HOUSE LIMIT IS FROM $1 TO $500."
540 GOTO 460
550 GOSUB 1870
560 S2=V:S3=F:GOSUB 2060
570 S2=P:S3=I:GOSUB 2060
590 GOTO 3260
600 PRINT "WHAT THREE NUMBERS";
610 INPUT V,P,S
620 IF V<=6 OR V>=1 OR P<=6 OR P>=1 OR S<=6 OR S>=1 THEN 710
690 PRINT "YOU CAN ONLY BET ON AN INTEGER FROM ONE TO SIX."
700 GOTO 600
710 PRINT "WAGER ON EACH OF THE THREE";
720 INPUT F,I,J
730 IF F<=500 OR F>=1 OR I<=500 OR I>=1 OR J<=500 OR J>=1 THEN 820
800 PRINT "THE HOUSE LIMIT IS FROM $1 TO $500."
810 GOTO 710
820 GOSUB 1870
830 S2=V:S3=F:GOSUB 2060
840 S2=P:S3=I:GOSUB 2060
850 S2=S:S3=J:GOSUB 2060
870 GOTO 3260
1870 X=-1
1880 A=INT(6*RND(1)+1):B=INT(6*RND(1)+1):C=INT(6*RND(1)+1)
1890 S(1)=A:S(2)=B:S(3)=C
1900 FOR Y=1 TO 2
1910 FOR X=1 TO 3-Y
1920 IF S(X)<=S(X+1) THEN 1940
1930 TE=S(X):S(X)=S(X+1):S(X+1)=TE
1940 NEXT X:NEXT Y
1950 PRINT "THE LUCKY NUMBERS ARE: "S(1);S(2);S(3)
1960 RETURN
2060 C1=0
2070 IF S2=A THEN C1=C1+1
2080 IF S2=B THEN C1=C1+1
2090 IF S2=C THEN C1=C1+1
2100 IF C1>0 THEN 2130
2110 S3=S3*(-1)
2120 PRINT "YOU LOSE ON: ";S2:GOTO 2150
2130 S3=S3*C1
2140 PRINT "YOU WIN ";C1;" TIMES ON:"S2
2150 W=W+S3
2160 RETURN
3260 IF W=0 THEN PRINT "YOU'RE EVEN!!":PRINT:GOTO 90
3270 IF W>0 THEN PRINT "YOU'RE AHEAD $";W:PRINT:GOTO 90
3280 IF W<0 THEN PRINT "YOU'RE BEHIND $";W:PRINT:GOTO 90
3350 REM
3360 PRINT:PRINT:PRINT "SO YOU WANT TO CASH IN YOUR CHIPS, I SEE!!"
3370 IF W>0 THEN 3410
3380 PRINT "YOU DIDN'T WIN ANY MONEY, BUT I'M WILLING TO CALL IT EVEN!!"
3390 GOTO 3440
3410 PRINT "YOU WON EXACTLY $";W;"!! NOT BAD !!!"
3440 END