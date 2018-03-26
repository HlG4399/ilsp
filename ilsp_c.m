function ilsp_c
clc;clear
[A, b, beps, fe] = coke_upc;
[U,S,V] = svd(A);
n=500;
t=([1:n]-1/2)/n;
for k=150:50:500
    figure
    subplot(2,1,1)
    fk=0;
    for i=1:k
        fk=fk+1/S(i,i)*V(:,i)*U(:,i)'*b;
    end
    plot(t,fk,'r-','linewidth',1)
    title(['k=',num2str(k),',fk(b)']);
    fk=0;
    subplot(2,1,2)
    for i=1:k
        fk=fk+1/S(i,i)*V(:,i)*U(:,i)'*beps;
    end
    plot(t,fk,'r-','linewidth',1)
    title(['k=',num2str(k),',fk(beps)']);
    saveas(gcf,['k=',num2str(k),'.jpg'])
    close
end
%axes('position',[.075 .1 .85 .2]);
figure
plot(t,fe,'k-','linewidth',1);
