// Resuelve matrices trianguales inferiores
function x = monte(A,b)
  [nA,mA] = size(A) 
  [nb,mb] = size(b)

  if nA<>mA then
    error('remonte_alrevez - La matriz A debe ser cuadrada');
    abort;
  elseif mA<>nb then
      error('remonte_alrevez - dimensiones incompatibles entre A y b');
      abort;
  end;

  x(nA) = b(nA) / A(nA,nb)

  for i = 1:nA
    m = 0
    for j = 1:i-1
      m = m + A(i,j) * x(j)
    end
    
    x(i) = (b(i) - m) / A(i,i)
  end
endfunction

// A = [1 0 0;4 6 0;9 18 234]
// b = [1 2 3]'
// x = monte(A,b)
// x = 
//   1.
//  -0.3333333
//   0.
