i=imread("lena2.bmp"); % ���� �б�
i=double(i);
f=zeros(3,3); % 3x3 ��� ���� ����
for j=1:3
  for k=1:3
    filter(j,k)=(1/9); % (1+1+1+1+1+1+1+1+1)/9 ��� ����
    end
  end
  blured=uint8(conv2(i,filter)); % ����� ������͸� �������
  
  imshow(blured);
