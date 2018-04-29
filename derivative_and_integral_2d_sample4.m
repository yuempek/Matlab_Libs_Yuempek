clear;

image1 = 'hdr\1.jpg';
image2 = 'hdr\2.jpg';
image3 = 'hdr\3.jpg';
image4 = 'hdr\4.jpg';
image5 = 'hdr\5.jpg';

resize = 1;

I1 = double((imresize(imread(image1), resize))); 
I2 = double((imresize(imread(image2), resize)));
I3 = double((imresize(imread(image3), resize)));
I4 = double((imresize(imread(image4), resize)));
I5 = double((imresize(imread(image5), resize)));


DerivativeImg1 = zeros(size(I1) + [1 1 0]);
DerivativeImg2 = zeros(size(I2) + [1 1 0]);
DerivativeImg3 = zeros(size(I3) + [1 1 0]);
DerivativeImg4 = zeros(size(I4) + [1 1 0]);
DerivativeImg5 = zeros(size(I5) + [1 1 0]);

dx = [1 -1];
dy = dx';

for i = 1:3
    DerivativeImg1(:, :, i) = conv2(conv2(I1(:, :, i), dx), dy); 
    DerivativeImg2(:, :, i) = conv2(conv2(I2(:, :, i), dx), dy); 
    DerivativeImg3(:, :, i) = conv2(conv2(I3(:, :, i), dx), dy); 
    DerivativeImg4(:, :, i) = conv2(conv2(I4(:, :, i), dx), dy); 
    DerivativeImg5(:, :, i) = conv2(conv2(I5(:, :, i), dx), dy); 
end

DerivativeImg1 = DerivativeImg1(1:end-1, 1:end-1, :);
DerivativeImg2 = DerivativeImg2(1:end-1, 1:end-1, :);
DerivativeImg3 = DerivativeImg3(1:end-1, 1:end-1, :);
DerivativeImg4 = DerivativeImg4(1:end-1, 1:end-1, :);
DerivativeImg5 = DerivativeImg5(1:end-1, 1:end-1, :);

DerivativeImg1 = DerivativeImg1 ./ mean(DerivativeImg1(1,1,:));
DerivativeImg2 = DerivativeImg2 ./ mean(DerivativeImg2(1,1,:));
DerivativeImg3 = DerivativeImg3 ./ mean(DerivativeImg3(1,1,:));
DerivativeImg4 = DerivativeImg4 ./ mean(DerivativeImg4(1,1,:));
DerivativeImg5 = DerivativeImg5 ./ mean(DerivativeImg5(1,1,:));

DerivativeImg = 1*DerivativeImg1 + ...
                1*DerivativeImg2 + ...
                1*DerivativeImg3 + ...
                1*DerivativeImg4 + ...
                1*DerivativeImg5;

sharp = [ 0.7  -1.0  -0.7
         -1.0   2.0   1.0
          0.7   1.0  -0.7];

sharp = sharp ./ max(sharp(:));

I = cumsum(cumsum(DerivativeImg, 1), 2); 

I = I - min(I(:));
I = I .^ 0.6;
I = uint16(I ./ max(I(:)) * (2^16));

I(:,:,1) = conv2(I(:,:,1), sharp, 'same');
I(:,:,2) = conv2(I(:,:,2), sharp, 'same');
I(:,:,3) = conv2(I(:,:,3), sharp, 'same');

figure; imshow(I);
figure; histogram(I);
