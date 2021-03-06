 function [A, b, beps, fe] = coke_upc 

% can of coke
 code = [0 1 1 1  ...
         3 2 1 1 ...
         1 1 3 2 ...
         3 1 1 2 ...
         3 2 1 1 ...
         3 2 1 1 ...
         3 2 1 1 ...
         1 1 1 1 1 ...
         3 2 1 1 ...
         2 1 2 2 ...
         1 3 1 2 ...
         1 1 1 4 ...
         1 3 1 2 ...
         3 1 1 2 ...
         1 1 1];

 bars = length(code);
 %��code��׼��
 code = cumsum(code')/sum(code);

 t = linspace(-.1,1.1,700);
 f = @(t) (mod(sum(kron(ones(bars,1),reshape(t,1,length(t)))<kron(code,ones(1,length(t)))),2));

% Construct Toeplitz matrix
 n = 500;
 z = 0.01;
 j = [-n+1:n-1];
 h = exp(-j.^2/(z^2*n^2))/n;
 A = toeplitz(h(n:-1:1),h(n:2*n-1));

 tt = ([1:n]-.5)/n;                   % grid points for midpoint rule
 fe = f(tt)';
 b = A*fe;
 beps = b.*(1+.05*randn(n,1));
