function [derivative] = yuempek_2d_derivative(I)
    I = double(I);
    
    [row, col] = size(I);
    
    derivative = zeros([row col]);

    for r = 1:row
        for c = 1:col
            s = 0;

            if c > 1
                s = s + I(r, c-1);
            end

            if r > 1
                s = s + I(r-1, c);
            end

            if (c > 1) && (r > 1)
                s = s - I(r-1, c-1);
            end

            derivative(r, c) = I(r, c) - s;
        end
    end

end

