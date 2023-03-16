clear all; % Limpiamos todas las variables del workspace
close all; % Cerramos todas las ventanas de gráficos
clc; % Limpiamos la consola de MATLAB

%% METODO 2

clear all;
close all;
clc;

s = tf("s");

Gs = 1/((s+2)*(s+3));
Hs = 1 / (s+4);

ts = 0.001;
nit = 12/ts;
t = 0:ts:(nit-1)*ts;
R = ones(1, length(t));
set(figure, 'Color', [1 1 1]);

for k=210:1:210
    
    % Lazo cerrado
    Gc = feedback(k*Gs, Hs);
    y = lsim(Gc, R, t);
    plot(t, y, "Linewidth", 3);
    
end

hold on
dy = diff(y)/ts;
plot(t(1:1:11999), dy, "Linewidth", 3);
umbral = 0.0013;
[r c] = find(abs(dy)<umbral);
[r2 c2] = size(r);
% P_cr = 2*(t(r(r2)) - t(r(r2-1)));

% K_cr = 210;
P_cr = 1.2322;

%% CONTROLADOR P

K_cr = 210;
kp = 0.5*K_cr;
kp = 0.6*kp;
Ts_p = feedback(Gs*kp, Hs);
figure(3)
step(Ts_p);
hold on

%% CONTROLADOR PI

s = tf("s");

K_cr = 210;
kp = 0.45 * K_cr;
kp = 0.6*kp;
Ti = (1/1.2)*P_cr;
Td = 0;
Gc_PI = kp * (1+1/(Ti*s));
Ts_PI = feedback(Gc_PI * Gs, Hs);
step(Ts_PI);
hold on


%% CONTROLADOR PID

K_cr = 210;
kp = 0.6 * K_cr;
kp = 0.6*kp;
Ti = 0.5 * P_cr;
Td = 0.125*P_cr;
Gc_PID = kp * (1 + 1/(Ti*s)+Td*s);
Ts_PID = feedback(Gc_PID*Gs, Hs);
step(Ts_PID);
title("RESPUESTA DE CONTROLADORES P, PI & PID");
xlabel("Tiempo")
ylabel("Amplitud de la respuesta en el tiempo")
legend(["P", "PI", "PID"])
