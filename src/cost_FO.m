function J = cost(x,u,dt)
l = length(u);
J = 0;
for i=1:l
    J = J+(x(i)^2+u(i)^2)*dt;
end
J=J+x(end)^2;
end

