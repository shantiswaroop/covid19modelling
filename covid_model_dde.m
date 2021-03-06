% DDE for the COVID Model

function dydt = covid_model_dde(t,y,Z)

%% Defining gloal variables

global beta alpha gamma p tau

%% Assigning the size of the vector

dydt = zeros(5,1);

%% Delays

ylag1 = Z(:,1);             % sigma
ylag2 = Z(:,2);             % sigma + tau
ylag3 = Z(:,3);             % sigma + tau + kappa
ylag4 = Z(:,4);             % sigma + kappa

%% Calculating the 5 states

dydt(1) = ((-1)*beta*y(1)*y(3)) + (alpha*y(5));
dydt(2) = beta*((y(1)*y(3)) - (ylag1(1)*ylag1(3)));
dydt(3) = beta*(ylag1(1)*ylag1(3)) - gamma*y(3) - beta*p*exp(-gamma*tau)*ylag2(1)*ylag2(3);
dydt(4) = beta*p*exp(-gamma*tau)*(ylag2(1)*ylag2(3) - ylag3(1)*ylag4(3));
dydt(5) = (-1)*alpha*y(5) + gamma*y(3) + beta*p*exp(-gamma*tau)*ylag3(1)*ylag3(3);

% dydt = [((-1)*beta*y(1)*y(3)) + (alpha*y(5))
%         beta*((y(1)*y(3)) - (ylag1(1)*ylag1(3)))
%         beta*(ylag1(1)*ylag1(3)) - gamma*y(3) - beta*p*exp(-gamma*tau)*ylag2(1)*ylag2(3)
%         beta*p*exp(-gamma*tau)*(ylag2(1)*ylag2(3) - ylag3(1)*ylag4(3))
%         (-1)*alpha*y(5) + gamma*y(3) + beta*p*exp(-gamma*tau)*ylag3(1)*ylag3(3)];

end


%% Comments
%
% Delays
%
% sigma
% sigma + tau
% sigma + tau + kappa
%
% States
%
% S = y(1)
% E = y(2)
% I = y(3)
% Q = y(4)
% R = y(5)