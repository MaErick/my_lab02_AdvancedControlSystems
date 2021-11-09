 clear all; 
  to=0; %Start time 
  tf=20; %end time 
  t=linspace(to,tf,30000);
  xo(1)=-20; %initial condition 
  xo(2)=30;
  a=1;
  k=1000;
  %backstepping control law
 global fileID
fileID = fopen('datosc.txt','w'); 
  %model dynamics
   xdot= @(t,x)[x(1)+a*sin(x(1))+x(2);
                 (-2-a*cos(x(1)))*(x(1)+a*sin(x(1))+x(2))-x(1)-k*(x(2)+2*x(1)+a*sin(x(1)));
                 ];
        
  [t,xdo]=RK4(xdot,to,tf,xo,0.001);
xsol=xdo  ; 

u1=(-2-cos(xsol(:,1))).*(xsol(:,1)+sin(xsol(:,1))+xsol(:,2))-xsol(:,1)-k.*(xsol(:,2)+2.*xsol(:,1)+sin(xsol(:,1))); 
 
 y=[t',xsol,u1] 
  
  fprintf(fileID,'%10.6f %10.6f %10.6f %10.6f \n',y);
  hold on
  plot(t,xsol,'-.')
  plot(t,u1,'-.')
  fclose(fileID);