i=imread("lena.jpg"); % �̹��� �б�
i=uint32(i); % 255�̻��� �� ǥ���� ���� ��ȣ�� ���� 32��Ʈ ������ ��ȯ
maxi=uint32(max(max(i))); 
mini=uint32(min(min(i)));
T=(maxi+mini)/2 % �ʱ� ��谪

while(1)
Told=T; % ���ο� ��谪�� �ٷ� ���� ��谪�� ���ϱ� ����
up=uint32(0); % �հ� ���� �迭
low=uint32(0);
up_total=uint32(0); % �ε��� �� ���� �迭
low_total=uint32(0);
up_mean=uint32(0); % ��� ���� �迭
low_mean=uint32(0);
for j=1:256
  for k=1:256
    if(i(j,k)>Told) % ��谪���� ū ����
    up(1,1)+=i(j,k); % �հ�
    up_total(1,1)+=1; % ī����
  else % ��谪���� ���� ����
    low(1,1)+=i(j,k);
    low_total(1,1)+=1;
    end
  end
end
  up_mean=up/up_total; % ��� ���
  low_mean=low/low_total;
  T=(up_mean+low_mean)/2 % ���ο� ��谪 ���
  if(abs(Told-T)<0.3) % ��谪�� ��ȭ�� �̸� ���ǵ� ���� 0.3���� ���� �� ����
  break;
end 
end
% ����ȭ
for j=1:256
  for k=1:256
    if(i(j,k)>=T)
    i(j,k)=255;
  else
    i(j,k)=0;
  end
end
end
i=uint8(i);
imshow(i);