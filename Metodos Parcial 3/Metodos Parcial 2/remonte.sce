// Resuelve matrices trianguales superiores
// Sustitucion regresiva
function x = remonte(A,b)
  [nA,mA] = size(A) 
  [nb,mb] = size(b)

  if nA<>mA then
    error('remonte - La matriz A debe ser cuadrada');
    abort;
  elseif mA<>nb then
      error('remonte - dimensiones incompatibles entre A y b');
      abort;
  end;

  x(nA) = b(nA) / A(nA,nb)

  for i = nA:-1:1
    m = 0
    for j = i+1:nA
      m = m + A(i,j) * x(j)
    end 
    
    x(i) = (b(i) - m) / A(i,i)
  end
endfunction
