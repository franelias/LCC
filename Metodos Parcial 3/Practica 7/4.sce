// Error de interpolación
function w = err(p,x,cot)
    // Entrada: p = valor real, x = nodos de interpolación, cot = cota de |f^(n))|
    // Salida: w = error de interpolación en x = p
    n = length(x)
    w = cot/(factorial(n))
    for i=1:n do
        w = w*abs(p - x(i))
    end
endfunction

// - Solución al ejercicio - //
x = [2,2.1,2.2,2.3,2.4,2.5]
y = [0.2239,0.1666,0.1104,0.0555,0.0025,-0.0484]

p = DD_Newton(x,y)
disp("El polinomio interpolante es: ")
disp(p)

w1 = horner(p,2.15)
err1 = err(2.15,x,1) // |j_0'(x)| <= 1
disp("El valor aproximado de J_0(2.15) es: "+string(w1))
disp("con error: "+string(err1)+" < 0.5D-06")

w2 = horner(p,2.35)
err2 = err(2.35,x,1) // |j_0'(x)| <= 1
disp("El valor aproximado de J_0(2.35) es: "+string(w2))
disp("con error: "+string(err2)+" < 0.5D-06")
