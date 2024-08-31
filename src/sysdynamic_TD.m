function x = sysdynamic(x0,u,dt)
lnplen = length(u);
x = zeros(length(x0),lnplen);
td = 1;   % time delay in the state
xahead = ones(1,td/dt)*x0;
new_x = xahead;
for i=1+td/dt:(length(xahead)+length(x))
    x(:,i-(td/dt))= x0; 
    xd = new_x(:,i-td/dt);
    dx = x0+u(i-td/dt)+xd;
    x_next = x0+dx*dt;
    x0 = x_next;  
    new_x = [xahead(1:end-1),x];
end
end


