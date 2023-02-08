function [ncx,ncy,pn]=MIN_MAD(img01,img02,cx,cy,p0) 
% img01,02�� �Է����� �޾� cx,cy��ǥ�� �߽����� �ϰ�, �ڱ� �ڽŰ� p0/2��ŭ �����ϰ� ������ �ִ� 9�� ��ũ�� ����� MAD�� �ּҰ��� ���Ѵ�.
% MAD�� �ּ��� ���� ��ǥ�� ���ο� Ž�������� �߽����� �����ϰ� ���ο� ��ǥ�� ������ ���ҵ� Ž�������� ��ȯ�Ѵ�.  

pn=round(p0/2); % �����ϴ� Ž�� ����. �Լ��� ȣ���� ������ 1/2�� �����Ѵ�.
n=16;           % ��ũ�� ��� ������ ũ��

for i=1:n % MAD�� ����� ���� �ٸ� ������ �����ϱ� ���� ����
  for j=1:n
    MAD1(i,j)=abs(img01(cx-n+i-1,cy-n+j-1)-img02(cx-pn+i-1,cy-pn+j-1)); % ���� ���
    MAD2(i,j)=abs(img01(cx-n+i-1,cy-n+j-1)-img02(cx-pn+i-1,cy+j-1));    % ���
    MAD3(i,j)=abs(img01(cx-n+i-1,cy-n+j-1)-img02(cx-pn+i-1,cy+pn+j-1)); % ���� ���
    MAD4(i,j)=abs(img01(cx-n+i-1,cy-n+j-1)-img02(cx+i-1,cy-pn+j-1));    % ���� 
    MAD5(i,j)=abs(img01(cx-n+i-1,cy-n+j-1)-img02(cx+i-1,cy+j-1));       % �߾�
    MAD6(i,j)=abs(img01(cx-n+i-1,cy-n+j-1)-img02(cx+i-1,cy+pn+j-1));    % ����
    MAD7(i,j)=abs(img01(cx-n+i-1,cy-n+j-1)-img02(cx+pn+i-1,cy-pn+j-1)); % ���� �ϴ�
    MAD8(i,j)=abs(img01(cx-n+i-1,cy-n+j-1)-img02(cx+pn+i-1,cy+j-1));    % �ϴ�
    MAD9(i,j)=abs(img01(cx-n+i-1,cy-n+j-1)-img02(cx+pn+i-1,cy+pn+j-1)); % ���� �ϴ�
  end
end

mad_buf1=zeros(1,9); % MAD�� �ּҰ��� ã�� ���� ����
mad_buf(1,1)=sum(sum(MAD1)); % ��ũ�� ����� ȭ�� ���� ��� ���Ѵ�.
mad_buf(1,2)=sum(sum(MAD2));
mad_buf(1,3)=sum(sum(MAD3));
mad_buf(1,4)=sum(sum(MAD4));
mad_buf(1,5)=sum(sum(MAD5));
mad_buf(1,6)=sum(sum(MAD6));
mad_buf(1,7)=sum(sum(MAD7));
mad_buf(1,8)=sum(sum(MAD8));
mad_buf(1,9)=sum(sum(MAD9));
mad_buf./(n*n); % ��ũ�� ����� ũ��� �����ش�.

[step_mad_value,step_MAD_index]=min(mad_buf); % MAD�� �ּ��� ���� value�� index�� �����Ѵ�.


if step_MAD_index==1 % MAD�� �ּ��� index, �� ���⿡ ���� Ž�������� �߽��� ���Ѵ�.
  ncx=cx-pn;
  ncy=cy-pn;    
 endif
if step_MAD_index==2
  ncx=cx-pn;
  ncy=cy;    
endif
if step_MAD_index==3
  ncx=cx-pn;
  ncy=cy+pn;    
endif
if step_MAD_index==4
  ncx=cx;
  ncy=cy-pn;    
endif
if step_MAD_index==5
  ncx=cx;
  ncy=cy;    
endif
if step_MAD_index==6
  ncx=cx;
  ncy=cy+pn;    
endif
if step_MAD_index==7
  ncx=cx+pn;
  ncy=cy-pn;    
endif
if step_MAD_index==8
  ncx=cx+pn;
  ncy=cy;    
endif
if step_MAD_index==9
  ncx=cx+pn;
  ncy=cy+pn;    
 endif
endfunction