1 'Pick palletizing program
2 Tool 3
3 Ovrd 100
4 Def Inte columns, rows, pattern, curr_layer, max_layer, layer_width, box_nr
5 curr_layer% = M_DIn(6007)
6 columns% = M_DIn(6001)
7 rows% = M_DIn(6002)
8 pattern% = M_DIn(6003)    '1 - ZigZag     2 - Same direction      3 - arc
9 max_layer% = M_DIn(6009)
10 layer_width% = M_DIn(6010)
11 box_nr% = M_DIn(6008)
12 Def Plt 1, pallet_start, pallet_A, pallet_B, , columns%, rows%, pattern%
13 HOpen 1
14     GoSub *pallet_pick
15 End
16 '----------SubPrograms-----------
17 *pallet_pick
18 Def Pos get_box
19 get_box = Plt 1, box_nr
20 get_box.Z = pallet_start.Z + layer*layer_width - layer_width
21 Mov get_box, -50
22 Mvs get_box
23 Dly 0.1
24 HClose 1
25 Dly 0.1
26 Mov get_box, -50
27 box_nr% = box_nr% + 1
28 If box_nr% > columns%*rows% Then
29     curr_layer% = curr_layer% - 1
30     box_nr% = 1
31 EndIf
32 'Write to PLC current number of boxes and layer putted
33 M_DOut(6001)=box_nr%
34 M_DOut(6002)=curr_layer%
35 End
get_box=(450.620,127.130,63.630,180.000,0.000,180.000,0.000,0.000)(7,0)
pallet_A=(450.620,-102.080,63.630,180.000,0.000,180.000)(7,0)
pallet_B=(638.270,127.130,63.630,180.000,0.000,180.000)(7,0)
pallet_start=(450.620,127.130,63.630,180.000,0.000,180.000)(7,0)
