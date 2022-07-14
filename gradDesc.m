function [theta jHist] = gradDesc(X, y, theta, alpha, numIter)
m = length(y); % number of training examples
jHist = zeros(numIter, 1);

lambda = 0.0;

for i=1:numIter,
    y1 = X*theta;

    d = y1 - y;

    p = (X')*(d); %')

    %u = ((alpha*p))/m ;
    u = ((alpha*p) + lambda*(theta))/m ;

    theta = theta - u;

    jHist(i) = costfunc(X, y, theta);

end

end