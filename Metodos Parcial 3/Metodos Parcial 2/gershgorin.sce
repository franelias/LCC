// Retorna una cota para los autovalores de la matriz deseada, siempre que los mismos sean reales
function [inf, sup] = gershgorin(A)
    [n,m] = size(A)
    
    centros = diag(A)
    radios = sum(abs(A), 'c') - abs(centros)
    
    inf = min(centros - radios)
    sup = max(centros + radios)
endfunction

// A = [1 0 0;-1 0 1;-1 -1 2]
// B = [1 0 0;-0.1 0 0.1;-0.1 -0.1 2]
// [inf, sup] = gershgorin(A)
// sup  = 
//   4.
// inf  = 
//  -2.
// [inf, sup] = gershgorin(B)
// sup  = 
//   2.2
// inf  = 
//  -0.2
