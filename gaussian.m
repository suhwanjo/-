i=imread("lena2.bmp"); % ���� ����
i=double(i); % ��������� ���� double�� �� ��ȯ
x=fspecial("gaussian",[5,5],6); % fspecial �Լ��� filter�� ��������. ù ��° �μ����� ���� filter�� �̸�, filter�� size, gamma�� ũ���̴�.
blured=uint8(conv2(i,x)); % ����� ����þ� ���͸� convolution
imshow(blured);

% fspecial �Լ��� ����ϱ� ���� pkg load image ��ɾ �Է��ϰ� �����ؾ� �� 