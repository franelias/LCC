function [x,can]=gauss_seidel_sor(A,b,x0,tol,mod)
    xk = x0
    x = xk
    
    [nA,mA] = size(A)
    [nb,mb] = size(b)
    [nx0,mx0] = size(x0)
    
    if nA<>mA then
        error('gauss_seidel_sor - La matriz A debe ser cuadrada');
        abort;
    elseif mA<>nb then
        error('gauss_seidel_sor - dimensiones incompatibles entre A y b');
        abort;    
    elseif mA<>nx0 then
        error('gauss_seidel_sor - dimensiones incompatibles entre A y x0');
        abort;
    end;

    n = nA
   
    x(1) = (1-mod)* xk(1) + (b(1) - A(1,2:n) * xk(2:n))* mod / A(1,1)
    
    for i = 2:n-1
        x(i) = (1-mod)*xk(i) + (b(i) - A(i,1:i-1) * x(1:i-1) - A(i,i+1:n) * xk(i+1:n)) * mod / A(i,i)
    end
    
    x(n) = (1-mod)* xk(n) + (b(n) - A(n,1:n-1) * x(1:n-1)) * mod / A(n,n)
    
    can = 1
    
    while abs(norm(x-xk)) > tol
        can = can + 1
        xk = x
        
        x(1) = (1-mod)* xk(1) + (b(1) - A(1,2:n) * xk(2:n))* mod / A(1,1)
        
        for i = 2:n-1
            x(i) = (1-mod)*xk(i) + (b(i) - A(i,1:i-1) * x(1:i-1) - A(i,i+1:n) * xk(i+1:n)) * mod / A(i,i)
        end
        
        x(n) = (1-mod)* xk(n) + (b(n) - A(n,1:n-1) * x(1:n-1)) * mod / A(n,n)
    end
endfunction

function w=optimo_w(A)
    [n,m] = size(A)
    
    if n<>m then
        error('optimo_w - La matriz A debe ser cuadrada');
        abort;
    end
    
    I = eye(n,n)
    N = diag(diag(A))
    
    T = I - N**-1 * A
    
    w = 2 / (1 + sqrt(1-radio_espectral(T)**2))
endfunction

// Se necesita ejecutar el archivo "radio_espectral.sce"
// A = [4 3 0;3 4 -1;0 -1 4]
// b = [24 30 -24]'
// w = optimo_w(A)
// w = 
//   1.2404082
//[x,can] = gauss_seidel_sor(A,b,[0,0,0]',10**-2,w)
// can  = 
//   7.
// x = 
//   3.0023348
//   3.9989237
//  -5.0004475




