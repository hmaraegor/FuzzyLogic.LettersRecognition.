function Ans = funFindLetters(A, Start, Final)
Left=0; Right=length(A(1,:))+1;
Top=length(A(:,1))+1; Bottom=0;
Ans=zeros(1,10);
STR=1;
    for j=1:1:length(A(1,:)) %���-�� j
        f=0;
        for i=Start:1:Final %������������� ������ ���������� ������
            if A(i,j)~=1 & Left==0  %���� ������� �� �����, ��
                Left=j;             %��� ����� ������� �����
            end
            if A(i,j)~=1 & Top>i    %���� ������� ����t ������� ������� �� �����,
               Top=i;               %�� ���������� ������� ����� 
            end
            if A(i,j)~=1 & Bottom<i %���� ������� ���� ������ ������� �� �����,
               Bottom=i;            %�� ���������� ������ ������� ����� 
            end
            if A(i,j)~=1            %���� ��� �� ����� �����, ��
               f=1;                 %��������� ���
            end
        end
        if f==0 & Left~=0
           Right=j-1;
           Ans(STR,:)=[funLetterProcessing(A,Left,Right,Top,Bottom) STR];
           STR=STR+1;
           Left=0; Right=length(A(1,:))+1;
           Top=length(A(:,1))+1; Bottom=0;
        end
    end
end

