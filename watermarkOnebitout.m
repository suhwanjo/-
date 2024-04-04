img=imread("lena2wm1.bmp");
[m,n]=size(img);
rand("seed",201810892);
wm=randi([0,1],256);

% ����
for i=1:m
  for j=1:n
    innerp(i,j)=img(i,j)*wm(i,j); % ����Ű�� ������ ���͸�ũ�� �װ��� ���Ե� �������� ������ ���� ���� ����
    if innerp(i,j)>0
      wm_out(i,j)=1;
    else
      wm_out(i,j)=0;
    end
  end
end
corr2(wm,wm_out) % ������� 1�� ���� ����

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
corr2(wm_out_lpf,wm) % ������� �ſ� ����(���͸�ũ�� �ջ��)

% JPEG ����
imwrite(img,"lena2_jpeg.jpg");
jpeg_img=imread("lena2_jpeg.jpg");
% JPEG ���� �� ����
b=conv2(lpf,jpeg_img);
for i=1:m
  for j=1:n
    b_jpeg_img(i,j)=b(i+2,j+2);
  end
end
wm_out_jpeg=img.-b_jpeg_img; % ���͸�ũ�� ���Ե� ����� LPF�� ��ģ ������ ���̸� ������ ���͸�ũ��� ���� ���
corr2(wm_out_jpeg,wm) % ������� �ſ� ����(���͸�ũ�� �ջ��)

figure(1);
imshow([img,a_lpf_img,b_jpeg_img]);
