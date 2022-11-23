function [U,ind] = cholesky(A)
// Factorización de Cholesky.
// Trabaja únicamente con la parte triangular superior.
//
// ind = 1  si se obtuvo la factorización de Cholesky.
//     = 0  si A no es definida positiva
//
//******************
eps = 1.0e-8
//******************

n = size(A,1)
U = zeros(n,n)

t = A(1,1)
if t <= eps then
    printf('Matriz no definida positiva.\n')
    ind = 0
    return
end
U(1,1) = sqrt(t)
for j = 2:n
    U(1,j) = A(1,j)/U(1,1)
end
    
for k = 2:n
    t = A(k,k) - U(1:k-1,k)'*U(1:k-1,k)
    if t <= eps then
        printf('Matriz no definida positiva.\n')
        ind = 0
        return
    end
    U(k,k) = sqrt(t)
    for j = k+1:n
        U(k,j) = ( A(k,j) - U(1:k-1,k)'*U(1:k-1,j) )/U(k,k)
    end
end
ind = 1

endfunction

// A = [4 1 1; 8 2 2; 1 2 3]
// [U,ind] = cholesky(A)
// ind = 1
// U =
//   2.   0.5         0.5      
//   0.   1.3228757   1.3228757
//   0.   0.          1.   


// B = [5 2 1 0; 2 5 2 0; 1 2 5 2; 0 0 2 5]
// [U,ind] = cholesky(B)
// ind = 1
// U  = 
//   2.236068   0.8944272   0.4472136   0.       
//   0.         2.0493902   0.7807201   0.       
//   0.         0.          2.0470653   0.9770084
//   0.         0.          0.          2.0113315

// C = [5 2 1 0; 2 -4 2 0; 1 2 2 2; 0 0 2 5]
// [U,ind] = cholesky(C)
// ind = 0 Matriz no definida positiva.
// U  = 
//   2.236068   0.8944272   0.4472136   0.
//   0.         0.          0.          0.
//   0.         0.          0.          0.
//   0.         0.          0.          0.


