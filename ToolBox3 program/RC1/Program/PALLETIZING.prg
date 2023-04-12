1 Servo On
2 Ovrd 50
3 'Def Pos p_pallet
4 'Def Inte palletizing_columns, palletizing_rows, palletizing_pattern, box_nr ', pallet_def, pallet_nr
5 'pallet_nr = 1
6 'pallet_def% = 1
7 'palletizing_columns% = 3
8 'palletizing_rows% = 4
9 'palletizing_pattern% = 1
10 Def Plt 1, palletizing_start, palletizing_A, palletizing_B, , 3, 4, 1
11 box_nr = 0
12 Mvs point_home
13 GoSub *Safe_start
14 If box_nr < (12) Then
15     GoSub *Palletizing
16 EndIf
17 '-----------------END OF THE PROGRAM-------------------
18 End
19 *Palletizing
20 box_nr = box_nr + 1
21 p_pallet = Plt 1, box_nr
22 Mov p_pallet, -50
23 Mvs p_pallet
24 Return
25 *Safe_start
26 Def Pos safe_point
27 safe_point = P_Curr
28 safe_point.Z = 400
29 Mov safe_point
30 Return
palletizing_start=(+500.10,+259.86,+209.60,+180.00,-0.10,-179.52)(7,0)
palletizing_A=(+500.10,-286.56,+209.60,+180.00,-0.10,-179.52)(7,0)
palletizing_B=(+627.74,+259.86,+209.60,+180.00,-0.10,-179.52)(7,0)
point_home=(+500.10,+0.00,+538.21,+180.00,-0.10,-179.52,+0.00,+0.00)(7,0)
p_pallet=(0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00)(,)
safe_point=(+500.10,-0.00,+400.00,-180.00,-0.10,-179.52,+0.00,+0.00)(7,0)
