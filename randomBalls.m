function positions = randomBalls(N, p, width, height, r)
    % N balls placed att random locations
    for n = size(p,3)+1:1:N
        while 1
            unique = true;
            p(1,1,n) = 2*r+(width-2*r)*rand(1);
            p(2,1,n) = 2*r+(height-2*r)*rand(1);
        
            for i = 1:1:n-1
                if norm(p(1:2,1,n) - p(1:2,1,i)) <= 2.5*r
                    unique = false;
                    break;
                end
            end
    
            if unique
                break;
            end
        end
    end
    positions = p;
end