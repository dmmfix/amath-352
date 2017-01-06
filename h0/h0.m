mkdir('submit')

%% Problem 1.
%  Create the following (row) vector:
%    [ 0, 2, 4, . . . , 30 ].
%  Answer: Should be written out as A1.dat
evens = 0:2:30;
save('submit/A1.dat', 'evens', '-ascii');

%% Problem 2.
% Create the following (column) vector:
%    5 e^3 sin(2)]'
%
% Answer: Should be written out as A2.dat
rando = [ 5 exp(3) sin(2) ]';
save('submit/A2.dat', 'rando', '-ascii');

%% Problem 3.
% Use the zeros command to create a 10 × 1 (column) vector of all
% zeros. (Note: to create an n × m matrix of all zeros, you can use
% the command zeros(n,m))
%
% Answer: Should be written out as A3.dat
tenZeros = zeros(10,1);
save('submit/A3.dat', 'tenZeros', '-ascii');
