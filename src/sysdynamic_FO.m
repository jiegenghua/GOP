function x = sysdynamic(x0,u,dt)
l = length(u);
x = zeros(length(x0),1);
for i=1:l
    x(i)= x0;
    dx = x(i)+u(i);
    x_next = x0+dx*dt;
    x0 = x_next;   
end

end

