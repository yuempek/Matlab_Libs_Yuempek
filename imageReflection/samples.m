%% REFLECTION
% reflects the values between min and max limits. 
% sample
%% reflection of an array
arr_in = 1:100;
min_limit = 50;
max_limit = 60;
arr_reflect = reflection(arr_in, min_limit, max_limit);
figure; plot(arr_in,':'); hold on; plot(arr_reflect, '-'); hold off;

%% reflection of an wave
arr_in = sin(0:0.01:(5*pi)); % results between -1..1
min_limit = -0.8; % reflect from -0.8
max_limit = +0.8; % reflect from  0.8
arr_reflect = reflection(arr_in, min_limit, max_limit);
figure; plot(arr_in,':'); hold on; plot(arr_reflect, '-'); hold off;




%% IMREFLECT
%   Reflects image on borders. If borders are given negative, it crops
%   the image as specifed.
% samples :
%% read image and info
      I = imread('peppers.png');
      [h, w, c] = size(I);

%% 1) mirror to right
      topborder = 0; 
      bottomborder = 0;
      leftborder = 0;
      rightborder = w;
      I2 = imreflect(I, topborder, bottomborder, leftborder, rightborder);
      figure('Name', 'Input Image'); imshow(I);
      figure('Name', 'Image is mirrored to right'); imshow(I2);
      
%% 2) reflect 2 times to right. Width of the result will be 3 times the width of the input.
      rightborder = 2*w;
      I2 = imreflect(I, topborder, bottomborder, leftborder, rightborder);
      figure('Name', 'Image is mirrored to right 2 times'); imshow(I2);
      
%% 3) crop image. 
      topborder = -20; 
      bottomborder = -40;
      leftborder = -60;
      rightborder = -100;
      I2 = imreflect(I, topborder, bottomborder, leftborder, rightborder);
      figure('Name', 'Croped Image'); imshow(I2);     
      
%% 4) reflect croped image 
      topborder = -topborder; % +20
      bottomborder = -bottomborder; % +40
      leftborder = -leftborder; % +60
      rightborder = -rightborder; % +100
      I3 = imreflect(I2, topborder, bottomborder, leftborder, rightborder);
      figure('Name', 'Croped image is reflected to previous size.'); imshow(I3);
