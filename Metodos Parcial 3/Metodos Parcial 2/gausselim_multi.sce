function [x,a,c] = gausselim_multi(A,b)
  [nA,mA] = size(A) 
  [nb,mb] = size(b)
  
  if nA<>mA then
      error('gausselim_multi - La matriz A debe ser cuadrada');
      abort;
  elseif mA<>nb then
      error('gausselim_multi - dimensiones incompatibles entre A y b');
      abort;
  end;
  
  a = [A b]; // Matriz aumentada
  
  n = nA;
  for k=1:n-1
      for i=k+1:n        
          a(i,k+1:n+mb) = a(i,k+1:n+mb) - a(k,k+1:n+mb)*a(i,k)/a(k,k);
          a(i,1:k) = 0; // no hace falta para calcular la solución x
      end;
  end;
  
  // Sustitución regresiva
  for i = 1:mb
    x(n,i) = a(n,n+i)/a(n,n);
  end
  
  for i = n-1:-1:1
      for j = 1:mb
        sumk = 0
        sumk = sumk + a(i,i+1:n)*x(i+1:n,j);
      
        x(i,j) = (a(i,n+j)-sumk)/a(i,i);
      end
  end;
end

// A = [1 2 3;3 -2 1;4 2 -1]
// B = [14 9 -2;2 -5 2;5 19 12]
// [x,a,c] = gausselim_multi(A,B)
// c = 6
// a =
//   1.   2.   3.   14.   9.   -2. 
//   0.  -8.  -8.  -40.  -32.   8. 
//   0.   0.  -7.  -21.   7.    14.
// x =
//   1.   2.   2.
//   2.   5.   1.
//   3.  -1.  -2.


// [x,a,c] = gausselim_multi(A,eye(3,3))
// c = 6
// a =
//   1.   2.   3.   1.     0.     0.
//   0.  -8.  -8.  -3.     1.     0.
//   0.   0.  -7.  -1.75  -0.75   1.
// x = 
//   0.      0.1428571   0.1428571
//   0.125  -0.2321429   0.1428571
//   0.25    0.1071429  -0.1428571
