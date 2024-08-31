function J = cost(x,u,dt)
l = length(u);
J = 0;
for i=1:l
    J = J+(u(i)^2)*dt;
end
end

