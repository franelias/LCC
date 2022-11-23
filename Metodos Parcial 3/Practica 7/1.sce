x = [0 0.2 0.4 0.6]
y = [1.0 1.2214 1.4918 1.8221]

lagrange(1/3,[0 0.6],[1.0 1.8221])
lagrange(1/3,x,y)

interpolacion_newton(1/3,[0 0.6],[1.0 1.8221])
interpolacion_newton(1/3,x,y)

function y=cota(x)
    y=(x-0)*(x-0.2)*(x-0.4)*(x-0.6)*(%e^(0.6))/24
endfunction

printf("valor real: %f, newton: %f, error: %f, cota error: %f",%e^(1/3),interpolacion_newton(1/3,x,y),abs(%e^(1/3)-interpolacion_newton(1/3,x,y)),cota(1/3))

res = 1.395612425
