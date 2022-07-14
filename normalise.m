function [nx mu sgm] = normalise(X)
mu = mean(X);
sgm = std(X);
nx = (X-mu)./(sgm);
end