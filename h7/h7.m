%% 6. Bridge
s = sqrt(2)/2;
A = [ -s  1  0  0  0  0  0  0  0  s  0  0  0;
      -s  0  0  0  0  0  0  0  -1  -s  0  0  0;
       0  -1  1  0  0  0  0  0  0  0  0  0  0;
       0  0  0  0  0  0  0  0  0  0  -1  0  0;
       0  0  -1  s  0  0  0  0  0  0  0  -s  0;
       0  0  0  -s  0  0  0  0  0  0  0  -s  -1;
       0  0  0  -s  -1  0  0  0  0  0  0  0  0;
       0  0  0  0  1  -1  0  0  0  0  0  0  0;
       0  0  0  0  0  0  0  0  0  0  0  0  1;
       0  0  0  0  0  1  -1  0  0  -s  0  s  0;
       0  0  0  0  0  0  0  0  0  s  1  s  0;
       0  0  0  0  0  0  1  -1  0  0  0  0  0;
       0  0  0  0  0  0  0  0  1  0  0  0  0 ];
b = [0 0 0 0 0 0 0 0 5 0 5 0 5]';
[L, U] = lu(A);
y = L\b;
x = U\y;
save('A1.dat', 'y', '-ascii');
save('A2.dat', 'x', '-ascii');

xbs = A\b;
save('A3.dat', 'xbs', '-ascii');

lower = b(11);
upper = 30;

bprobe = b;
while abs(upper - lower) > 0.00001
    probe = (lower + upper) / 2;
    bprobe(11) = probe;
    
    f = A\bprobe;
    if (norm(f,inf) >= 30)
        upper = probe;
    else
        lower = probe;
    end
end

% Clamp to 0.01
breakmass = ceil(bprobe(11) * 100) / 100;
save('A4.dat', 'breakmass', '-ascii');

%% 7. Gaussian Elim
rng(10,'twister');
ARand = rand(50,50);
[l,u,op] = ge_nmm(ARand);
save('A5.dat', 'l', '-ascii');
save('A6.dat', 'u', '-ascii');
save('A7.dat', 'op', '-ascii');
