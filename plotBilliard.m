function plotBilliard(p,width,height)
    % Plot animation of billiard balls
    for n=1:1
    ph = plot(p(1, 1, n), p(2, 1, n), 'o');
    end
    
    set(gca,'Xlim',[-0.5 width+0.5], 'Ylim',[-0.5 height+0.5])
    
    for i = 1:size(p,2)
        ph.XData = p(1, i, :);         %change x coordinate of the point
        ph.YData = p(2, i, :);         %change y coordinate of the point
          hold on
          drawnow
        %pause(0)
       hold off
    end
    
    
    title('Billiard overview')
    ylabel('')
    xlabel('')
    hold off
end