function datos1c();
  clear all;
  clc;
 to=0;
tf=20;
t=linspace(to,tf,1000);
xo(1)=-20;
xo(2)=30;
b=1;%comentar para ejercicio 5
a=1;
k=1000;
   
options1=odeset('RelTol', 0.001);
global fileID %comentar para ejercicio 5
fileID = fopen('datosc.txt','w'); %comentar para ejercicio 5
##for b=linspace(-1,3,20);
  pendulum = @(t,x) [x(1)+b*sin(x(1))+x(2);
                 (-2-a*cos(x(1)))*(x(1)+a*sin(x(1))+x(2))-x(1)-k*(x(2)+2*x(1)+a*sin(x(1)));
                 ];

    [t,x ] = ode23(pendulum,t,xo,options1);
 xsol=x  ; 

u1=(-2-cos(xsol(:,1))).*(xsol(:,1)+sin(xsol(:,1))+xsol(:,2))-xsol(:,1)-k.*(xsol(:,2)+2.*xsol(:,1)+sin(xsol(:,1))); 
 y=[t,xsol,u1]'


 fprintf(fileID,'%10.6f %10.6f %10.6f %10.6f \n',y); %comentar para ejercicio 5
fclose(fileID); %comentar para ejercicio 5
 
xlabel('Time(s)')
ylabel('Amplitude')
drawnow
hold on
plot(t, xsol(:,1))
plot(t,xsol(:,2))
plot(t,u1)
##legend('x1','x2');
legend('x1','x2','u');
grid
##endfor
endfunction