function [ph,ph1]=dynamic_BoundaryLayerTicknes(eta,lambda,[xd, xd1],[xo1 ,xo2])
%Phase portrait of the list 1: exercise d)
##a=length(x);
##
##for i=1:1:a
to=0; % start time
tf=4; % end time
t=linspace(to,tf,400);
##xo(1)=0; % initial condition
##xo(2)=0;

function [xpdot] = nonlinear1(t,xp)
##eta=0.1;
##xpd=sin(pi*t/2);
##xpd1=(pi/2).*(cos(pi*t/2));
xpdot=[-lambda*xp(1)+(0.5*xd1.^2.*abs(cos(3*xd))+eta)]; 
endfunction  
options1=odeset('RelTol',0.001);
[t,xsol] = ode45(@(t,xp)nonlinear1(t,xp),t,[xo1 xo2],options1);
ph=xsol;
ph1=[-lambda*phi_v(1)+(0.5*xd1.^2.*abs(cos(3*xd))+eta)]; 

##hold on
##plot(t,phi_v(:,1))
##end
end