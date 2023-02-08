img=imread("lena2.bmp");
[m,n]=size(img);

bufH=zeros(1,n); % ���� ���� ���� �迭
bufP=zeros(m,1); % ���� ���� ���� �迭

lpfx=[0.5 0.5]; % WT LPF (�̻� WT�� 0,5�� ����, Haar WT�� 0.707�� �����ϸ� �˴ϴ�.)
lpfy=lpfx';

hpfx=[-0.5 0.5]; % WT HPF
hpfy=hpfx';

% ���� LPF,HPF / down sampling
for i=1:m
  for j=1:n
    bufH(1,j)=img(i,j); 
  end
    horiL=conv(bufH,lpfx); % ���� LPF
    horiH=conv(bufH,hpfx); % ���� HPF
  for k=2:2:n+1
    L(i,k/2)=horiL(1,k); % ���� LPF - down sampling
    H(i,k/2)=horiH(1,k); % ���� HPF - down sampling
  end
end


[m1,n1]=size(L);

% ���� LPF - ���� LPF,HPF / down sampling
for i=1:n1
  for j=1:m1
    bufP(j,1)=L(j,i); 
  end
    perpLL=conv(bufP,lpfy); % ���� LPF - ���� LPF
    perpLH=conv(bufP,hpfy); % ���� LPF - ���� HPF
  for k=2:2:m1+1
    LL(k/2,i)=perpLL(k,1); % ���� LPF - ���� LPF - down sampling
    LH(k/2,i)=perpLH(k,1); % ���� LPF - ���� HPF - down sampling
  end
end

% ���� HPF - ���� LPF,HPF / down sampling
for i=1:n1
  for j=1:m1
    bufP(j,1)=H(j,i); 
  end
    perpHL=conv(bufP,lpfy); % ���� HPF - ���� LPF
    perpHH=conv(bufP,hpfy); % ���� HPF - ���� HPF
  for k=2:2:m1+1
    HL(k/2,i)=perpHL(k,1); % ���� HPF - ���� HPF - down samlping
    HH(k/2,i)=perpHH(k,1); % ���� HPF - ���� HPF - down sampling
   end
end

% 4���� ���� ������ �ϳ��� ����
wtmat=zeros(m,n);
for i=1:m/2
  for j=1:n/2
    wtmat(i,j)=LL(i,j)/255; % ���� ����� ����, ���� ��� ��� ����� �����Ѵ�. ���� ���� ���� ���� ������� ���� ������ ���´�. �� ȭ�鿡 ������ ��� ����ϱ� ���� LL������ 255�� ���� double���·� ��ȯ��.
    wtmat(i+(m/2),j)=LH(i,j); % ���� �ϴ��� ��������� ���������� ����, ���� ���󿡼� ������� ��踦 �����Ѵ�.
    wtmat(i,j+(n/2))=HL(i,j); % ���� ����� ���������� ��������� ����, ���� ���󿡼� �������� ��踦 �����Ѵ�.
    wtmat(i+(m/2),j+(n/2))=HH(i,j); % ���� �ϴ��� ����, ���� ��� ���п� �ش��Ѵ�. ���� ���󿡼� �밢�� ���� ��踦 �����Ѵ�.
  end
end

imshow(wtmat);


