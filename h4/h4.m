%% 8. Define matries
A = repmat([1 2 3 4 5 6 7 8 9 10], 100, 1);
B = [1 8 -1 0; 4 2 3 3; 5 -3 0 pi; 4 1 -6 2];
C = power(99, 2) * (diag(repmat(-2,1,100)) + diag(ones(99,1),-1) + diag(ones(99,1),1));
x = linspace(1, 2, 100);
save('A1.dat', 'A', '-ascii');
save('A2.dat', 'B', '-ascii');
save('A3.dat', 'C', '-ascii');

bcomp = 6 * (B^4) + sin(B)/2 - 2*B;
save('A4.dat', 'bcomp', '-ascii');

fnx = arrayfun(@(x) power(x,3) + 2/power(x,2) - 4 * cos(x), x);
save('A5.dat', 'fnx', '-ascii');



%% 9. Powers of matrices
Base = [17 24 1 8 15; 23 5 7 14 16; 4 6 13 20 22; 10 12 19 21 3; 11 18 25 2 9];
M65  = (1 / 65.0) * Base;
M10  = (1 / 10.0) * Base;
M100 = (1 / 100.0) * Base;
save('A6.dat', 'M65', '-ascii');

a7 = 0.2;
a8 = 4;
a9 = 0;
save('A7.dat', 'a7', '-ascii');
save('A8.dat', 'a8', '-ascii');
save('A9.dat', 'a9', '-ascii');
