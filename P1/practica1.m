clc;
clear all;
close all;

%% actividad 1

t=0:0.1:30;
T=5;
y=1-exp(-t/T);

plot(t,y,'LineWidth',2)
grid on
xlabel('t [segundos]')
ylabel('y(t)')
title('Respuesta al escalón unitario (Sistemas de Primer Orden)')

%% actividad 2


t = (0:0.1:30);
T = 5;

% $G(s) = \frac{1}{Ts + 1}$
y = 1/T * exp(-t/T);
y2 = 1/T * exp(-t/T*2);
y3 = 1/T * exp(-t/T*3);
y4 = 1/T * exp(-t/T*4);
y5 = 1/T * exp(-t/T*5);

figure
subplot(3, 3, 1), plot(t, y), xlabel('t [segundos]'), ylabel('y(t)'), title("Respuesta a un impulso unitario");
subplot(3, 3, 2), plot(t, y2), xlabel('t [segundos]'), ylabel('y(t)'), title("Respuesta a un impulso unitario con 2T");
subplot(3, 3, 3), plot(t, y3), xlabel('t [segundos]'), ylabel('y(t)'), title("Respuesta a un impulso unitario con 3T");
subplot(3, 3, 4), plot(t, y4), xlabel('t [segundos]'), ylabel('y(t)'), title("Respuesta a un impulso unitario con 4T");
subplot(3, 3, 5), plot(t, y5), xlabel('t [segundos]'), ylabel('y(t)'), title("Respuesta a un impulso unitario con 5T");
grid on
%% actividad 3
t = (0:0.1:30);
T = 5;

% $G(s) = \frac{1}{Ts + 1}$
y=1-exp(-t/T);
y2=1-exp(-t/(T*2));
y3=1-exp(-t/(T*3));
y4=1-exp(-t/(T*4));
y5=1-exp(-t/(T*5));


figure
subplot(3, 3, 1), plot(t, y), xlabel('t [segundos]'), ylabel('y(t)'), title("Respuesta a un escalon unitario");
subplot(3, 3, 2), plot(t, y2), xlabel('t [segundos]'), ylabel('y(t)'), title("Respuesta a un escalon unitario con 2T");
subplot(3, 3, 3), plot(t, y3), xlabel('t [segundos]'), ylabel('y(t)'), title("Respuesta a un escalon unitario con 3T");
subplot(3, 3, 4), plot(t, y4), xlabel('t [segundos]'), ylabel('y(t)'), title("Respuesta a un escalon unitario con 4T");
subplot(3, 3, 5), plot(t, y5), xlabel('t [segundos]'), ylabel('y(t)'), title("Respuesta a un escalon unitario con 5T");

%% actividad 4

t = (0:0.1:30);
T = 5;

% $G(s) = \frac{1}{Ts + 1}$
y=t - T + T*exp(-t/T);
y2=t - T*2 + T*exp(-t/T*2);
y3=t - T*3 + T*2*exp(-t/T*3);
y4=t - T*4 + T*3*exp(-t/T*4);
y5=t - T*5 + T*4*exp(-t/T*5);



figure
subplot(3, 3, 1), plot(t, y), xlabel('t [segundos]'), ylabel('y(t)'), title("Respuesta a un rampa unitario");
subplot(3, 3, 2), plot(t, y2), xlabel('t [segundos]'), ylabel('y(t)'), title("Respuesta a un rampa unitario con 2T");
subplot(3, 3, 3), plot(t, y3), xlabel('t [segundos]'), ylabel('y(t)'), title("Respuesta a un rampa unitario con 3T");
subplot(3, 3, 4), plot(t, y4), xlabel('t [segundos]'), ylabel('y(t)'), title("Respuesta a un rampa unitario con 4T");
subplot(3, 3, 5), plot(t, y5), xlabel('t [segundos]'), ylabel('y(t)'), title("Respuesta a un rampa unitario con 5T");

%% actividad 5



