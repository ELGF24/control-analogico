clc; %limpiar ventana de comandos
clear all; %limpiar el workspace
close all; %cerrar ventanas emergentes
t=0:0.01:6;
Wn=2.5; %frecuencia natural
%% subamortiguado 0<Z<1
Z=0.35; %Coeficiente de amortiguamiento
Wd=Wn*sqrt(1-Z^2);
Vo1=1.-exp(-Z.*Wn.*t).*( cos(Wd.*t) + (Z/sqrt(1-Z^2)).*sin(Wd.*t) );
plot(t,Vo1,'LineWidth',3)
grid on
hold on
%% Amortiguamiento crítico*
Z=1; %Coeficiente de amortiguamiento
Wd=Wn*sqrt(1-Z^2);
Vo2=1.-exp(-Z.*Wn.*t).*( cos(Wd.*t) + (Wn.*t) );
hold on
plot(t,Vo2,'LineWidth',3)
%% Sobreamortiguado*
Z=1.5; %Coeficiente de amortiguamiento
Wd=Wn*sqrt(1-Z^2);
Vo3=1.-exp(-Z.*Wn.*t).*( cos(Wd.*t) + (Z/sqrt(1-Z^2)).*sin(Wd.*t) );
hold on
plot(t,Vo3,'LineWidth',3)
%% no amortiguado
Z=0; %Coeficiente de amortiguamiento
Wd=Wn*sqrt(1-Z^2);
Vo4=1.-exp(-Z.*Wn.*t).*( cos(Wd.*t) + (Z/sqrt(1-Z^2)).*sin(Wd.*t) );
hold on
plot(t,Vo4,'LineWidth',3)
legend('1.-Subamortiguado','2.-Amortiguamiento critico','3.-Sobreamortiguado','4.-No amortiguado')
xlabel('t [segundos]')
ylabel('y(t)')