1 '"Copyright © Mitsubishi Electric Europe B.V.
2 'IMPORTANT !
3 'These Function Blocks are demo versions that are only  intended to demonstrate program functions and provide general orientation for  your software 'choices. They are not suitable for use in real applications! "
4 '
5 '"Improper use of demo versions in applications can lead to serious malfunctions  and damage!
6 'Programs for real applications must always be configured for 'the  individual application by trained staff and tested thoroughly before being  used.
7 '
8 'Mitsubishi Electric cannot assume any liability if these examples are used in real applications."
9 '
10 ' DESCRIPTION:
11 ' Program setting robot registers map for CC-Link IE Field
12 ' Restart the robot after executing the program
13 '
14 ' ---------------------------------------------------------
15 ' General Settings
16 ' ---------------------------------------------------------
17 PrmWrite 1, "COL", "1,1,1"
18 PrmWrite 1, "PRGUSR", "VAR"
19 PrmWrite 1, "NETIP", "192.168.0.20"
20 PrmWrite 1, "IQMEM", "1" ' GOT Direct
21 ' CC-Link IE Field Basic
22 PrmWrite 1, "CCLBENA", "1"
23 ' ---------------------------------------------------------
24 ' Dedicated I/O Signals Assignment :
25 ' ---------------------------------------------------------
26 ' 1. General1
27 PrmWrite 1, "IOENA", "6000,6000"
28 PrmWrite 1, "START", "6001,6001"
29 PrmWrite 1, "STOP2", "6002,6002"
30 PrmWrite 1, "SLOTINIT", "6003,6003"
31 PrmWrite 1, "SRVON", "6004,6004"
32 PrmWrite 1, "SRVOFF", "6005,6005"
33 PrmWrite 1, "ERRRESET", "6006,6006"
34 PrmWrite 1, "CYCLE", "6007,6007"
35 PrmWrite 1, "STOPSTS", "-1,6008"
36 ' ---------------------------------------------------------
37 ' 1. General2
38 PrmWrite 1, "SAFEPOS", "6009,6009"
39 PrmWrite 1, "OUTRESET", "6010,-1"
40 PrmWrite 1, "MELOCK", "6011,6011"
41 PrmWrite 1, "HLVLERR", "-1,6012"
42 PrmWrite 1, "LLVLERR", "-1,6013"
43 PrmWrite 1, "CLVLERR", "-1,6014"
44 PrmWrite 1, "EMGERR", "-1,6015"
45 PrmWrite 1, "TEACHMD", "-1,6016"
46 PrmWrite 1, "ATTOPMD", "-1,6017"
47 PrmWrite 1, "ATEXTMD", "-1,6018"
48 ' ---------------------------------------------------------
49 ' Data
50 PrmWrite 1, "PRGSEL", "6019"
51 PrmWrite 1, "OVRDSEL", "6020"
52 PrmWrite 1, "RCREADY", "-1,6021"
53 PrmWrite 1, "BATERR", "-1,6022"
54 PrmWrite 1, "PRGOUT", "6023,6023"
55 PrmWrite 1, "LINEOUT", "6024,6024"
56 PrmWrite 1, "OVRDOUT", "6025,6025"
57 PrmWrite 1, "ERROUT", "6026,6026"
58 PrmWrite 1, "TMPOUT", "6027,6027"
59 PrmWrite 1, "IODATA", "6032,6047,6032,6047"
60 PrmWrite 1, "USRAREA", "6048,6055"
61 ' ---------------------------------------------------------
62 ' Jog
63 PrmWrite 1, "JOGENA", "6056,6056"
64 PrmWrite 1, "JOG+", "6057,6064"
65 PrmWrite 1, "JOG-", "6065,6072"
66 PrmWrite 1, "JOGM", "6073,6075,6073,6075"
67 PrmWrite 1, "JOGNER", "6076,6076"
68 PrmWrite 1, "JOGWKNO", "6098,6101,6101,6104"
69 ' ---------------------------------------------------------
70 ' Hand
71 PrmWrite 1, "HANDENA", "6077,6077"
72 PrmWrite 1, "HANDOUT", "6078,6085"
73 PrmWrite 1, "HNDCNTL1", "6086,6093"
74 ' ---------------------------------------------------------
75 ' Maintenance Forecast
76 PrmWrite 1, "RSTBAT", "6094,6094"
77 PrmWrite 1, "RSTGRS", "6095,6095"
78 PrmWrite 1, "RSTBLT", "6096,6096"
79 PrmWrite 1, "M1PTEXC", "-1,6097"
80 ' BATERR defined in Data, "6022"
81 ' ---------------------------------------------------------
82 Hlt
