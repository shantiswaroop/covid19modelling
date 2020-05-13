function y0 = guan_hist(t)

global N

% y0 = [S,E,I,R]

y0 = zeros(4,1);
y0(1,1) = N - 5;
y0(2,1) = 0;
y0(3,1) = 5;
y0(4,1) = 0;

end