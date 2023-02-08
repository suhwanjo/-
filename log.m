i=imread("lena2.bmp"); % ���� ����

gf=fspecial("gaussian",3,0.5); % 3x3 �������� ǥ�������� 0.5�� ����þ� ����ũ ����
logf=[0,1,0;1,-4,1;0,1,0]; % 2�� �̺��� ���ö�þ� ������ ������ ���ö�þ� ����ũ ����
blured=conv2(i,gf); % log�� ������ �ΰ��ϱ� ������ ����þ� ����ũ�� ���� �� ó��
log=conv2(blured,logf); % �� �� ���ö�þ� ����ũ�� ���� ���� �����Ű�� log 

log1=zeros(518,518); % zero crossing ����� ���� ���ο� �迭 ����
[m,n]=size(log1);

for j=1:516 % ��輱 ����� ���� zero padding 
  for k=1:516
    log1(j+1,k+1)=log(j,k);
  end
end

t=5; % �Ӱ谪 ����
edgelist=zeros(1,1); 

for j=2:517 
  for k=2:517
    sum=0;
    
    if log1(j-1,k-1)*log1(j+1,k+1)<0 % ���� 45�� ���⿡�� ��ȣ�� �ٲ���� Ȯ��
      edgelist(j,k)=abs(log1(j-1,k-1))+abs(log1(j+1,k+1)); % �ٲ�ٸ� �� ���̰� �Ӱ谪���� ū�� Ȯ��
      if edgelist(j,k)>=t
      sum+=1; % ũ�ٸ� ī����
    end  
  end
    
    if log1(j+1,k-1)*log1(j-1,k+1)<0 % ���� 45�� ���⿡�� ��ȣ�� �ٲ���� Ȯ��
      edgelist(j,k)=abs(log1(j-1,k-1))+abs(log1(j-1,k+1));
      if edgelist(j,k)>=t
      sum+=1;  
    end
  end
  
    if log1(j,k-1)*log1(j,k+1)<0 % ���� ���⿡�� ��ȣ�� �ٲ���� Ȯ��
      edgelist(j,k)=abs(log1(j,k-1))+abs(log1(j,k+1));
      if edgelist(j,k)>=t
      sum+=1;  
    end
  end
  
    if log1(j-1,k)*log1(j+1,k)<0 % ���� ���⿡�� ��ȣ�� �ٲ���� Ȯ��
      edgelist(j,k)=abs(log1(j-1,k))+abs(log1(j+1,k));
      if edgelist(j,k)>=t
      sum+=1;
    end
  end
 
 if sum>=2 % ��ȣ�� �ٲ�� �ְ� �� ���̰� �Ӱ谪���� ū ��찡 2�� �̻��̸� ���� ó��
      log1(j,k)=255;
    end

end
end

for j=1:516 % zero padding �� ������ ����
  for k=1:516
    log(j,k)=log1(j+1,k+1);
  end
end


log=uint8(log);
imshow(log);
