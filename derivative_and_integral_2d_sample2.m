clear; 

image1 = 'hdr\1.jpg';
image2 = 'hdr\2.jpg';
image3 = 'hdr\3.jpg';
image4 = 'hdr\4.jpg';
image5 = 'hdr\5.jpg';

resize = 1;

I1 = imresize(imread(image1), resize); 
I2 = imresize(imread(image2), resize);
I3 = imresize(imread(image3), resize);
I4 = imresize(imread(image4), resize);
I5 = imresize(imread(image5), resize);

DerivativeImg1 = zeros(size(I1));
DerivativeImg2 = zeros(size(I2));
DerivativeImg3 = zeros(size(I3));
DerivativeImg4 = zeros(size(I4));
DerivativeImg5 = zeros(size(I5));

for i = 1:3
    DerivativeImg1(:, :, i) = yuempek_2d_derivative(I1(:, :, i)); 
    DerivativeImg2(:, :, i) = yuempek_2d_derivative(I2(:, :, i)); 
    DerivativeImg3(:, :, i) = yuempek_2d_derivative(I3(:, :, i)); 
    DerivativeImg4(:, :, i) = yuempek_2d_derivative(I4(:, :, i)); 
    DerivativeImg5(:, :, i) = yuempek_2d_derivative(I5(:, :, i)); 
end

DerivativeImg1 = DerivativeImg1 ./ mean(DerivativeImg1(1,1,:));
DerivativeImg2 = DerivativeImg2 ./ mean(DerivativeImg2(1,1,:));
DerivativeImg3 = DerivativeImg3 ./ mean(DerivativeImg3(1,1,:));
DerivativeImg4 = DerivativeImg4 ./ mean(DerivativeImg4(1,1,:));
DerivativeImg5 = DerivativeImg5 ./ mean(DerivativeImg5(1,1,:));

        
DerivativeImg = DerivativeImg1 + DerivativeImg2 + DerivativeImg3 + DerivativeImg4 + DerivativeImg5;
DerivativeImg = DerivativeImg ./ 5;


I = zeros(size(DerivativeImg));

for i = 1:3
    I(:, :, i) = yuempek_2d_integral(DerivativeImg(:, :, i)); 
end

I = I - min(I(:));
I = I .^ 1;
I = uint16(I ./ max(I(:)) * 65535);
figure; imshow(I);
figure; histogram(I);
