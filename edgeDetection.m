function [outPosition, outVelocity, outAngle,outFriction, outCounter] = edgeDetection(inPosition, prevPosition, inVelocity, inAngle, width, height,r,inFriction, inCounter)
    % Test if ball is outside playarea, then mirror velocity in that axis
    % and compensate for energy loss
    %
    % [outPosition, outVelocity, outAngle,outFriction, outCounter] = edgeDetection(inPosition, prevPosition, inVelocity, inAngle, width, height,r,inFriction, inCounter)
    %
    % inPosition is 2D position of the ball to be tested
    % prevPosition is the position in the previous iteration
    % inVelocity is the current 2D velocity
    % inAngle is the current angle of the ball
    % width and height are the dimension of the table
    %
    % outPosition is the new position, from the previous iteration if edge
    % intersection is made
    % outVelocity is the new velocity, mirrored if edge intersection is
    % made
    % outAngle is the new angle
    
    % Elasticity, temporarily
    elast = 0.5;
    
    if norm([-r -r] - inPosition) <= 3*r/2 || norm([width+r -r] - inPosition) < 3*r/2 || norm([width+r height+r] - inPosition) < 3*r/2 || norm([-r height+r] - inPosition) < 3*r/2 || norm([width/2 -r] - inPosition) < 3*r/2 || norm([width/2 height+r] -inPosition) < 3*r/2 
        % Test if ball goes in a hole
        outPosition = [inCounter -0.2];
        outVelocity = [0 0];
        outAngle = inAngle;
        outFriction = 0;
        
        outCounter = inCounter + 2.5*r; % Change position for next ball
    % Test if colliding with the wall
    elseif inPosition(2) >= height || inPosition(2) <= 0
        outVelocity(2) = -elast * inVelocity(2);
        outVelocity(1) = elast * inVelocity(1);
        
        outPosition(1) = prevPosition(1);
        outPosition(2) = prevPosition(2);
        outAngle = -inAngle; % Change tau correctly when y bounce, see note for proof

        outFriction = inFriction;
        outCounter = inCounter;
    elseif inPosition(1) >= width || inPosition(1) <= 0
        outVelocity(1) = -elast * inVelocity(1);
        outVelocity(2) = elast * inVelocity(2);
        
        outPosition(1) = prevPosition(1);
        outPosition(2) = prevPosition(2);
        outAngle = pi - inAngle; % Change tau correctly when x bounce, see note for proof

        outFriction = inFriction;
        outCounter = inCounter;
    else
        outPosition = inPosition;
        outVelocity = inVelocity;
        outAngle = inAngle;
        outFriction = inFriction;
        outCounter = inCounter;
    end
end