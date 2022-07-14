function j = costfunc(X, y, theta)

lambda = 0.0;

m = length(y);

y1 = X*theta;

d = (y1 - y).^2;

s = sum(d);

%j = s/(2*m);
j = s/(2*m) + (lambda/(2*m))*(sum(theta.^2));

end