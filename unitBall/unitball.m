close all

x = -1:0.01:1;

py = @(x) sqrt(1-x.^2);

figUc = figure('units','inch','Position',[0.5,0.5,3,2]);

    hold on
        plot(py(x),x,'k','LineWidth',2)
        plot(-py(x),x,'k','LineWidth',2)
    hold off

exportgraphics(figUc,'unit.pdf','ContentType','vector')
