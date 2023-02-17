%Actividad 1
clear all;
close all;
t=0:0.1:30;
T=5; %perdiodo en el escalon unitario 
y=1-exp(-t/T);
figure(1)
plot(t,y,'LineWidth',2)
%xline(10,"-","left","Estado Transitorio");
xline(17.5,"-");
grid on
xlabel('t [segundos]')
ylabel('y(t)')
title('Respuesta al escalón unitario (Sistemas de Primer Orden)')


%Actividad 2
t=0:0.1:30;
y_t= 1/T * exp( -t/T);
y2= 1/T * exp( -t/(2*T));
y3= 1/T * exp( -t/(3*T));
y4= 1/T * exp( -t/(4*T));
y5= 1/T * exp( -t/(5*T));
figure(2)
subplot(3,3,1), plot(t, y_t,"g"), xlabel("timepo"),ylabel("funcion");
subplot(3,3,2), plot(t,y2, "m"),xlabel("timepo"),ylabel("funcion") ;
subplot(3,3,3), plot(t,y3, "b"),xlabel("timepo"),ylabel("funcion");
subplot(3,3,4), plot(t,y4, "r"),xlabel("timepo"),ylabel("funcion");
subplot(3,3,5), plot(t,y5, "y"), xlabel("timepo"),ylabel("funcion");


%Activiada 3
% Escalon unitario
y_u= 1- exp(-t/T);
y_u2= 1- exp(-t/(2*T));
y_u3= 1- exp(-t/(3*T));
y_u4= 1- exp(-t/(4*T));
y_u5= 1- exp(-t/(5*T));

figure(3)
subplot(3,3,1), plot(t, y_u,"g"), xlabel("timepo"),ylabel("funcion");
subplot(3,3,2), plot(t,y_u2, "m"),xlabel("timepo"),ylabel("funcion") ;
subplot(3,3,3), plot(t,y_u3, "b"),xlabel("timepo"),ylabel("funcion");
subplot(3,3,4), plot(t,y_u4, "r"),xlabel("timepo"),ylabel("funcion");
subplot(3,3,5), plot(t,y_u5, "y"), xlabel("timepo"),ylabel("funcion");


%actvidad 4
%Rampa unitaria
y_r= t-T + T*exp(-t/T);
y_r2= t-T + T*exp(-t/(2*T));
y_r3= t-T + T*exp(-t/(3*T));
y_r4= t-T + T*exp(-t/(4*T));
y_r5= t-T + T*exp(-t/(5*T));

figure(4)
subplot(3,3,1), plot(t, y_r,"g"), xlabel("timepo"),ylabel("funcion");
subplot(3,3,2), plot(t,y_r2, "m"),xlabel("timepo"),ylabel("funcion") ;
subplot(3,3,3), plot(t,y_r3, "b"),xlabel("timepo"),ylabel("funcion");
subplot(3,3,4), plot(t,y_r4, "r"),xlabel("timepo"),ylabel("funcion");
subplot(3,3,5), plot(t,y_r5, "y"), xlabel("timepo"),ylabel("funcion");

%Actividad 5
s= tf("s");
sys= 1/(T*s+1);
lsim(sys,t,t)

