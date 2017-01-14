%% Problem 6: Geometric means
v = 1:100;
v2 = v'.*v';
gmeans = zeros(30,1);
for k = 1:30
    gmeans(k) = cumulative_geometric_mean(v2, k); % wups
end
save('A1.dat', 'v2', '-ascii');
save('A2.dat', 'gmeans', '-ascii');

%% Problem 7: Approximate pi
apv = arrayfun(@approximate_pi, [5 10 20 50 100]');
save('A3.dat', 'apv', '-ascii');

% Could be clever and binsearch or do an incremental sum here, but meh.
k = 3700;
ap = approximate_pi(k);
while (abs(ap - pi) > 1e-12)
    k = k+1;
    ap = approximate_pi(k);
end
save('A4.dat', 'k', '-ascii');

