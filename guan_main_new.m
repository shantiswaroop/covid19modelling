% function guan_main_new

clear all
clc

global N alpha beta gamma tau

N = 8e7;
alpha = 0.01;
beta = 0.5;
gamma = 1/6;
tau = 5;
tspan = [0 500];
hist = [N-5 0 5 0];

sol = dde23(@guan_model_new,tau,hist,tspan);
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

% figure(2)
% plot(t,total_infections,'r')
% hold on
% plot(t,y_new(4,:),'b')
% plot(t,y_active,'k')
% box off
% set(gca,'FontSize',15)
% legend({'Infected','Recovered','Active'},'Interpreter','latex','Location','northwest')
% xlabel('No. of Days','Interpreter','latex')
% ylabel('Population','Interpreter','latex')

% end