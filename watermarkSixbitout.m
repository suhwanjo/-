img=imread("lena2wm16.bmp");
[m,n]=size(img);
rand("seed",201810892);
wm=randi([0,1],64);

% ����
for p=1:64:m
  for k=1:64:n
for i=p:p+63
  for j=k:k+63
    innerp(i,j)=img(i,j)*wm(i-p+1,j-k+1);
    if innerp(i,j)>0
      wm_out(i,j)=1;
    else
      wm_out(i,j)=0;
  end
end
end
end
end

buf=zeros(64,64);
for p=1:64:m
  for k=1:64:n
for i=p:p+63
  for j=k:k+63
    buf(i-p+1,j-k+1)=wm_out(i,j);
  end
end
corr2(buf,wm) % ������� 1�� ���� ����
end
end 

% LPF ����
lpf=fspecial("gaussian",[3,3],0.5);
a=conv2(lpf,img);
for i=1:m
  for j=1:n
    a_lpf_img(i,j)=a(i+2,j+2);
  end
end
% LPF ���� �� ����
wm_out_lpf=img.-a_lpf_img; % ���͸�ũ�� ���Ե� ����� LPF�� ��ģ ������ ���̸� ������ ���͸�ũ��� ���� ���
for p=1:64:m
  for k=1:64:n
for i=p:p+63
  for j=k:k+63
    buf(i-p+1,j-k+1)=wm_out_lpf(i,j);
  end
end
corr2(buf,wm) % ������� �ſ� ����(���͸�ũ�� �ջ��)
end
end 

% JPEG ����
imwrite(img,"lena2_jpeg16.jpg");
jpeg_img=imread("lena2_jpeg16.jpg");
% JPEG ���� �� ����
b=conv2(lpf,jpeg_img);
for i=1:m
  for j=1:n
    b_jpeg_img(i,j)=b(i+2,j+2);
  end
end
wm_out_jpeg=img.-b_jpeg_img; % ���͸�ũ�� ���Ե� ����� LPF�� ��ģ ������ ���̸� ������ ���͸�ũ��� ���� ���
 for p=1:64:m
  for k=1:64:n
for i=p:p+63
  for j=k:k+63
    buf(i-p+1,j-k+1)=wm_out_jpeg(i,j);
  end
end
corr2(buf,wm) % ������� �ſ� ����(���͸�ũ�� �ջ��)
end
end 

figure(1);
imshow([img,a_lpf_img,b_jpeg_img]);
