function [t,xdo]=RK4(f,t0,tf,x0,h)

t=t0:h:tf;
length(t);
x=x0';
xdo=x0;
for i=1:(length(t)-1);
    k1=f(t(i),x);
    k2=f(t(i)+0.5*h,x+0.5*h*k1);
    k3=f((t(i)+0.5*h),(x+0.5*h*k2));
    k4=f((t(i)+h),(x+k3*h));
    x=x+(1/6)*(k1+2*k2+2*k3+k4)*h;
    xdo(i+1,:)=x;
end
end