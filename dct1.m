img=imread("lena2.bmp");
[m,n]=size(img);

buf1=zeros(8,8); % ������ 8x8������ �ӽ� �����ϱ� ���� matrix ����
buf2=zeros(8,8);
dct1=zeros(8,8); % DCT-Quantization�� ���� �迭
d1=zeros(8,8);
dct3=zeros(8,8); % ��DCT-Quantization�� ���� �迭
d2=zeros(8,8);
dct_a=zeros(512,512); % 8x8�� 512x512�� ������ ���� �迭
dct_b=zeros(512,512);

k=0.01; % k���� ���� ���� ������ �޶���

qtable=[10 10 15 20 25 30 35 40; % ����ȭ table�� �����ڷῡ ��õǾ� �ִ� ��ġ ���
        10 15 20 25 30 35 40 50;
        15 20 25 30 35 40 50 60;
        20 25 30 35 40 50 60 70;
        25 30 35 40 50 60 70 80; 
        30 35 40 50 60 70 80 90;
        35 40 50 60 70 80 90 100;
        40 50 60 70 80 90 100 100]*k; 
        
% DCT-Quantization ����
for i=1:8:m 
  for j=1:8:n
 
for k=i:i+7
 for p=j:j+7
  buf1(k-(i-1),p-(j-1))=img(k,p); % ���������� 8x8������ ���ۿ� ����
end
end

d1=dct2(buf1); % DCT ����
dct1=round(d1./qtable); % ������ ȭ�Ұ��� ����ȭ table������ ���� �ݿø��ϸ� Quantization �Ϸ�

for k=i:i+7
 for p=j:j+7
  dct_a(k,p)=dct1(k-(i-1),p-(j-1)); % 8x8 ������ DCT-Quantization�� �Ϸ�� ������ ��� ���������� ũ���� 512x512�� ����� ����
end
end

end
end

% ��DCT-Quantization ����
for i=1:8:m
  for j=1:8:n
 
for k=i:i+7
 for p=j:j+7
  buf2(k-(i-1),p-(j-1))=dct_a(k,p); % ���������� 8x8������ ���ۿ� ����
end
end

dct3=round(buf2.*qtable); % DCT-Quantization �Ϸ�� 8x8������ ȭ�Ұ��� ����ȭ table������ ���� �ݿø��ϸ� ��Quantization �Ϸ�
d2=idct2(dct3); % ��DCT ����

for k=i:i+7
 for p=j:j+7
  dct_b(k,p)=d2(k-(i-1),p-(j-1)); % 8x8 ������ ��DCT-Quantization�� �Ϸ�� ������ ��� ���������� ũ���� 512x512�� ����� ����
end
end

end
end

dct_b=uint8(dct_b);
figure(1);
imshow(img);
figure(2);
imshow(dct_b);
% dct2,idct2 �Լ� ����� ���� ���� �� pkg load signal,communications��� ��ɾ �Է��ؾ� ��
