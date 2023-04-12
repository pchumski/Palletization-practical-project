1 Servo On
2 Tool 3
3 Def Inte columns, rows, curr_layer, max_layer, box_nr
4 Def Inte columns2, rows2, curr_layer2, max_layer2, box_nr2
5 GoSub *SafeStart
6 Mov p1
7 HOpen 1
8 'initialize values for PICK pallet
9 M_DOut(6001)=1  'box_nr PICK = 1
10 M_DOut(6002)=1  'curr_layer PICK = 1
11 'initialize values for PLACE pallet
12 M_DOut(6004)=1  'box_nr PLACE = 1
13 M_DOut(6003)=1  'curr_layer PLACE = 1
14 M_Out(6122)=0
15 *LOOP
16 mProgram = M_DIn(6000)
17 M_Out(6124)=0
18 M_Out(6126)=0
19 M_Out(6127)=0
20 Select mProgram
21     Case 0
22         If P_Curr.Z < 150 Then
23             pt = P_Curr
24             pt.Z = 160
25         EndIf
26         Mov p1
27     '    If M_In(6007)=1 Then    'If END is ON
28     '        M_Out(6124)=1
29     '        End
30     '    EndIf
31         M_Out(6122) = 1     'To set program to last program
32         End
33     Break
34     '
35     Case 1
36         M_DOut(6000)=1
37         CallP "PICKPROJEKT"
38         GoSub *SafeStart
39         Mov p1
40         M_DOut(6000)=0
41         M_Out(6124)=1       'END set to ON
42         M_Out(6127)=1
43         Dly 0.1
44     Break
45     '
46     Case 2
47         M_DOut(6000)=2
48         CallP "PLACEPROJEKT"
49         GoSub *SafeStart
50         Mov p1
51         M_DOut(6000)=0
52         M_Out(6124)=1       'END set to ON
53         M_Out(6127)=1
54         Dly 0.1
55     Break
56     'Pick and place
57     Case 3
58         M_DOut(6000)=3
59         *PICKPLACE
60         CallP "PICKPROJEKT"
61         GoSub *SafeStart
62         CallP "PLACEPROJEKT"
63         GoSub *SafeStart
64         If M_In(6007) <> 1 Then
65             GoTo *PICKPLACE
66         EndIf
67         M_DOut(6000)=0
68         M_Out(6127) = 1
69         Dly 0.1
70     Break
71     ' Point to pallet
72     Case 4
73         M_Out(6126) = 1
74         M_DOut(6000) = 4
75         box_nr2% = M_DIn(6014)
76         columns2% = M_DIn(6004)
77         rows2% = M_DIn(6005)
78         max_layer2% =M_DIn(6012)
79         curr_layer2% =M_DIn(6013)
80         CallP "PICKPROJEKT"
81         GoSub *SafeStart
82         CallP "PLACEPALLV2"
83         GoSub *SafeStart_SMALL
84         'Stop palletizing after pick pallet is empty
85         If (box_nr2% >= columns2%*rows2%) And (curr_layer2% >= max_layer2%) Then
86             M_Out(6127) = 1
87             M_Out(6124) = 1
88         EndIf
89         M_DOut(6000) = 0
90         'Stop palletizing after END is ON
91         If M_In(6007) = 1 Then
92             M_Out(6127) = 1
93             M_Out(6124) = 1
94         EndIf
95         Dly 0.1
96     Break
97     ' PALLET to point
98     Case 5
99         M_Out(6126) = 1
100         M_DOut(6000) = 5
101         'pick pallet
102         curr_layer% = M_DIn(6007)
103         box_nr% = M_DIn(6008)
104         columns% = M_DIn(6001)
105         rows% = M_DIn(6002)
106         max_layer% = M_DIn(6009)
107         CallP "PICKPALLV2"
108         GoSub *SafeStart_SMALL
109         CallP "PLACEPROJEKT"
110         GoSub *SafeStart_SMALL
111         'Stop paletizing after pick pallet is empty
112         If (box_nr% >= columns%*rows%) And (curr_layer% >= max_layer%) Then
113             M_Out(6127) = 1
114             M_Out(6124) = 1
115         EndIf
116         'Stop palletizing after END is ON
117         If M_In(6007) = 1 Then
118             M_Out(6127) = 1
119             M_Out(6124) = 1
120         EndIf
121         M_DOut(6000) = 0
122         Dly 0.1
123     Break
124     'Pallet to pallet
125     Case 6
126         M_Out(6126) = 1
127         M_DOut(6000) = 6
128         'pick pallet
129         curr_layer% = M_DIn(6007)
130         box_nr% = M_DIn(6008)
131         columns% = M_DIn(6001)
132         rows% = M_DIn(6002)
133         max_layer% = M_DIn(6009)
134         CallP "PICKPALLV2"
135         GoSub *SafeStart_SMALL
136         'place pallet--------------
137         box_nr2% = M_DIn(6014)
138         columns2% = M_DIn(6004)
139         rows2% = M_DIn(6005)
140         max_layer2% =M_DIn(6012)
141         curr_layer2% =M_DIn(6013)
142         CallP "PLACEPALLV2"
143         GoSub *SafeStart_SMALL
144         M_DOut(6000) = 0
145         'Stop palletizing after END is ON
146         If M_In(6007) = 1 Then
147             M_Out(6127) = 1
148             M_Out(6124) = 1
149         EndIf
150         'Stop palletizing after place pallet is full
151         If (box_nr2% >= columns2%*rows2%) And (curr_layer2% >= max_layer2%) Then
152             M_Out(6127) = 1
153             M_Out(6124) = 1
154         EndIf
155         'Stop palletizing after pick pallet is empty
156         If (box_nr% >= columns%*rows%) And (curr_layer% >= max_layer%) Then
157             M_Out(6127) = 1
158             M_Out(6124) = 1
159         EndIf
160         '
161         Dly 0.1
162     Break
163 End Select
164 '
165 GoTo *LOOP
166 End
167 'bezpieczny start
168 *SafeStart
169 pt = P_Curr
170 pt.Z = p1.Z
171 Mvs pt
172 Return
173 *SafeStart_SMALL
174 pt = P_Curr
175 pt.Z = pt.Z + 100
176 Mvs pt
177 Return
p1=(505.740,-5.740,360.550,180.000,0.000,0.000)(7,0)
pick=(361.100,-233.670,44.020,-180.000,0.010,0.000)(7,0)
place=(295.260,252.630,36.620,-180.000,0.000,-180.000)(7,0)
pt=(500.000,0.000,389.400,180.000,0.000,-180.000)(7,0)
