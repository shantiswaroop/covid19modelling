% function solve_simple_sir

close all
clear all
clc

global beta N gamma mu

% global beta N mu gamma

beta = 0.8;
N = 8e7;
% N = 1.387e9;
gamma = 0.025;
mu = 0.001;

% y0 = [N 1 0 0]';
y0 = [N 5 0 0]';
tspan = [0 150];

sol = ode45(@deriv,tspan,y0);
t = linspace(tspan(1),tspan(2),1000);
y_new = deval(sol,t);
total_infections = y_new(2,:) + y_new(3,:) + y_new(4,:);
y_active = total_infections - y_new(3,:) - y_new(4,:);
% y_active = y_new(2,:) - y_new(3,:) - y_new(4,:);

figure(1)
plot(t,y_new(1,:),'r')
hold on
% plot(t,y_new(2,:),'b')
plot(t,total_infections,'b')
plot(t,y_new(3,:),'k')
plot(t,y_new(4,:),'m')
box off
set(gca,'FontSize',15)
legend({'Susceptible','Infected','Recovered','Dead'},'Interpreter','latex','Location','west')
xlabel('No. of Days','Interpreter','latex')
ylabel('Population','Interpreter','latex')
% set(gca,'YScale','log')

figure(2)
plot(t,total_infections,'r')
hold on
plot(t,y_new(3,:),'b')
plot(t,y_new(4,:),'k')
plot(t,y_active,'m')
box off
set(gca,'FontSize',15)
legend({'Infected','Recovered','Dead','Active'},'Interpreter','latex','Location','northwest')
xlabel('No. of Days','Interpreter','latex')
ylabel('Population','Interpreter','latex')
% set(gca,'YScale','log')


% figure(1)
% plot(t,y_new(1,:),'m')
% hold on
% plot(t,y_new(2,:),'r')
% plot(t,y_new(3,:),'b')
% plot(t,y_new(4,:),'k')
% box off
% set(gca,'FontSize',15)
% legend({'Susceptible','Infected','Recovered','Dead'},'Interpreter','latex','Location','northwest')
% xlabel('No. of Days','Interpreter','latex')
% ylabel('Population','Interpreter','latex')
% 
% figure(2)
% plot(t,y_new(2,:),'r')
% hold on
% plot(t,y_new(4,:),'b')
% plot(t,y_new(3,:),'c')
% plot(t,y_active,'k')
% box off
% set(gca,'FontSize',15)
% legend({'Infected','Dead','Recovered','Active'},'Interpreter','latex','Location','northwest')
% xlabel('No. of Days','Interpreter','latex')
% ylabel('Population','Interpreter','latex')


last_term = beta*total_infections/N;

rt = beta - gamma - mu - last_term;

figure(3)
plot(log(total_infections),rt,'r')
hold on
box off
set(gca,'FontSize',15)
xlabel('Infections','Interpreter','latex')
ylabel('Log-growth rate of toral infections','Interpreter','latex')
% set(gca,'YScale','log')
% set(gca,'XScale','log')


% end