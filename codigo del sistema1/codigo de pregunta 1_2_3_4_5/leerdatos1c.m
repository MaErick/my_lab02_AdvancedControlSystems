%para datos1c.m

 data = fopen('datosc.txt');
 c=textscan(data, '%10.6f %10.6f %10.6f %100000.6f \n')
t=c{1};
u=c{4};
x1=c{2};
x2=c{3}; 

hold on;

xlabel('Time(s)')
ylabel('Amplitude')
drawnow
plot(t,u)
##plot(t,x1,'*',"markersize", 1.9)
##plot(t,x2,'-.')
plot(t,x1)
plot(t,x2)
legend('u','x1','x2');
grid
