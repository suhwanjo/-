img1=imread('frame1.jpg');
img2=imread('frame2.jpg');

figure(1); % ���� ������ ���
imshow(img1);

p=15; % Ž������
n=16; % ��ũ�� ����� ���� ũ��

[m1,n1]=size(img2); % ��ũ�� ��� ũ�� n�� ������� ���߱� ���� ó�� �����̴�. 142+2=16*9
imgP1=zeros(m1+2,n1);
for i=1:m1;
  for j=1:n1
    imgP1(i,j)=img1(i,j);
  end 
end

imgP2=zeros(m1+(2*n),n1+(2*n)); % ���� �����ӿ��� step 1 ���� ���� �� �ֺ� 8 ���� Ž���� ���� Zero-Padding ó���� �ʿ��ϴ�.
for i=1:m1
  for j=1:n1
    imgP2(i+n,j+n)=img2(i,j);
  end 
end

count=1;
for i=n+1:n:n*9+n    % 144=16*9, Padding ���� �� ó���ϱ� ������ ���� ��ǥ�� (17,17)
  for j=n+1:n:n*13+n % 208=16*13
    cx0=i;
    cy0=j;
    % Step 1
    [cx1,cy1,p1]=MIN_MAD(imgP1,imgP2,cx0,cy0,p);
    % Step 2
    [cx2,cy2,p2]=MIN_MAD(imgP1,imgP2,cx1,cy1,p1);
    % Step 3
    [cx3,cy3,p3]=MIN_MAD(imgP1,imgP2,cx2,cy2,p2);
    % Step 4
    [cx4,cy4,p4]=MIN_MAD(imgP1,imgP2,cx3,cy3,p3);
    
    motion_vectorx=cx4-cx0; % Motion Vector ���
    motion_vectory=cy4-cy0;
    printf('Motion Vector for point(%d,%d) of img1=(%d,%d)   count=%d\n',cx0-n,cy0-n,motion_vectorx,motion_vectory,count++);
    if motion_vectorx==0 && motion_vectory==0 % Motion Vector�� �����ϴ� ��ũ�� ��ϸ��� ����� ������ ���� �������� ����� ���� ó���̴�.
     continue;
    end
    img1(cx4-n:1:cx4-n+15,cy4-n:1:cy4-n+15)=imgP2(cx4:1:cx4+15,cy4:1:cy4+15); % ������ ���� ������ ����
  end
end

imgn1=zeros(m1,n1); % ���� ������ - ������ ���� �������� �����ϱ� ���� ó���̴�.
for i=1:m1
  for j=1:n1
    imgn1(i,j)=img1(i,j);
  end
end

imgD=img2-imgn1; % ���� ������ - ������ ���� ������

figure(2);
imshow(img2); % ���� ������
figure(3);
imshow(img1); % ������ ���� ������(�������� ũ�Ⱑ �پ����� ������ �����ڷῡ��ó�� ������ �������� ��Ƴ��� ������ ������� �ִ� ������ ���δ�.)
figure(4);
imshow(imgD); % ���� ������ - ������ ���� ��������(������ ���� �������� ������ �����ϰ� �������� ���� �������� �ʴ´�.)



