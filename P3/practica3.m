clear all;
close all;
clc;


s = tf("s");
Gs = 1/ (s*(s+1)*(s^2 + 4*s + 5));
H = 1;
k=20;

a = [1];
b = [1 1];
c = [1 4 5];

ra = roots(a);
rb = roots(b);
rc = roots(c);

Gc = feedback(Gs, H);
rlocus(Gc);
