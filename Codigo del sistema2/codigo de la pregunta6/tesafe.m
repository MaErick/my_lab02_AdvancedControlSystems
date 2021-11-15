    close all;
to=0; % start time
tf=4; % end time
t=linspace(to,tf,400);
fphi=dynamic_BoundaryLayerTicknes(0.1,20,sin(pi*t/2),(pi/2).*(cos(pi*t/2)),0,0)
plot(t,fphi(1))