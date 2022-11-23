function [x,can]=jacobi(A,b,x0,tol)
    xk = x0
    x = xk
    
    [nA,mA] = size(A)
    [nb,mb] = size(b)
    [nx0,mx0] = size(x0)
    
    if nA<>mA then
        error('jacobi - La matriz A debe ser cuadrada');
        abort;
    elseif mA<>nb then
        error('jacobi - dimensiones incompatibles entre A y b');
        abort;
    elseif mA<>nx0 then
        error('jacobi - dimensiones incompatibles entre A y x0');
        abort;
    end;

    n = nA
    
    for i = 1:n
        suma = 0
        for j = 1:n
            if j <> i
                suma = suma + A(i,j) * xk(j)
            end
        end
        
        x(i) = (b(i) - suma) / A(i,i)
    end
    
    can = 1
    
    while abs(norm(x-xk)) > tol
        can = can + 1
        xk = x
        for i = 1:n
            suma = 0
            for j = 1:n
                if j <> i
                    suma = suma + A(i,j) * xk(j)
                end
            end
            
            x(i) = (b(i) - suma) / A(i,i)
        end
    end
endfunction

// A = [1 -1 0; -1 2 -1;0 -1 1.1]
// b = [0 1 0]'
// [x,can]=jacobi(A,b,[0 2 3]',10**-2)
// can = 162.
// x  = 
//   10.782243
//   10.792141
//   9.8020393

// [x,can]=jacobi(A,b,[0 0 0]',10**-2
// can = 171
//   10.789086
//   10.798673
//   9.8082602

function x=converge_jacobi(A)   
    [n,m] = size(A)
    
    if n<>m then
        error('converge_jacobi - La matriz A debe ser cuadrada');
        abort;
    end
    
    I = eye(n,n)
    N = diag(diag(A))
    
    x= radio_espectral(I-N**-1*A) < 1
endfunction
