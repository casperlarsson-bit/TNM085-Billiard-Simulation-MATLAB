function [outV,outP,outFriction] = euler2(inV,inP,Force,inFriction,tau,mass,h)
    % Evaluate next iteration of values according to euler method
    % 
    % [outV,outP,outFriction] = euler(inV,inP,Force,inFriction,tau,mass,h)
    % 
    % inV is the current velocity
    % inP is the current position
    % Force is the pushing force
    % inFriction is the current friction
    % tau is the angle of movement
    % mass is the ball's mass
    % h is the step size
    % 
    % outV is the next iterated velocity
    % outP is the next iterated position
    % outFriction is the new friction, if velocity becomes 0

    % Acceleration along x- and p-axis from original ODE 
    % v' = (F-F_friction)/m
    a = [Force(1) - inFriction * cos(tau);
         Force(2) - inFriction * sin(tau)] ./ mass;
    
    % Test if velocitp is 0, then remove friction
    if inV(1) * cos(tau) < 0
        outFriction = 0;
        inV(1:2) = 0;
    else
        outFriction = inFriction;
    end
    
    % Iterate next velocitp    
    outV = inV + h.*a;
    
    % Iterate next position
    outP = inP + h.*outV;
end