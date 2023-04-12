1 'Place palletizing program
2 Tool 3
3 Ovrd 100
4 Def Inte columns, rows, pattern, curr_layer, max_layer
5 curr_layer% =M_DIn(6013)
6 columns% = M_DIn(6004)
7 rows% = M_DIn(6005)
8 pattern% =M_DIn(6011)    '1 - ZigZag     2 - Same direction      3 - arc
9 max_layer% =M_DIn(6012)
10 layer_width% = M_DIn(6015)
11 box_nr% = M_DIn(6014)
12 Def Plt 1, pallet_start, pallet_A, pallet_B, , columns%, rows%, pattern%
13 GoSub *pallet_place
14 End
15 '----------SubPrograms-----------
16 *pallet_place
17 Def Pos put_box
18 put_box = Plt 1, box_nr%
19 put_box.Z = palletizing_start.Z + layer*layer_width - layer_width
20 Mov put_box,-50
21 Mvs put_box
22 Dly 0.1
23 HOpen 1
24 Dly 0.1
25 Mov put_box, -50
26 box_nr% = box_nr% + 1
27 If box_nr% > columns%*rows% Then
28     curr_layer% = curr_layer% + 1
29     box_nr% = 1
30 EndIf
31 'Write to PLC current number of boxes and layer placed
32 M_DOut(6003)=box_nr%
33 M_DOut(6004)=curr_layer%
34 End
pallet_A=(441.390,200.840,40.510,180.000,0.000,180.000)(7,0)
pallet_B=(625.780,384.510,40.510,-180.000,0.000,-180.000)(7,0)
pallet_start=(441.390,384.510,40.510,180.000,0.000,180.000)(7,0)
put_box=(0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000)(0,0)
