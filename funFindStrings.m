function Ans = funFindStrings(A)
    Start=0;
    Ans=zeros(1,10);
    for i=1:1:length(A(:,1)) %кол-во i
        f=0;
        for j=1:1:length(A(1,:)) %кол-во j
            if A(i,j)~=1 & f==0 & Start==0      %Если пиксель не белый, то
            Start=i;                            %эта строка начало
            f=1;
            end
            if A(i,j)~=1 & Start~=0             %Если пиксель не белый, то
            f=1;                                %продолжаем искать конец
            end
        end
        if f==0 & Start~=0                      %Если все пиксели были белые, то
        Final=i-1;                              %конец строки найден, и
        i
        Ans=[Ans; funFindLetters(A, Start, Final)];        %идем искать буквы этой строки
        Start=0;
        end
    end

end

