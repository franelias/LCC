// Obtiene las matrices L y U a partir de la eliminacion de Gauss con Pivoteo Parcial
function [L,U,P]=gaussPP_lu(A)
    [n,m] = size(A)
    
    U = A
    L = eye(n,n)
    P = eye(n,n)
    
    for k=1:n-1
        maxi = abs(U(k,k))
        
        index = k
        
        for i=k:n
            if abs(U(i,k)) > maxi
                maxi = abs(U(i,k))
                index = i
            end
        end
        
        temp = U(k,k:n); U(k,k:n) = U(index,k:n); U(index,k:n) = temp
        temp = L(k,1:k-1); L(k,1:k-1) = L(index,1:k-1); L(index,1:k-1) = temp
        temp = P(k,:); P(k,:) = P(index,:); P(index,:) = temp
        
        for j = k+1:n
            L(j,k) = U(j,k)/U(k,k)
            
            U(j,k:n) = U(j,k:n) - L(j,k)*U(k,k:n)
        end
    end
endfunction

// A = [2 1 1 0;4 3 3 1;8 7 9 5;6 7 9 8]
// [L,U,P]=gaussPP_lu(A)
// P =
//   0.   0.   1.   0.
//   0.   0.   0.   1.
//   0.   1.   0.   0.
//   1.   0.   0.   0.
// U =
//   8.   7.     9.          5.       
//   0.   1.75   2.25        4.25     
//   0.   0.    -0.8571429  -0.2857143
//   0.   0.     0.          0.6666667
// L = 
//   1.     0.          0.          0.
//   0.75   1.          0.          0.
//   0.5   -0.2857143   1.          0.
//   0.25  -0.4285714   0.3333333   1.

// A = [1.012 -2.132 3.104;-2.132 4.096 -7.013;3.104 -7.013 0.014]
// [L,U,P]=gaussPP_lu(A)
// P = 
//   0.   0.   1.
//   0.   1.   0.
//   1.   0.   0.
// U = 
//   3.104  -7.013       0.014    
//   0.     -0.7209188  -7.003384 
//   0.      0.          1.5989796
// L =
//   1.          0.          0.
//  -0.6868557   1.          0.
//   0.3260309  -0.2142473   1.
