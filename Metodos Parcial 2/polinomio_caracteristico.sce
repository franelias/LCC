function p = polinomio_caracteristico(A)
    [n, m] = size(A)
    
    if n<>m then
        error('polinomio_caracteristico - La matriz A debe ser cuadrada');
        abort;
    end
    
    x = poly([0 1], 'x', 'c')
    p = det(A - eye(n,n)*x)
endfunction

// A = [1 0 0;4 6 0;9 18 234]
// p = polinomio_caracteristico(A)
//   p = 
//                    2   3
//   1404 -1644x +241x  -x 
