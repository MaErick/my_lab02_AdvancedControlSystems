%----------------------------------------------------
%Ultima actualización:11/11/21
%Tema: Control por modos deslizantes
%referencia principal: slotine 1991
%----------------------------------------------------
function datos_sys2_SMC()
     close all;
to=0; % start time
tf=4; % end time
t=linspace(to,tf,400);
xo(1)=0; % initial condition
xo(2)=0;
global fileID
fileID = fopen('Deslizante.txt','w');
options1=odeset('RelTol',0.001);
%--- Definimos el sistema: x^(2)=c(t)cos(3x)+u
%x^(2): segunda derivada de x
%u: ley de control
##function [xpdot] = nonlinearPHI(t,xp)
##eta=0.1;
##xpd=sin(pi*t/2);
##xpd1=(pi/2).*(cos(pi*t/2));
##xpdot=[-20*xp(1)+(0.5*xpd1.^2.*abs(cos(3*xpd))+eta)]; 
##endfunction
##[t,xphi] = ode45(@(t,xp)nonlinearPHI(t,xp),t,xo,options1);
##global phi_v=xphi;
function [xdot] = nonlinear(t,x)
%c=0+3*rand;
%phi_blt=0.1;%phi: boundary layer thickness
c=abs(sin(t))+1;
eta=0.1;
w=0.5*pi;
xd=sin(w*t);
xd1=cos(w*t)*w;
xd2=-sin(w*t)*w^2;
lamda=20;
F=0.5*(x(2)^2)*abs(cos(3*x(1)));
k=F+eta;
s=x(2)-xd1+lamda*(x(1)-xd); 
%ley de control_1 Conmutada(switching)
u=-(1.5*x(2)^2*cos(3*x(1)))+xd2-lamda*(x(2)-xd1)-k*sign(s);
%Ley de control_2 conmutada con aproximacion continua<-- to avoid chattering:
##xphi1=[-20*phi_v+(0.5*xd1.^2.*abs(cos(3*xd))+eta)];
##   u=-(1.5*x(2)^2*cos(3*x(1)))+xd2-lamda*(x(2)-xd1)-(k-xphi1)*sat(s,phi_v);
                %------------------
xdot=[x(2);
c*x(2)^2*cos(3*x(1))+u];   
end 
%Resolvemos la dinamica del sistema con el solver ode23:
[t,xsol] = ode45(@(t,x)nonlinear(t,x),t,xo,options1);
x=xsol;

%---------------Para la ley de control_1------------
## xtilde=xsol(:,1)-sin(pi*t/2);%error: xtilde=x(:,1)-xd
##  %Ley de control:
## u1=-1.5*(xsol(:,2)).^2.*cos(3*xsol(:,1))-((pi.^2)/4).*(sin(pi*t/2))-20*(xsol(:,2)-(pi/2).*(cos(pi*t/2)))-(0.5.*(xsol(:,2)).^2.*abs(cos(3.*xsol(:,1)))+0.1).*sign(xsol(:,2)-(pi/2).*(cos(pi.*t/2))+20.*(xsol(:,1)-sin(pi.*t/2)));
 
%---------------Para la ley de control_2------------
 xtilde=xsol(:,1)-sin(pi*t/2);%error: xtilde=x(:,1)-xd
 %Ley de control:
 u1=-1.5*(xsol(:,2)).^2.*cos(3*xsol(:,1))-((pi.^2)/4).*(sin(pi*t/2))-20*(xsol(:,2)-(pi/2).*(cos(pi*t/2)))-(0.5.*(xsol(:,2)).^2.*abs(cos(3.*xsol(:,1)))+0.1).*sat(xsol(:,2)-(pi/2).*(cos(pi.*t/2))+20.*(xsol(:,1)-sin(pi.*t/2)),0.1);
 
s1=x(:,2)-(pi/2).*(cos(pi.*t/2))+20*(x(:,1)-sin(pi.*t/2)); 


  
  
   y=[t,x,u1];
fprintf(fileID,'%10.6f %10.6f %10.6f %10.6f\n',y);
fclose(fileID); 

xlabel('Time (s)')
ylabel('Amplitude')
hold on
plot(t,x(:,1))
plot(t,x(:,2))
legend('x1','x2')
grid on

figure,
plot(t,u1)
legend('u');
figure,
grid on

plot(t,xtilde)
legend('\widetilde{x}');
figure,
plot(t,phi_v)
plot(t,s1)
legend('phi','surface');

grid on

end