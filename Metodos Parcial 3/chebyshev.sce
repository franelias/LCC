// Retorna Tn
function r=chebyshev(n)
    if n == 0 then
        r = 1
        return
    end
    
    x = poly([0 1],"x","c")
    
    if n == 1 then
        r = x
        return
    end
    
    r = 2 * x *chebyshev(n-1) - chebyshev(n-2)
endfunction

/*
--> chebyshev(3)
 ans  =

         3
  -3x +4x 
  
--> chebyshev(5)
 ans  =

          3     5
   5x -20x  +16x 
*/

function r=roots_chebyshev(n)
    for i=1:n
        r(i) = cos(((2*i-1)*%pi)/(2*n))
    end
endfunction

/*
--> roots_chebyshev(3)
 ans  =
   0.8660254
   6.123D-17
  -0.8660254

--> roots_chebyshev(4)
 ans  =

   0.9238795
   0.3826834
  -0.3826834
  -0.9238795
*/
