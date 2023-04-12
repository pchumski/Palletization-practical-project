1 'Place palletizing program
2 Tool 3
3 Def Inte columns, rows, pattern, curr_layer, max_layer
4 curr_layer% =M_DIn(6013)   'initialize =1   in MAIN
5 box_nr% = M_DIn(6014)      'initialize =1   in MAIN
6 columns% = M_DIn(6004)
7 rows% = M_DIn(6005)
8 pattern% =M_DIn(6011)    '1 - ZigZag     2 - Same direction      3 - arc
9 max_layer% =M_DIn(6012)
10 layer_width% = M_DIn(6015)
11 Def Plt 2, pallet_start, pallet_A, pallet_B, , columns%, rows%, pattern%
12 GoSub *pallet_place
13 End
14 '----------Place from pallet-----------
15 *pallet_place
16 Def Pos put_box
17 put_box = Plt 2, box_nr%
18 put_box.Z = pallet_start.Z + curr_layer%*layer_width% - layer_width%
19 Mov put_box,-200
20 Mvs put_box
21 Dly 0.2
22 HOpen 1
23 Dly 0.2
24 Mov put_box, -50
25 Dly 0.2
26 box_nr% = box_nr% + 1
27 If box_nr% > columns%*rows% Then
28     If curr_layer% = max_layer% Then
29         box_nr% = 1
30         curr_layer% = 1
31     Else
32         curr_layer% = curr_layer% + 1
33         box_nr% = 1
34     EndIf
35 EndIf
36 'Write to PLC current number of boxes and layer placed
37 M_DOut(6003)=box_nr%
38 M_DOut(6004)=curr_layer%
39 Dly 0.1
40 End
pallet_A=(473.090,-278.390,36.620,-180.000,0.000,-180.000)(7,0)
pallet_B=(686.510,-162.330,36.620,-180.000,0.000,-180.000)(7,0)
pallet_start=(473.090,-162.330,36.620,-180.000,0.000,-180.000)(7,0)
put_box=(686.510,-162.330,96.620,-180.000,0.000,-180.000)(7,0)
