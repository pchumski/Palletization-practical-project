1 'Program read positions and send it to PLC
2 M_DOut(6005) = P_Curr.X
3 M_DOut(6006) = P_Curr.Y
4 M_DOut(6007) = P_Curr.Z
5 M_DOut(6008) = Deg(P_Curr.A)
6 M_DOut(6009) = Deg(P_Curr.B)
7 M_DOut(6010) = Deg(P_Curr.C)
8 M_DOut(6011) = Deg(J_Curr.J1)
9 M_DOut(6012) = Deg(J_Curr.J2)
10 M_DOut(6013) = Deg(J_Curr.J3)
11 M_DOut(6014) = Deg(J_Curr.J4)
12 M_DOut(6015) = Deg(J_Curr.J5)
13 M_DOut(6016) = Deg(J_Curr.J6)
14 M_Out(6125) = M_In(128)
