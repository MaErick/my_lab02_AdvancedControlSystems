%------------practica 2---------------

function datos1();
 
clear all; close all;
to=0;
tf=60;
t=linspace(to,tf,200);
xo(1)=-20;
xo(2)=30;

global fileID
fileID = fopen('datos.txt','w');
options1=odeset('RelTol', 0.01);
[t,x] = ode23(@(t,x)nonlinear(t,x),t,xo,options1);
##[T ,Y] = ode45 (@( t,y) test (t,y,b) , tspan , y0 ) ;
fclose(fileID);
xlabel('Time(s)')
ylabel('Amplitude')
drawnow
hold on
plot(t, x(:,1))
plot(t,x(:,2),'-.')
legend('x1','x2');
grid

endfunction
function [xdot]=nonlinear(t,x)
     %nonlineal model to integrate with ode45
     %parameters
     %deslizante control
global fileID
%
##b=-1+4*rand(1,1);
b=1;
a=1;
k=1;
%backstepping control law
u=(-2-a*cos(x(1)))*(x(1)+a*sin(x(1))+x(2))-x(1)-k*(x(2)+2*x(1)+a*sin(x(1)));
%model dynamics
xdot=[x(1)+b*sin(x(1))+x(2);
u];
fprintf(fileID,'%10.6f %10.6f %10.6f %10.6f \n',t,u,x(1),x(2));
##
endfunction
