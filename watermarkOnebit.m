img=imread("lena2.bmp");
img=imresize(img,[256 256]);
[m,n]=size(img);
% ���͸�ũ ����
rand("seed",201810892);
wm=randi([0,1],256);

% ����ġ
a=0.5;
wm=a.*wm;

% ����
imgwm=img.+wm;
imshow([img,imgwm]);
imwrite(imgwm,"lena2wm1.bmp");



