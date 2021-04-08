function Y = normalize_var(A, ref)
    if nargin == 1
        sr = 1;
    else
        if nargin == 2
            sr = std(ref(:));
        else 
            error('invalid number of argument');
        end
    end
    sa = std(A(:));
    Y = A * sr / sa;
end