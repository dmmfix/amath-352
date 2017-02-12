%% 10. A\b
A1 = [1 1;1 -1];
b1 = [1;2];
Axb1 = A1\b1;
save('A1.dat', 'Axb1', '-ascii');

A2 = [1 2 1;1 1 0;1 2 0];
b2 = [4;2;3];
Axb2 = A2\b2;
save('A2.dat', 'Axb2', '-ascii');

%% 11. Approx ODE
linx = linspace(0,1,100);
save('A3.dat', 'linx', '-ascii');

alpha = 0;
beta = 1;
f1 = [alpha 50 * sin(5 * linx(2:99)) beta]';
save('A4.dat', 'f1', '-ascii');

A = power(99, 2) * (diag(repmat(-2,1,100)) + diag(ones(99,1),-1) + diag(ones(99,1),1));
A(1,1)     = 1; A(1,2)    = 0;
A(100,100) = 1; A(100,99) = 0;
save('A5.dat', 'A', '-ascii');

U1 = A \ f1;
save('A6.dat', 'U1', '-ascii');

alpha = 1/2;
beta = 0;
f2 = [alpha 3 * linx(2:99) beta]';
U2 = A \ f2;
save('A7.dat', 'U2', '-ascii');

alpha = 1;
beta = 2;
fx = @(x) -10 / (1 + power(x,2));
f3 = [alpha arrayfun(fx, linx(2:99)) beta]';
U3 = A \ f3;
save('A8.dat', 'U3', '-ascii');
