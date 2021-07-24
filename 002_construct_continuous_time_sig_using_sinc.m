close all
clear all
clc
Fsc = 100;
dt = 1/Fsc;
tf = 1.1;
t = 0:dt:tf;
ff = 1;
f = sin(2*pi*ff*t);

N = 2;
Ts = N*dt;
tn = 0:Ts:tf;
fn = sin(2*pi*ff*tn);

x = f*0;
for i=1:length(fn)
    n = i-1;
    arg = pi*(t-n*Ts)/Ts;
    x = x + fn(i)*sin(arg)./arg;
end


figure(1)
plot(t, f, 'b')
hold on
plot(tn, fn, '*')
plot(t, x, 'r')
xlabel('time')
ylabel('f')
legend('continuous signal', 'discrete signal', 'sinc-reconstructed signal')

figure(2)
plot(t, f, 'b*')
hold on
plot(t, x, 'ro')
xlabel('time')
ylabel('f')
legend('continuous signal', 'sinc-reconstructed signal')

figure(3)
plot(t, f-x, 'b*')
xlabel('time')
ylabel('f')
legend('error')
