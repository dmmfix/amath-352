%% 7. 2-norm relation for A^T A
anorm   = 34;
atanorm = anorm * anorm;
save('A1.dat', 'atanorm', '-ascii');

%% 8. Relative error
b     = [1 4 7 3 0 -8]';
bappx = [1.001 4 7 pi -0.00003 -8.06]';
berr  = rel_err(b, bappx);
save('A2.dat', 'berr', '-ascii');

%% 9. Poor conditioning
A = [10 3 -13; 4 -5 1; 16 -16 10^-6];
x = [1 2 3]';
conda = cond(A);
save('A3.dat', 'conda', '-ascii');

b = A * x;
save('A4.dat', 'b', '-ascii');

x1 = [1 + 0.1  2 - 0.1  3 + 0.1]';
x2 = [1 + 0.1  2 + 0.1  3 - 0.1]';
x3 = [1 + 10   2 + 10   3 + 10 ]';

b1 = A * x1;
b2 = A * x2;
b3 = A * x3;

x1err = rel_err(b1, b);
x2err = rel_err(b2, b);
x3err = rel_err(b3, b);
save('A5.dat', 'x1err', '-ascii');
save('A6.dat', 'x2err', '-ascii');
save('A7.dat', 'x3err', '-ascii');
