function [x,can]=gauss_seidel(A,b,x0,tol)
    xk = x0
    x = xk
    
    [nA,mA] = size(A)
    [nb,mb] = size(b)
    [nx0,mx0] = size(x0)
    
    if nA<>mA then
        error('gauss_seidel - La matriz A debe ser cuadrada');
        abort;
    elseif mA<>nb then
        error('gauss_seidel - dimensiones incompatibles entre A y b');
        abort;    
    elseif mA<>nx0 then
        error('gauss_seidel - dimensiones incompatibles entre A y x0');
        abort;
    end;

    n = nA
   
    x(1) = (b(1) - A(1,2:n) * xk(2:n)) / A(1,1)
    
    for i = 2:n-1
        x(i) = (b(i) - A(i,1:i-1) * x(1:i-1) - A(i,i+1:n) * xk(i+1:n)) / A(i,i)
    end
    
    x(n) = (b(n) - A(n,1:n-1) * x(1:n-1)) / A(n,n)
    
    can = 1
    
    while abs(norm(x-xk)) > tol
        can = can + 1
        xk = x
        
        x(1) = (b(1) - A(1,2:n) * xk(2:n)) / A(1,1)
        
        for i = 2:n-1
            x(i) = (b(i) - A(i,1:i-1) * x(1:i-1) - A(i,i+1:n) * xk(i+1:n)) / A(i,i)
        end
        
        x(n) = (b(n) - A(n,1:n-1) * x(1:n-1)) / A(n,n)
    end
endfunction


// A = [1 -1 0; -1 2 -1;0 -1 1.1]
// b = [0 1 0]'
// [x,can]=gauss_seidel(A,b,[0 2 3]',10**-2)
// can = 91
// x  = 
//   10.872653
//   10.878442
//   9.8894923


// [x,can]=gauss_seidel(A,b,[0 0 0]',10**-2)
// can = 97
// x = 
//   10.873565
//   10.879312
//   9.8902836

function x=converge_gauss_seidel(A)
    [n,m] = size(A)
    
    if n<>m then
        error('converge_gauss_seidel - La matriz A debe ser cuadrada');
        abort;
    end
    
    I = eye(n,n)
    N = diag(diag(A))
    
    x= radio_espectral(I-N**-1*A) < 1
endfunction
