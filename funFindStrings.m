function Ans = funFindStrings(A)
    Start=0;
    Ans=zeros(1,10);
    for i=1:1:length(A(:,1)) %���-�� i
        f=0;
        for j=1:1:length(A(1,:)) %���-�� j
            if A(i,j)~=1 & f==0 & Start==0      %���� ������� �� �����, ��
            Start=i;                            %��� ������ ������
            f=1;
            end
            if A(i,j)~=1 & Start~=0             %���� ������� �� �����, ��
            f=1;                                %���������� ������ �����
            end
        end
        if f==0 & Start~=0                      %���� ��� ������� ���� �����, ��
        Final=i-1;                              %����� ������ ������, �
        i
        Ans=[Ans; funFindLetters(A, Start, Final)];        %���� ������ ����� ���� ������
        Start=0;
        end
    end

end

