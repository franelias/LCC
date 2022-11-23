function [x,a,c] = gausselim_tridiag(A,b)
  // Esta función obtiene la solución del sistema de ecuaciones lineales A*x=b, 
  // dada la matriz de coeficientes A y el vector b.
  // La función implementa el método de Eliminación Gaussiana sin pivoteo para matrices tridiagonales.  
  
  [nA,mA] = size(A) 
  [nb,mb] = size(b)
  
  if nA<>mA then
      error('gausselim_tridiag - La matriz A debe ser cuadrada');
      abort;
  elseif mA<>nb then
      error('gausselim_tridiag - dimensiones incompatibles entre A y b');
      abort;
  end;
  
  a = [A b]; // Matriz aumentada
  
  c = 0 // cantidad de operaciones elementales

  // Eliminación progresiva
  n = nA;
  for k=1:n-1
      for i=k+1:n        
          a(i,k+1:n+1) = a(i,k+1:n+1) - a(k,k+1:n+1)*a(i,k)/a(k,k);
          a(i,1:k) = 0; // no hace falta para calcular la solución x
          
          c = c + 1
      end;
  end;
  
  // Sustitución regresiva
  x(n) = a(n,n+1)/a(n,n);
  for i = n-1:-1:1
      sumk = 0
      sumk = sumk + a(i,i+1:n)*x(i+1:n);
      
      x(i) = (a(i,n+1)-sumk)/a(i,i);
  end;
endfunction

// A = [1 2 0 0;3 4 2 0;0 2 3 4;0 0 20 51]
// b = [2 1 0 -3]'
// [x,a,c] = gausselim_tridiag(A,b)
// c = 6
// a =
//   1.   2.   0.   0.    2. 
//   0.  -2.   2.   0.   -5. 
//   0.   0.   5.   4.   -5. 
//   0.   0.   0.   35.   17.
// x =
//  -0.2228571
//   1.1114286
//  -1.3885714
//   0.4857143