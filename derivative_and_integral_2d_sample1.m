sigma = 75;
center = [50 50];
gsize = [99 99];
gaus = yuempek_2d_gaus(gsize, sigma, center);

% I = repmat(gaus(50,:)', 1, 99);% .* repmat((0.0:(1/98):1)', 1, 99)';
% I = I + I';

I = gaus;

figure; surf(I);

deriv = yuempek_2d_derivative(I);
% figure; imagesc(drv(2:end, 2:end)); colormap 'gray';
figure; surf(deriv); 

integ = yuempek_2d_integral(deriv);
% figure; imagesc(integ); colormap 'gray';
figure; surf(integ);
