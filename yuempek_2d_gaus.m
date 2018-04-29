function [gaus] = yuempek_2d_gaus(size, sigma, center)
    [x,y] = ndgrid(1:size(1), 1:size(2));
    xc = center(1);
    yc = center(2);
    exponent = ((x-xc).^2 + (y-yc).^2)./(2*sigma);
    gaus = (exp(-exponent));   
end