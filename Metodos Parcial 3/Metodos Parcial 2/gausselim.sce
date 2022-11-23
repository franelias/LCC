function [x,a,c] = gausselim(A,b)
  // Esta función obtiene la solución del sistema de ecuaciones lineales A*x=b, 
  // dada la matriz de coeficientes A y el vector b.
  // La función implementa el método de Eliminación Gaussiana sin pivoteo.  
  
  [nA,mA] = size(A) 
  [nb,mb] = size(b)
  
  if nA<>mA then
      error('gausselim - La matriz A debe ser cuadrada');
      abort;
  elseif mA<>nb then
      error('gausselim - dimensiones incompatibles entre A y b');
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
// A = [1 1 0 3;2 1 -1 1;3 -1 -1 2;-1 2 3 -1]
// b = [4 1 -3 4]'
// [x,a,c] = gausselim(A,b)
// c = 6
// a =
//   1.   1.   0.   3.    4. 
//   0.  -1.  -1.  -5.   -7. 
//   0.   0.   3.   13.   13.
//   0.   0.   0.  -13.  -13.
// x =
//  -1.
//   2.
//   0.
//   1.

// B = [1 1 0 4;2 1 -1 1;4 -1 -2 2;3 -1 -1 2]
// b = [2 1 0 -3]'
// [x,a,c] = gausselim(B,b)
// c = 6
// a =
//   1.   1.   0.   4.    2.
//   0.  -1.  -1.  -7.   -3.
//   0.   0.   3.   21.   7.
//   0.   0.   0.  -3.   -4.
// x  = 
//  -4.
//   0.6666667
//  -7.
//   1.3333333

