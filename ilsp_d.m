function ilsp_d
clc;clear
[A, b, beps, fe] = coke_upc;
n=500;
x=zeros(length(logspace(-8,0,100)),1);
y=x;
i=1;
b_hat=[b;zeros(n,1)];
for lambda=logspace(-8,0,100)
    A_lambda=[A;lambda*eye(n)];
    f_lambda=pinv(A_lambda)*b_hat;
    x(i)=norm(beps-A*f_lambda);
    y(i)=norm(f_lambda);
    if(norm(x(i)-0.1019)<0.01)
        f_lambda
        return
    end
    i=i+1;
end
loglog(x,y,'blacko-','MarkerFaceColor',[1,0,0])
grid on;

% %%
% x=zeros(length(logspace(-8,0,100)),1);
% y=x;
% i=1;
% b_hat=[beps;zeros(n,1)];
% for lambda=logspace(-8,0,100)
%     A_lambda=[A;lambda*eye(n)];
%     f_lambda=pinv(A_lambda)*b_hat;
%     x(i)=norm(beps-A*f_lambda);
%     y(i)=norm(f_lambda);
%     i=i+1;
% end
% loglog(x,y,'blacko-','MarkerFaceColor',[1,0,0])
% grid on;
