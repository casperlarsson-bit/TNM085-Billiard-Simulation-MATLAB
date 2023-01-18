function [outV1, outV2, outPos1, outPos2, outTau1, outTau2] = ballCollision(v1,v2,p1,p2,prevPos1,prevPos2)
    % Calculate the velocities after ball collision, as well as updates the
    % angle
    % 
    % v1 is velocity of ball 1
    % v2 is velocity of ball 2
    % p1 is position of ball 1
    % p2 is position of ball 2
    % 
    % outV1 is velocity of ball 1 after collision
    % outV2 is velocity of ball 2 after collision
    % outTau1 and outTau2 are the angles the balls move after the collision
    % accordingly

    elast = 0.95; % Temporarily elasticy

    % Velocity of the first ball
    outV1(1:2) = elast * round(v1 - dot(v1-v2,p1-p2) .* (p1-p2) ./ (norm(p1 - p2) .^ 2),6); % Avrundning pga kollision inte sker korrekt (?)
    outPos1 = prevPos1;
    outTau1 = atan2(outV1(2),outV1(1));
    
    % Velocity of the second ball
    outV2(1:2) = elast * round(v2 - dot(v2-v1,p2-p1) .* (p2-p1) ./ (norm(p2 - p1) .^ 2),6);
    outPos2 = prevPos2;
    outTau2 = atan2(outV2(2),outV2(1));
end