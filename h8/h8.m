%% 6. Population in 2020
Pop = [ 00	 75.995
        10	 91.972;
        20	 105.711;
        30	 123.203;
        40	 131.669;
        50	 150.697;
        60	 179.323;
        70	 203.212;
        80	 226.505;
        90	 249.633;
        100	 281.422;
        110	 308.745;];
A = [ones(size(Pop,1),1) Pop(:,1) Pop(:,1).* Pop(:,1)];

[q,r] = qr(A(:,1:2),0);
lincoeff = r \ (q.' * Pop(:,2));
linfun = @(x) lincoeff(1) + lincoeff(2)*x;
linpop = linfun(120);
save('A1.dat', 'linpop', '-ascii');

[q,r] = qr(A(:,1:3),0);
quadcoeff = r \ (q.' * Pop(:,2));
quadfun = @(x) quadcoeff(1) + quadcoeff(2)*x + quadcoeff(3)*x*x;
quadpop = quadfun(120);
save('A2.dat', 'quadpop', '-ascii');

LogPop = [Pop(:,1) log(Pop(:,2))];
[q,r] = qr(A(:,1:2),0);
logcoeff = r \ (q.' * LogPop(:,2));
logfun = @(x) exp(logcoeff(1) + logcoeff(2)*x);
logpop = logfun(120);
save('A3.dat', 'logpop', '-ascii');

% Check answers
%t = 0:1:120;
%plot(Pop(:,1),Pop(:,2),'go'); hold on;
%plot(t,arrayfun(linfun, t),'b');
%plot(t,arrayfun(quadfun,t),'c');
%plot(t,arrayfun(logfun,t),'r');

%% 7. LSQ
x = linspace(0,5,35)';
A = fliplr(vander(x));
A = A(:,1:24);
y = sin(5*x);
[q,r] = qr(A,0);
coeff = r \ (q.' * y);
resid = A * coeff - y;
nqr = norm(resid,2);
save('A4.dat', 'nqr', '-ascii');

ncoeff = (A' * A) \ (A' * y);
nresid = A * ncoeff - y;
nne = norm(nresid,2);
save('A5.dat', 'nne', '-ascii');


%% 8. Ridge Regression
polydeg = 14;
t = linspace(0,4,50)';
rng(4,'twister');
y = t.^3 - 6 * t.^2 + 11 * t - 4 + randn(50,1);

A = fliplr(vander(t));
A = A(:,1:polydeg+1);
[q,r] = qr(A,0);
c = r \ (q.' * y);
save('A6.dat', 'c', '-ascii');

c_0_1 = (A'*A + 0.1*eye(polydeg+1)) \ (A' * y);
c_1_0 = (A'*A + 1*eye(polydeg+1)) \ (A' * y);
c_10_0 = (A'*A + 10*eye(polydeg+1)) \ (A' * y);
save('A7.dat', 'c_0_1', '-ascii');
save('A8.dat', 'c_1_0', '-ascii');
save('A9.dat', 'c_10_0', '-ascii');

% figure()
% hold on          % Make it so that both plots appear on same figure
% plot(t,y,'ro')   % Plot the original data points as red circles
% t_fine = linspace(0,4,1000);
% plot(t_fine,polyval(flipud(c),t_fine),'b')
% plot(t_fine,polyval(flipud(c_0_1),t_fine),'r')
% plot(t_fine,polyval(flipud(c_1_0),t_fine),'g')
% plot(t_fine,polyval(flipud(c_10_0),t_fine),'c')
