function ilsp_a
clc;clear
[A, b, beps, fe] = coke_upc;
fi=A\b;
n=500;
t=([1:n]-1/2)/n;
figure, axes('position',[.075 .1 .85 .2]);
plot(t,fe,'k-','linewidth',1); 
hold on
plot(t,fi,'r-','linewidth',1)