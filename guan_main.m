% function guan_main

clear all
clc

global N mu beta gamma tau

N = 8e7;
mu = 0.01;
beta = 0.5;
gamma = 1/6;
tau = 5;
tspan = [0 500];


sol = dde23(@guan_model,tau,@guan_hist,tspan);
t = linspace(tspan(1),tspan(2),1000);
y_new = deval(sol,t);
total_infections = y_new(3,:) + y_new(4,:);
y_active = total_infections - y_new(4,:);

figure(1)
plot(t,y_new(1,:),'r')
hold on
plot(t,y_new(2,:),'b')
plot(t,total_infections,'k')
% plot(t,y_new(3,:),'k')
plot(t,y_new(4,:),'m')
box off
set(gca,'FontSize',15)
legend({'Susceptible','Exposed','Infected','Recovered'},'Interpreter','latex','Location','west')
xlabel('No. of Days','Interpreter','latex')
ylabel('Population','Interpreter','latex')
% set(gca,'YScale','log')

figure(2)
plot(t,total_infections,'r')
hold on
plot(t,y_new(4,:),'b')
plot(t,y_active,'k')
box off
set(gca,'FontSize',15)
legend({'Infected','Recovered','Active'},'Interpreter','latex','Location','northwest')
xlabel('No. of Days','Interpreter','latex')
ylabel('Population','Interpreter','latex')
% % set(gca,'YScale','log')








% end


% function [x,sum,tau,I] = MQP_I_t_B(maxiteri)
% 
% % clear all
% % clc
% 
% global tau gamma miu maxiter B N
% 
% % miu = 1/(78*365);
% miu = 1/100;
% % B = randnum(0.4,2);
% % gamma = randnum(2,7);
% tau = 5;
% x = 0.5:0.1:700;
% % B = 1.0;
% gamma = 1/6;
% maxiter = maxiteri;
% N = 10000;
% % h = 500;
% h = 50;
% tspan = 0:30;
% 
% for i = 1:maxiter
%     
%     % tau = randnum(2,7);               % a vector of tau
%     B = randnum(0.4,2);
%     sol = dde23(@delay_func,tau,@history,tspan);
%     I(i) = max(sol.y(3,:));             % this is my QOI
%     % r = R0(B);
%     
% end
% 
% % [min(r),max(r)]
% sum = zeros(1,length(x));
% 
% for ell = 1:length(x)
%     
%     % for each x(ell), sum over all QOI
%     % sum = zeros(1,length(x));
%     for k = 1:maxiter
%         
%         tmp(k) = (x(ell) - I(k))/h;
%         sum(ell) = sum(ell) + KDE(tmp(k));
%         KDE(tmp(k));
%         
%     end
%     
%     sum(ell) = sum(ell)/(maxiter*h);
%     % now you have (x,sum)
%     
% end                 % end ell loop
% 
% end