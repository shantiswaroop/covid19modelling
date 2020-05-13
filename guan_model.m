function dydt = guan_model(t,y,Z)

ylag = Z(:,1);

global N mu beta gamma tau

dydt = zeros(4,1);

dydt(1) = mu*N - (beta*y(1)*y(3)/N) - mu*y(1);
dydt(2) = (beta*y(1)*y(3)/N) - (beta*ylag(1)*ylag(3)/N)*exp(-mu*tau) - mu*y(2);
dydt(3) = (beta*ylag(1)*ylag(3)/N)*exp(-mu*tau) - gamma*y(3) - mu*y(3);
dydt(4) = gamma*y(3) - mu*y(4);

end
