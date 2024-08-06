function [out,st] = massSpring(y0,tfinal)
%%
%simulation parameters
t0 = 0;
st = 1e-3;



%% Mass Spring Dynamics

f_1 = @(x) x(2);
f_2 = @(x) -x(1);

F = @(x) [f_1(x) ; f_2(x)] ;

%solve
% made it to solve yp = F(t,y)
% with ic y(t0) = y

y = y0;
yout = y;

for t = t0: st: tfinal-st
    %% Euler
        s = F(y);
        y = y + st*s;
        
        yout = [yout y];
end

out.x = yout;


 clearvars  -except out st
end
