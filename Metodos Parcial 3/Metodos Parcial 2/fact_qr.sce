function [Q,R]=fact_qr(A)
    [n,m] = size(A)
    
    if n<>m then
        error('fact_qr - La matriz A debe ser cuadrada');
        abort;
    end;
    
    R = zeros(n,n)
    
    for k = 1:n
    suma = 0
    
    for i = 1:k-1
    suma = suma + (A(:,k)'*Q(:,i)) * Q(:,i)
    end
    
    R(k,k) = norm((A(:,k) - suma))
    Q(:,k) = (A(:,k) - suma) / R(k,k)
    
    R(k,k+1:n) = A(:,k+1:n)'*Q(:,k)
    end
endfunction

// A = [16 -12 8;-12 18 -6;8 -6 8]
// Q =
//   0.7427814   0.4982729  -0.4472136
//  -0.557086    0.8304548   2.483D-16
//   0.3713907   0.2491364   0.8944272
// R =
//   21.540659  -21.169269   12.255892
//   0.          7.4740932   0.9965458
//   0.          0.          3.5777088

function x=resolve_qr(A,b)
    [Q,R] = fact_qr(A)
    
    // Rx = Q'b
    x = remonte(R,Q'*b)
endfunction
