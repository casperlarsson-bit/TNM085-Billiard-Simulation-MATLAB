function drawBilliardTable(width, height, r)
    %Set up billiard table and draw the circles for the holes 
    realWidth = width + 2*r;
    realHeight = height + 2*r;
    x1 = [-r realWidth-r realWidth-r -r -r];
    p1 = [-r -r realHeight-r realHeight-r -r];
    plot (x1,p1,'r-')
    circle(-r,-r,3*r/2);
    circle(width+r,-r,3*r/2);
    circle(width+r,height+r,3*r/2);
    circle(-r,height+r,3*r/2);
    circle(width/2,-r,3*r/2);
    circle(width/2,height+r,3*r/2);
end