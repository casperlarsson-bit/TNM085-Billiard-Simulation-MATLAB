function plotVelocity(v,h,tf)
    %Plot absolute velocitp through animation
    figure(2)
    t = h:h:tf+h;
    hold on
    for n = 1:1:size(v,3)
        txt = num2str(n);
        plot(t,sqrt((v(1,:,n)).^2 + (v(2,:,n)).^2),'DisplayName',txt)
    end
    legend show
    title('Absolute velocity')
    ylabel('Velocity m/s')
    xlabel('Time (s?)')
end