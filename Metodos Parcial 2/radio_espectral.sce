function x = radio_espectral(A)
    x = max(abs(spec(A)))
endfunction

// A = [4 3 0;3 4 -1;0 -1 4]
// radio_espectral(A)
// ans =
// 7.1622777 
