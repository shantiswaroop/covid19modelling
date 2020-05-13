% function covid_model_new

close all
clear all
clc

%% Defining delays

global N beta alpha gamma p tau

N = 8e7;                                % Total polulation
sigma = 5;                              % Duration of E(t) that remain asymptomatic and non-infectious
tau = 4.5;                              % Duration of I(t) that remain asymptomatic but are infectious
kappa = 14;                             % Quarantine duration of Q(t) with a probability of p
beta_tilda = 0.75;                       % Infection rate
m = 3;                                % Density of contacts
gamma = 0.5;                            % Self-recovery rate
p = 0.75;                                % Probability of identifying and isolating an infected individual
alpha = 0.1;                            % Rate of immunity loss

beta = beta_tilda*m
r = beta/gamma                           % Basic reproduction number
tau_1 = sigma;
tau_2 = sigma + tau;
tau_3 = sigma + tau + kappa;
del = [tau_1 tau_2 tau_3];
tspan = [0 500];
hist = [N-5 0 5 0 0]';
t = linspace(tspan(1),tspan(2),tspan(2)*100);

sol = dde23(@covid_model_new_dde,del,hist,tspan);
final_states = deval(sol,t);
total_infections = final_states(3,:) + final_states(4,:) + final_states(5,:);
y_active = total_infections - final_states(5,:);


figure(1)
plot(t,final_states(1,:),'r')
hold on
plot(t,final_states(2,:),'b')
% plot(t,total_infections,'k')
plot(t,final_states(3,:),'k')
plot(t,final_states(4,:),'g')
plot(t,final_states(5,:),'m')
xlabel('No. of Days','Interpreter','latex')
ylabel('Population','Interpreter','latex')
legend({'Susceptible','Exposed','Infected','Quarantined','Recovered'},'Interpreter','latex','Location','northeast')
box off
set(gca,'FontSize',15)


% end
