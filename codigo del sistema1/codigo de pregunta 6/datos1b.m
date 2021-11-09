  clear all;
  close all;
  clc;
 to=0;
tf=4;
t=linspace(to,tf,4000);
xo(1)=0.91;
xo(2)=0.1;
##b=1;
##a=1;
##k=1;
d=0.1;

options1=odeset('RelTol', 0.001);

  pendulum = @(t,x) [x(2);
                 (abs(sin(t))+1).*(x(2)).^2.*cos(3*x(1))+1.5*(x(2)).^2.*cos(3*x(1))-((pi.^2)/4).*(sin(pi*t/2))-20*(x(2)-(pi/2).*(cos(pi*t/2)))-(0.5.*(x(2)).^2.*abs(cos(3*x(1)))+0.1).*sat(((x(2)-(pi/2).*(cos(pi*t/2))+20.*(x(1)-sin(pi*t/2)))),d);
                 ];
##  pendulum = @(t,x) [x(2);
##                 1.5.*(x(2)).^2.*cos(3*x(1))-1.5*(x(2)).^2.*cos(3*x(1))-((pi.^2)/4).*(sin(pi*t/2))-20*(x(2)-(pi/2).*(cos(pi*t/2)))-(0.5.*(x(2)).^2.*abs(cos(3*x(1)))+0.1).*sign(((x(2)-(pi/2).*(cos(pi*t/2))+20.*(x(1)-sin(pi*t/2)))));
##                 ];
[t,x ] = ode45 (pendulum,t,xo,options1);

xsol=x  ; 
  xtilde=xsol(:,1)-sin(pi*t/2);
  u1=(1.5*(xsol(:,2)).^2.*cos(3*xsol(:,1))-((pi.^2)/4).*(sin(pi*t/2))-20*(xsol(:,2)-(pi/2).*(cos(pi*t/2)))-(0.5.*(xsol(:,2)).^2.*abs(cos(3.*xsol(:,1)))+0.1).*sat(((xsol(:,2)-(pi/2).*(cos(pi.*t/2))+20.*(xsol(:,1)-sin(pi.*t/2)))),d));

xlabel('Time(s)')
ylabel('Amplitude')
hold on
plot(t, x(:,1))
plot(t,x(:,2),'-.')
figure,
 plot(t,u1)
## figure,
## plot(t,xtilde)
##legend('x1','x2','u');
grid
 

