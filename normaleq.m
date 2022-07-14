function theta = normaleq(X, y)
i = pinv((X')*X);              %'
theta = i*(X')*y;                 %'
end