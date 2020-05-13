function dy = deriv(t,y)

global beta N gamma mu

% global beta N mu gamma

% dy = zeros(4,1);

% dy(1) = (-1)*beta*y(1)*y(2)/N;
% dy(2) = beta*y(1)*y(2)/N - (mu*y(2)) - (gamma*y(2));
% dy(3) = gamma*y(2);
% dy(4) = mu*y(2);

dy = [(-1)*beta*y(1)*y(2)/N; (beta*y(1)*y(2)/N)  - (gamma*y(2)) - (mu*y(2)); gamma*y(2); mu*y(2)];

end