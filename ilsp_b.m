function ilsp_b
clc;clear
[A, b, beps, fe] = coke_upc;
feps=A\beps;
n=500;
t=([1:n]-1/2)/n;
figure, axes('position',[.075 .1 .85 .2]);
plot(t,fe,'k-','linewidth',1); 
hold on
plot(t,feps,'r-','linewidth',1)