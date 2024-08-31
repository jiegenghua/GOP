%{
system dynamics, can be state-dependent switched systems, time-delay
systems, and classical systems
Input:
x0: initial state, dimension: n_x by 1
u: control input
dt: sampling time
Output:
x: a state trajectory
%}
function x = sysdynamic(x0,u,dt)
nu = size(u,1);
u_len = size(u,2);
x = zeros(length(x0),u_len);

A1 = [-1 2;-2 -1];
A2 = [-2 -2; 1 -0.5];
A3 = [-0.5 -5; 1 -0.5];
A4 = [-1 0;2 -1];
B = [1;1];
%B = [1,0; 1,1];
for i=1:u_len
    x(:,i)= x0;
    x1 = x0(1); 
    x2 = x0(2);
    if x2 < -5 && x1 < -5
        dx = A1*x0+B*u(:, i);
    elseif x2 >= -5 && x1 <= -2 && x1-x2 <= 0
         dx = A2*x0+B*u(:, i);
    elseif  x1 >= -5 && x1-x2 > 0 && x2 <= -2
         dx = A3*x0+B*u(:,i);
    elseif x1 > -2 && x2 > -2
         dx = A4*x0+B*u(:, i);
    end
    x_next = x0+dx*dt;
    x0 = x_next;  
end

end

