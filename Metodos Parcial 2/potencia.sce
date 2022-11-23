function [z,eigenvalue,can]=potencia(A,z0,tol)
    zk = z0
    
    w = A*zk
    z = w / norm(w,'inf')
    
    can = 1
    wk = w
    while abs(norm(z-zk)) > tol
        can = can + 1
        zk = z
        wk = w
        
        w = A*zk

        z = w / norm(w,'inf')
    end
    
    i = 0
    for i=1:size(wk,1)
        if w(i) <> 0
            break
        end
    end
    
    eigenvalue = w(i) / zk(i)
endfunction

function compare_eigenvalues(A,z0,tol)
    [z,eigenvalue,can] = potencia(A,z0,tol)
    
    real_eigen = max(spec(A))
    
    printf("El valor real del autovalor es: %f, el aproximado es: %f\n",real_eigen,eigenvalue)
    printf("El error es de: %f\n",abs(real_eigen - eigenvalue))
endfunction
