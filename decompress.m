function out = decompress(in, V)
    A = 87.6;
    lnAp1 = log(A) + 1;
    VdA   = V / A;
    VdlnAp1 = V / lnAp1;
    indx = find(abs(in) <= VdlnAp1);
    if ~isempty(indx)
        out(indx) = lnAp1 / A * abs(in(indx)) .* sign(in(indx));
    end
    indx = find(abs(in) >  VdlnAp1);
    if ~isempty(indx)
        out(indx) = VdA * exp(abs(in(indx)) / VdlnAp1 - 1) .* sign(in(indx));
    end
end

