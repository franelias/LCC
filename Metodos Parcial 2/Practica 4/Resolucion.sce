// 2
disp("2")
disp("a")
A = [1 1 0 3;2 1 -1 1;3 -1 -1 2;-1 2 3 -1]
b = [4 1 -3 4]'

[x,a,c] = gausselim(A,b)
disp(x,c)

disp("b")
A = [1 -1 2 -1;2 -2 3 -3;1 1 1 0;1 -1 4 3]
b = [-8 -20 -2 4]'

[x,a,c] = gausselim(A,b)
disp(x,c)

disp("c")
A = [1 1 0 4;2 1 -1 1;4 -1 -2 2;3 -1 -1 2]
b = [2 1 0 -3]'

[x,a,c] = gausselim(A,b)
disp(x,c)

// 3
disp("3")
S = [1 2 3;3 -2 1;4 2 -1]
b1 = [14 2 5]'
b2 = [9 -5 19]'
b3 = [-2 2 12]'

[x,a,c] = gausselim_multi(S,[b1 b2 b3])
disp(x)
[x,a,c] = gausselim_multi(S,eye(3,3))
disp(x)

 // 7
disp("7")
A = [2 1 1 0;4 3 3 1;8 7 9 5;6 7 9 8]
[L,U,P] = gaussPP_lu(A)
disp(P*A == L*U)

//8
disp("7")
A = [1.012 -2.132 3.104;-2.132 4.096 -7.013;3.104 -7.013 0.014]
B = [2.1756 4.0231 -2.1732 5.1967;-4.0231 6.0000 0 1.1973;-1.0000 5.2107 1.1111 0;6.0235 7.0000 0 4.1561]

// 9
A = [1 2 -2 1;4 5 -7 6;5 25 -15 -3;6 -12 -6 22]
b = [1 2 0 1]'

[L,U,P] = gaussPP_lu(A)
b = P*b
y = monte(L,b)
x = remonte(U,y)
// Ax = b
// PLUx = b
// LUx = Pb
// LY = Pb
// Ux = Y

//10
A = [1 2 3 4;1 4 9 16;1 8 27 64;1 16 81 256]
b=[2 10 44 190]'
x=resolve_doolittle(A,b)
