function datos1c();
  clear all;
  clc;
 to=0;
tf=20;
t=linspace(to,tf,1000);
xo(1)=-20;
xo(2)=30;

a=1;
k=1000;
   
options1=odeset('RelTol', 0.001);

for b=linspace(-1,3,20);
  pendulum = @(t,x) [x(1)+b*sin(x(1))+x(2);
                 (-2-a*cos(x(1)))*(x(1)+a*sin(x(1))+x(2))-x(1)-k*(x(2)+2*x(1)+a*sin(x(1)));
                 ];

    [t,x ] = ode23(pendulum,t,xo,options1);
 xsol=x  ; 

u1=(-2-cos(xsol(:,1))).*(xsol(:,1)+sin(xsol(:,1))+xsol(:,2))-xsol(:,1)-k.*(xsol(:,2)+2.*xsol(:,1)+sin(xsol(:,1))); 
 y=[t,xsol,u1]'


 
 
xlabel('Time(s)')
ylabel('Amplitude')
drawnow
hold on
plot(t, xsol(:,1))
plot(t,xsol(:,2))
plot(t,u1)
legend('x1','x2','u');
grid
endfor
endfunction