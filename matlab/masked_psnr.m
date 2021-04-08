function p = masked_psnr(A, ref, mask)
    if (nargin == 2)
        mask = (ref ~= 0);
    else
        if (nargin ~= 3)
            error('invalid argument number');
        end
    end
    p = psnr(A .* mask, ref);
end