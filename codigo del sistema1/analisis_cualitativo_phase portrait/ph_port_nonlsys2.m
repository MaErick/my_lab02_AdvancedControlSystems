%Phase portrait sistema 1, practica 2
  clear all;
  clc;
  a=1;
k=1;
%backstepping control law
##u=(-2-a*cos(x(1)))*(x(1)+a*sin(x(1))+x(2))-x(1)-k*(x(2)+2*x(1)+a*sin(x(1)));


  pendulum = @(t,x)[x(1)+a*sin(x(1))+x(2);
   (-2-a*cos(x(1)))*(x(1)+a*sin(x(1))+x(2))-x(1)-k*(x(2)+2*x(1)+a*sin(x(1)))];


%time step
  t_time=linspace(0,10,700)
  %Initial Conditions:
    %x_0: (angulo_j, velocidad_i)
##     xo(1)=-20; %initial condition 
##       xo(2)=30;
  for i=-30:7:-10
    for j=10:7:40
    [t,x ] = ode45 (pendulum,t_time,[i*pi/180,j*pi/180] );

  plot((180/pi)*x(:,1),(180/pi)*x(:,2))
  hold on
  drawnow
  endfor
  endfor

  grid on
% adding label to the x-axis
xlabel('x(1)');
 
% adding label to the y-axis
ylabel('x(2)');
 
% adding title for the plot
title('Phase portrait');
pkg load optim

    pendulum_A = @(x)[x(1)+a*sin(x(1))+x(2);
   (-2-a*cos(x(1)))*(x(1)+a*sin(x(1))+x(2))-x(1)-k*(x(2)+2*x(1)+a*sin(x(1)))];
  A=jacobs([0,0], pendulum_A)
  lambda = eig (A)