function positions = billiardSetup(p, width, height, r, q)
    % Spawn regular billiard setup
    row = 5; % Number of rows
    q = q + 1; % Start with ball 2
    space = 2; % Space between balls
    nrow = 0; % hur många bollar per rad det är
    
    for n = 1:1:row
        nrow = nrow + 1; % lägg dit en boll per rad
    
        for m = 1:1:nrow % lägg in alla bollar i raden man är på
            p(1,1,q) = 2/3*width + (nrow)* r * space;
            p(2,1,q) = height/2 + space/2*(nrow-1)*r - space * r * (m -1);
        
            q = q + 1; % gå till nästa boll
        end
    end
    positions = p;
end