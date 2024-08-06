close all

fSize=10;

widthFig = 6;
heigthFig = 3;

colors =   {"#0072BD";
            "#D95319";
            "#EDB120";
            "#7E2F8E";
            "#77AC30";
            "#4DBEEE";
            "#A2142F"};

t = (0:st:tfinal)';

%------------------------------------------------------------
figPPortrait = figure('units','inch','Position',[0.5,0.5,widthFig,heigthFig]);

    plot(out.x(1,:),out.x(2,:),'LineWidth',2,'LineStyle','-','Color',colors{2})

%------------------------------------------------------------
%------------------------------------------------------------
exportgraphics(figPPortrait,'PPortrait.pdf','ContentType','vector')

disp('Plotted!!')
