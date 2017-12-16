y = @(b,x) b(1).*exp(-b(2).*x);             % Objective function
p = [3; 5]*1E-1;                            % Create data
x  = linspace(1, 10);
yx = y(p,x) + 0.1*(rand(size(x))-0.5);
OLS = @(b) sum((y(b,x) - yx).^2);          % Ordinary Least Squares cost function
opts = optimset('MaxFunEvals',50000, 'MaxIter',10000);
B = fminsearch(OLS, rand(2,1), opts)       % Use ‘fminsearch’ to minimise the ‘OLS’ function