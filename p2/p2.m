clc;
clear all;
close all;

%%

R = 330;
L = 10*exp(-3);
C = 820*exp(-6);

t=0:0.01:6;

wn = 1/sqrt(L*C);

%% subamortiguado 0<Z<1
Z=0.35; %Coeficiente de amortiguamiento
wd = wn*sqrt(1-Z^2);
Vo1=1.-exp(-Z.*wn.*t).*( cos(wd.*t) + (Z/sqrt(1-Z^2)).*sin(wd.*t) );
plot(t,Vo1,'LineWidth',3)
grid on
hold on
%% Amortiguamiento crítico*
Z=1; %Coeficiente de amortiguamiento
wd = wn*sqrt(1-Z^2);
Vo2=1.-exp(-Z.*wn.*t).*( cos(wd.*t) + (wn.*t) );
hold on
plot(t,Vo2,'LineWidth',3)
%% Sobreamortiguado*
Z=1.5; %Coeficiente de amortiguamiento
wd = wn*sqrt(1-Z^2);
Vo3=1.-exp(-Z.*wn.*t).*( cos(wd.*t) + (Z/sqrt(1-Z^2)).*sin(wd.*t) );
hold on
plot(t,Vo3,'LineWidth',3)
%% no amortiguado
Z=0; %Coeficiente de amortiguamiento
wd = wn*sqrt(1-Z^2);
Vo4=1.-exp(-Z.*wn.*t).*( cos(wd.*t) + (Z/sqrt(1-Z^2)).*sin(wd.*t) );
hold on
plot(t,Vo4,'LineWidth',3)
legend('1.-Subamortiguado','2.-Amortiguamiento critico','3.-Sobreamortiguado','4.-No amortiguado')
xlabel('t [segundos]')
ylabel('y(t)')
