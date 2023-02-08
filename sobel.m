i=imread("lena2.bmp"); % ���� ����

mask1=[-1,0,1;-2,0,2;-1,0,1]; % sobel �������� ����ũ x��
mask2=[-1,-2,-1;0,0,0;1,2,1]; % sobel �������� ����ũ y��

x=conv2(i,mask1); % ���� ������ ���� �̺п���
y=conv2(i,mask2);

amp=abs(x)+abs(y); % ���� ���� ���

[m,n]=size(amp);

for j=1:m % �������� �Ӱ谪 80���� ��輱 ����
  for k=1:n
    if amp(j,k)>=80
      amp(j,k)=255;
    else
      amp(j,k)=0;
    end
  end
end

amp=uint8(amp);
imshow(amp);
