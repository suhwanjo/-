i=imread("lena2.bmp"); % ���� ����

gf=fspecial("gaussian",3,0.5);  % 3x3 �������� ǥ�������� 0.5�� ����þ� ����ũ ����

maskx=[-1,0,1;-2,0,2;-1,0,1]; % �̺п����� ���� sobel ����ũ x��
masky=[-1,-2,-1;0,0,0;1,2,1]; % �̺п����� ���� sobel ����ũ y��

gx=conv2(gf,maskx); % ����þ� ����ũ�� �̺� ����
gy=conv2(gf,masky);

dogx=conv2(gx,i); % �̺е� ����þ� ���͸� ���� ����
dogy=conv2(gy,i);

dog=abs(dogx)+abs(dogy); % ���� ���� ���

[m,n]=size(dog);

for j=1:m % �Ӱ谭�� 80���� ����ȭ �� ��輱 Ȯ��
  for k=1:n
    if dog(j,k)>=80
      dog(j,k)=255;
    else
      dog(j,k)=0;
    end
  end
end

dog=uint8(dog);
imshow(dog);

