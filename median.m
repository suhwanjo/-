i=imread("lena2.bmp"); % ���� ����
j= imnoise(i,'salt & pepper'); % ������ ���� �߰�
j=medfilt2(i); % �޵�� ���� ����
imshow(j);
% mdefil2 �Լ��� ����ϱ� ���� pkg load image ��ɾ �Է��ϰ� �����ؾ� ��.