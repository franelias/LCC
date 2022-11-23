function [L,U] = doolittle(A)
    [n,m] = size(A)
    
    if n<>m then
        error('doolittle - La matriz A debe ser cuadrada');
        abort;
    end;
    
    L = zeros(n,n)
    U = zeros(n,n)
    
    for j=1:m
        for i=1:n
            if i<=j
                suma = 0
                if i-1 <> 0
                    suma = L(i,1:i-1) * U(1:i-1,j)
                end
       
                U(i,j) = A(i,j) - suma
            end    
            
            if j<=i
                suma = 0
                if j-1 <> 0
                    suma = L(i,1:j-1)*U(1:j-1,j);
                end
                
                L(i,j) = (A(i,j) - suma) / U(j,j);
            end
        end
    end
endfunction

// A = [1 2 3 4;1 4 9 16;1 8 27 64;1 16 81 256]
// doolittle(A)
// ans =
//   1.   0.   0.   0.
//   1.   1.   0.   0.
//   1.   3.   1.   0.
//   1.   7.   6.   1.

function x=resolve_doolittle(A,b)
    [L,U] = doolittle(A)
    
    // LUx = b
    // LY = b
    // Ux = Y
     y = monte(L,b)
     x = remonte(U,y)
endfunction
