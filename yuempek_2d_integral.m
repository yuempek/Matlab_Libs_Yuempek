function [ integral ] = yuempek_2d_integral( I )
    I = double(I);

    [row, col] = size(I);
    
    integral = zeros([row col]);

    for r = 1:row
        for c = 1:col
            s = 0;

            if c > 1
                s = s + integral(r, c-1);
            end

            if r > 1
                s = s + integral(r-1, c);
            end

            if (c > 1) && (r > 1)
                s = s - integral(r-1, c-1);
            end

            integral(r, c) = I(r, c) + s;
        end
    end

end

