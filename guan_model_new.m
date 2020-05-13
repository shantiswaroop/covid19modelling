function dydt = guan_model_new(t,y,Z)

ylag = Z(:,1);

global N alpha beta gamma tau

dydt = zeros(4,1);

dydt(1) = alpha*N - (beta*y(1)*y(3)/N) - alpha*y(1);
dydt(2) = (beta*y(1)*y(3)/N) - (beta*ylag(1)*ylag(3)/N)*exp(-alpha*tau) - alpha*y(2);
dydt(3) = (beta*ylag(1)*ylag(3)/N)*exp(-alpha*tau) - gamma*y(3) - alpha*y(3);
dydt(4) = gamma*y(3) - alpha*y(4);

% dydt(1) = alpha*N - (beta*y(1)*y(3)/N) - alpha*y(1);
% dydt(2) = (beta*y(1)*y(3)/N) - (beta*ylag(1)*ylag(3)/N)*exp(-alpha*tau) - alpha*y(2);
% dydt(3) = (beta*ylag(1)*ylag(3)/N)*exp(-alpha*tau) - gamma*y(3) - alpha*y(3);
% dydt(4) = gamma*y(3) - alpha*y(4);

end
