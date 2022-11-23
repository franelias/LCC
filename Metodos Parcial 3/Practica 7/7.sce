x = [0 0.15 0.31 0.5 0.6 0.75]
y = [1 1.004 1.031 1.117 1.223 1.422]
[r,err]=poli_minimos(x,y,2)
disp(r,err)
[r,err]=poli_minimos(x,y,3)
disp(r,err)
[r,err]=poli_minimos(x,y,4)
disp(r,err)

A = A_mc(x,1)
a1 = MinCuad_pol(A,y)

B = A_mc(x,2)
a2 = MinCuad_pol(B,y)

C = A_mc(x,3)
a3 = MinCuad_pol(C,y)
