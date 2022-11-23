function x=determinante(A) 
  [nA,mA] = size(A) 
  
  if nA<>mA then
      error('determinante - La matriz A debe ser cuadrada')
      abort
  end
  
  n = nA
  for k=1:n-1
      for i=k+1:n        
          A(i,k+1:n) = A(i,k+1:n) - A(k,k+1:n)*A(i,k)/A(k,k)
          A(i,1:k) = 0
      end
  end
  
  x = prod(diag(A))
endfunction

// A = [4 1 1; 8 2 2; 1 2 3]
// x = determinante(A)
// x = nan

// B = [5 2 1 0; 2 5 2 0; 1 2 5 2; 0 0 2 5]
// x = determinante(B)
// x = 356
