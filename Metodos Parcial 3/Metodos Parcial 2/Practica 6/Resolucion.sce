function gres(A)
    [n,m] = size(A)
    
    centros = diag(A)
    radios = sum(abs(A), 'c') - abs(centros)
    
    mx = round(min(centros - radios) - 1)
    Mx = round(max(centros + radios) + 1)
    
    my = round(min(-radios) - 1)
    My = -my
    
    rectangulo = [mx, my, Mx, My]
    
    s = spec(A);
    plot2d(real(s), imag(s), -1, "031", "", rectangulo)
    xgrid();
    for i = 1:n
        circ(radios(i), centros(i), 0)
    end
endfunction
