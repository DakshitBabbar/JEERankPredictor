function out = mapfeature(vec, deg)
    temp = vec;
    out = zeros(length(vec), deg);
    for i=1:deg
        out(:,i) = temp;
        temp = temp.*vec;
    end
end