1 Tool 3
2 Servo On
3 HOpen 1
4 Mov pick, -200
5 Mvs pick
6 Dly 0.1
7 HClose 1
8 Dly 0.1
9 Mov pick, -200
10 End
11 '
12 *SafeStart
13 pt = P_Curr
14 pt.Z = p1.Z
15 Mvs pt
16 Return
p1=(505.740,-5.740,360.550,180.000,0.000,0.000)(7,0)
pick=(361.100,-233.670,44.020,-180.000,0.010,0.000)(7,0)
pt=(500.000,0.000,539.000,180.000,0.000,-180.000)(7,0)
