%% Problem 5.
x = [exp(1) power(5, 1/3) -6 * pi 42]';
y = [4 2 -5 20];
norms = [norm(x,1) norm(x,2) norm(x,64) norm(x,Inf)]';
angle = acos(dot(x, y) / (norm(x) * norm(y)));
save('A1.dat', 'norms', '-ascii');
save('A2.dat', 'angle', '-ascii');


%% Problem 6.
flipSum = 0;
for k = 1:2:1003
    flipSum = flipSum + power(-1, floor(k / 2)) / k;
end
save('A3.dat', 'flipSum', '-ascii');

fhTerms = zeros(500,1)
for k = 0:499
    k0 = power(k*2 + 1,2);
    k1 = power(k*2 + 3,2);
    fhTerms(k+1) = 1/(k0 * k1); %lolwut
end
sqSum = sum(fhTerms);
save('A4.dat', 'sqSum', '-ascii');


%% Problem 7.
f = @(n) n * sum(arrayfun(@(i) (i + 1) / (i - 1), 3:n));
res20  = f(20);
res100 = f(100);
save('A5.dat', 'res20', '-ascii');
save('A6.dat', 'res100', '-ascii');


%% Problem 8.
fib3 = zeros(100,1);
fib3(3) = 1;
for k = 4:100
    fib3(k) = sum(fib3(k-3:k-1));
end
save('A7.dat', 'fib3', '-ascii');

fib3Ratio = fib3(100) / fib3(99);
save('A8.dat', 'fib3Ratio', '-ascii');
