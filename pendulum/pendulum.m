clear
clc

y0 = [1 0.3]'; % C.I. [ x, dx, th, dth]

%simulation parameters
t0 = 0;
st = 1e-3;
tfinal= 20;

% Parameters

a = 1;
b = 0.5;

% Pendulum Dynamics

f_1 = @(x) x(2);
f_2 = @(x) -a*sin(x(1));
%f_2 = @(x) -a*sin(x(1)) -b*x(2);

F = @(x) [f_1(x) ; f_2(x)] ;

V = @(x) a*(1 - cos(x(1))) + 0.5*x(2)^2;

%solve
% made it to solve yp = F(t,y)
% with ic y(t0) = y

y = y0;
yout = y;
Vout = V(y);

for t = t0: st: tfinal-st
    %% Euler
        s = F(y);
        y = y + st*s;
        
        yout = [yout y];
        Vout = [Vout V(y)];
end

out.x = yout;
out.V = Vout;

% Plot

close all

fSize=18;

widthFig = 6;
heigthFig = 4;

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
plot(out.x(1,:),out.x(2,:),'LineWidth',2,'LineStyle','-','Color',colors{1})
xlabel('x_1')
ylabel('x_2')
%------------------------------------------------------------
figTra = figure('units','inch','Position',[6.8,0.5,widthFig,heigthFig]);

hold on
plot(t,out.x(1,:),'LineWidth',2,'LineStyle','-','Color',colors{1})
plot(t,out.x(2,:),'LineWidth',2,'LineStyle','-','Color',colors{2})
hold off
legend('x_1','x_2')
%------------------------------------------------------------
figV = figure('units','inch','Position',[13,0.5,widthFig,heigthFig]);

plot(t,out.V,'LineWidth',2,'LineStyle','-','Color',colors{1})
xlabel('Time [s]')
ylabel('V(x)')

%------------------------------------------------------------
%------------------------------------------------------------
%exportgraphics(figPPortrait,'PPortrait.pdf','ContentType','vector')

disp('Plotted!!')

% clearvars  -except out st

