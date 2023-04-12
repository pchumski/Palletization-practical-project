1 'Pick palletizing program
2 Tool 3
3 Def Inte columns, rows, pattern, curr_layer, max_layer, layer_width, box_nr
4 curr_layer% = M_DIn(6007)   'initialize =1
5 box_nr% = M_DIn(6008)       'initialize =1
6 columns% = M_DIn(6001)
7 rows% = M_DIn(6002)
8 pattern% = M_DIn(6003)    '1 - ZigZag     2 - Same direction
9 max_layer% = M_DIn(6009)
10 layer_width% = M_DIn(6010)
11 Def Plt 1, pallet_start, pallet_A, pallet_B, , columns%, rows%, pattern%
12 If curr_layer% <= max_layer% Then
13     GoSub *pallet_pick
14 EndIf
15 End
16 '----------Pick from pallet-----------
17 *pallet_pick
18 Def Pos get_box
19 get_box = Plt 1, box_nr%
20 get_box.Z = pallet_start.Z - curr_layer%*layer_width% + layer_width%
21 If get_box.Z > 30 Then
22     Mov get_box, -50
23     Mvs get_box
24     Dly 0.2
25     HClose 1
26     Dly 0.2
27     Mov get_box, -50
28     Dly 0.2
29     box_nr% = box_nr% + 1
30 EndIf
31 If box_nr% > columns%*rows% Then
32     If curr_layer% = max_layer% Then    'Start paletizing from the beginning: RESET VALUES
33         box_nr% = 1
34         curr_layer% = 1
35     Else                                'Override current number of boxes and current layer
36         curr_layer% = curr_layer% + 1
37         box_nr% = 1
38     EndIf
39 EndIf
40 'Write to PLC current number of boxes and layer putted
41 M_DOut(6001)=box_nr%
42 M_DOut(6002)=curr_layer%
43 End
get_box=(633.950,132.680,185.950,-180.000,0.000,-180.000)(7,0)
pallet_A=(327.700,-18.490,245.950,-180.000,0.000,-180.000)(7,0)
pallet_B=(633.950,132.680,245.950,-180.000,0.000,-180.000)(7,0)
pallet_start=(327.700,132.680,245.950,-180.000,0.000,-180.000)(7,0)
