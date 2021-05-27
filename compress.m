function out = compress(in, V)
    A = 87.6;
    lnAp1 = log(A) + 1;
    VdA   = V / A;
    indx = find(abs(in) <= VdA);
    if ~isempty(indx)
        out(indx) = A / lnAp1 * abs(in(indx)) .* sign(in(indx));
    end
    indx = find(abs(in) >  VdA);
    if ~isempty(indx)
        out(indx) = V / lnAp1 * (1 + log(abs(in(indx)) / VdA)) .* sign(in(indx));
    end
end