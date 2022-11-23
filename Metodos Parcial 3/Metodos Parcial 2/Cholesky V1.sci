function [U, ind] = Cholesky(A)
eps = 1.0e-8
n = size(A,1)
U = zeros(n,n)
for k = 1:n
    if k==1 then
            t = A(k,k)
    else 
            t = A(k,k) - U(1:k-1,k)'*U(1:k-1,k)
    end

    if t <= eps
        printf("Matriz no definida positiva.\n")
        ind = 0
        return
    end
    U(k,k)= sqrt(t)
    for j = k+1:n
        if k==1 then 
                    U(k,j) = A(k,j)/U(k,k)
        else 
                    U(k,j) = ( A(k,j) - U(1:k-1,k)' * U(1:k-1,j) )/U(k,k)
        end
    end
end
ind = 1
endfunction

// A = [4 1 1; 8 2 2; 1 2 3]
// [U,ind] = Cholesky(A)
// ind = 1
// U =
//   2.   0.5         0.5      
//   0.   1.3228757   1.3228757
//   0.   0.          1.   


// B = [5 2 1 0; 2 5 2 0; 1 2 5 2; 0 0 2 5]
// [U,ind] = Cholesky(B)
// ind = 1
// U  = 
//   2.236068   0.8944272   0.4472136   0.       
//   0.         2.0493902   0.7807201   0.       
//   0.         0.          2.0470653   0.9770084
//   0.         0.          0.          2.0113315

// C = [5 2 1 0; 2 -4 2 0; 1 2 2 2; 0 0 2 5]
// [U,ind] = Cholesky(C)
// ind = 0 Matriz no definida positiva.
// U  = 
//   2.236068   0.8944272   0.4472136   0.
//   0.         0.          0.          0.
//   0.         0.          0.          0.
//   0.         0.          0.          0.


function x=resolve_cholesky(A,b)
    [U, ind] = Cholesky(A)
    if ind == 0 then
        error('resolve_cholesky - La matriz A no tiene factorizacion de Cholesky');
        abort;
    end
    
    // LUx = b
    // LY = b
    // Ux = Y
     y = monte(U',b)
     x = remonte(U,y)
endfunction
