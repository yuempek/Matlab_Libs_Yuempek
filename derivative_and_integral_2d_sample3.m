clear;

image1 = 'hdr\1.jpg';
image2 = 'hdr\2.jpg';
image3 = 'hdr\3.jpg';
image4 = 'hdr\4.jpg';
image5 = 'hdr\5.jpg';

resize = 1;

I1 = ((imresize(imread(image1), resize))); 
I2 = ((imresize(imread(image2), resize)));
I3 = ((imresize(imread(image3), resize)));
I4 = ((imresize(imread(image4), resize)));
I5 = ((imresize(imread(image5), resize)));


DerivativeImg1 = zeros(size(I1) + [1 0 0]);
DerivativeImg2 = zeros(size(I2) + [1 0 0]);
DerivativeImg3 = zeros(size(I3) + [1 0 0]);
DerivativeImg4 = zeros(size(I4) + [1 0 0]);
DerivativeImg5 = zeros(size(I5) + [1 0 0]);

v = [1 -1]';
for i = 1:3
    DerivativeImg1(:, :, i) = conv2(I1(:, :, i), v); 
    DerivativeImg2(:, :, i) = conv2(I2(:, :, i), v); 
    DerivativeImg3(:, :, i) = conv2(I3(:, :, i), v); 
    DerivativeImg4(:, :, i) = conv2(I4(:, :, i), v); 
    DerivativeImg5(:, :, i) = conv2(I5(:, :, i), v); 
end

DerivativeImg1 = DerivativeImg1(1:end-1, :, :);
DerivativeImg2 = DerivativeImg2(1:end-1, :, :);
DerivativeImg3 = DerivativeImg3(1:end-1, :, :);
DerivativeImg4 = DerivativeImg4(1:end-1, :, :);
DerivativeImg5 = DerivativeImg5(1:end-1, :, :);

DerivativeImg = DerivativeImg1 + DerivativeImg2 + DerivativeImg3 + DerivativeImg4 + DerivativeImg5;
DerivativeImg = DerivativeImg ./ 5;

I = cumsum(real(DerivativeImg), 1); 
I = I - min(I(:));
I = I .^ 1;
I = uint16(I ./ max(I(:)) * 65535);
figure; imshow(I);
figure; histogram(I);
