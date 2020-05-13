% function covid_model

close all
clear all
clc

%% Defining delays

global beta alpha gamma p tau

N = 100;                                % Total polulation
sigma = 2;                              % Duration of E(t) that remain asymptomatic and non-infectious              
tau = 4;                                % Duration of I(t) that remain asymptomatic but are infectious
kappa = 10;                             % Quarantine duration of Q(t) with a probability of p
beta_tilda = 0.25;                      % Infection rate
m = 500;                                % density of contacts
gamma = 0.75;                           % Self-recovery rate
p = 0.2;                                % Probability of identifying and isolating an infected individual
alpha = 0;                              % Rate of immunity loss

beta = beta_tilda*m;
tau_1 = sigma;
tau_2 = sigma + tau;
tau_3 = sigma + tau + kappa;
tau_4 = sigma + kappa;
del = [tau_1 tau_2 tau_3 tau_4];
tspan = [0 5];
hist = [N-5 0 5 0 0]';
t = linspace(tspan(1),tspan(2),tspan(2)*100);

sol = dde23(@covid_model_dde,del,hist,tspan);

final_states = deval(sol,t);

figure(1)
plot(t,final_states(1,:))
hold on
% plot(t,final_states(2,:))
% plot(t,final_states(3,:))
% plot(t,final_states(4,:))
% plot(t,final_states(5,:))
xlabel('No. of Days','Interpreter','latex')
ylabel('Population','Interpreter','latex')
box off
set(gca,'FontSize',15)

% end
