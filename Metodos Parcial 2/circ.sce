function circ(r,x,y)
    xarc(x-r,y+r,2*r,2*r,0,360*64)
endfunction

function draw_gershgorin(A)
    [n,m] = size(A)
    
    rect=[-100,-20,100,20]
    plot2d(0,0,0,rect=rect,frameflag=3)
    
    for i=1:n
        r = 0
        for j=1:n
            if i <> j
                r = r + abs(A(i,j))
            end
        end
        
        circ(r,A(i,i),0)
    end
endfunction
