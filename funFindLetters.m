function Ans = funFindLetters(A, Start, Final)
Left=0; Right=length(A(1,:))+1;
Top=length(A(:,1))+1; Bottom=0;
Ans=zeros(1,10);
STR=1;
    for j=1:1:length(A(1,:)) %кол-во j
        f=0;
        for i=Start:1:Final %–ассматриваем только присланную строку
            if A(i,j)~=1 & Left==0  %≈сли пиксель не белый, то
                Left=j;             %это лева€ граница буквы
            end
            if A(i,j)~=1 & Top>i    %≈сли пиксель нижеt верхней границы не белый,
               Top=i;               %то попровл€ем границу буквы 
            end
            if A(i,j)~=1 & Bottom<i %≈сли пиксель выше нижней границы не белый,
               Bottom=i;            %то попровл€ем нижнюю границу буквы 
            end
            if A(i,j)~=1            %≈сли еще не конец буквы, то
               f=1;                 %указываем это
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

