clear all; % Limpiamos todas las variables del workspace
close all; % Cerramos todas las ventanas de gráficos
clc; % Limpiamos la consola de MATLAB

%% METODO 1

syms s % Definimos la variable simbólica s para poder trabajar con funciones de transferencia

G = 1/((s+2)*(s+3)); % Definimos la función de transferencia G(s)

num = 1; % Numerador de la función de transferencia de la planta
den = [1 5 6]; % Denominador de la función de transferencia de la planta

func = 1/(s^2 + 5*s + 6); % Definimos la función de transferencia de la planta en términos simbólicos

Gs = tf(num, den); % Creamos la función de transferencia de la planta como un objeto de MATLAB

N = 1;
D = [1 4];
Hs = tf(N, D);
step(Gs);
%% Identificacion de L y T
dt = 0.001;
t = 0:dt:4; % vector del tiempo
u = ones(size(t)); % escalon unitario
y = lsim(Gs, u, t);

figure(2);
plot(t, y);
hold on

dy = diff(y)/dt;
plot(t(1:1:4000), dy);
hold on
dy2 = diff(dy)/dt;
plot(t(1:1:3999), dy2);
hold on

[m, y1] = max(dy); % m es la pendiente, y1 es la posicion del pto de inflexion
y_tan = m*(t-t(y1)+y(y1)); % ecuacion de la linea recta tangente en el punto de inflextion
plot(t, y_tan);
hold on
grid on

axis([0 4 -0.5 1.5]);


[r, c] = size(y);
x_L = (0-y(y1))/m + t(y1); % coordenada x del cruce de la recta por cero
x_recta_L = x_L*ones(size(t));
y_rexta_L = linspace(-2, 2, r);
plot(x_recta_L, y_rexta_L); % recta vertical que pasa por x_L
hold on
plot(x_L, 0);
hold on

y_estab = y(r, 1)*ones(size(t));
plot(t, y_estab);
hold on
x_T = (y(r, 1) - y(y1))/m + t(y1); % coordenada x del cruce de la recta tang con la el valor maximo
plot(x_T, y(r, 1));
legend(["Respuesta al escalon" ,"1er derv", "2da derv", "tg al pto de inflexion"], "Fontsize", 9)
axis([0 4 -0.2 0.2])

L = x_L;
T = x_T - x_L;

%% CONTROLADOR P

kp = T/L;
% kp = 0.6*kp;
Ts_p = feedback(Gs*kp, Hs);

figure(3)
step(Ts_p);
hold on

%% CONTROLADOR PI

s = tf("s");
kp = 0.9 * T/L;
Ti = L/0.3;
Td = 0;
Gc_PI = kp*(1+1/(Ti*s));
Ts_PI = feedback(Gc_PI*Gs, Hs);
step(Ts_PI)
hold on

%% CONTROLADOR PID

kp = 1.2*T/L;
Ti = 2*L;
Td = 0.5*L;
Gc_PID = kp*(1+1/(Ti*s));
Ts_PID = feedback(Gc_PID*Gs, Hs);
step(Ts_PID);

title("RESPUESTA DE CONTROLADORES P, PI & PID")
legend(["P", "PI", "PID"])
