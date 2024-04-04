img=imread("lena2.bmp");
img=imresize(img,[256 256]);
[m,n]=size(img);
% ���͸�ũ ����
rand("seed",201810892);
wm=randi([0,1],64);

% ����ġ
a=0.5;
wm=a.*wm;

% ����
for p=1:64:m
  for k=1:64:n
for i=p:p+63
  for j=k:k+63
    imgwm(i,j)=img(i,j)+wm(i-p+1,j-k+1);
  end
end
end
end

imshow(imgwm);
imwrite(imgwm,"lena2wm16.bmp");



