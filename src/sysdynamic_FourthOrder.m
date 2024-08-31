function x = sysdynamic(x0,u,dt)
l = length(u);
x = zeros(4,l);
dx = zeros(4,1);
g = 9.81;
m1=1;m2=0.3; rl=0.5;
for i=1:l
    x(:,i)= x0;
    x1=x0(1); x2=x0(2);x3=x0(3);x4=x0(4);
    dx(1) = x3;
    dx(2)= x4;
    dx(3)= (rl*m2*sin(x2)*x4^2+u(i)+m2*g*cos(x2)*sin(x2))/(m1+m2*(1-(cos(x2))^2));
    dx(4)= -(rl*m2*cos(x2)*sin(x2)*x4^2+u(i)*cos(x2)+(m1+m2)*g*sin(x2))/(rl*m1+rl*m2*(1-(cos(x2))^2));
    x_next = x0+dx*dt;
    x0 = x_next;
end
end

