%{
J=\int_0^t_f L(x,u) dt
min J
%}
function J = cost(x,u,dt)
u_len = length(u);
J = 0;
for i=1:u_len
    J = J+0.5*(sum(x(:,i).^2)+sum(u(:,i).^2))*dt;
end
end

