function Ans = funLetterProcessing(A, Left, Right, Top, Bottom)
    J=zeros(Bottom-Top,Right-Left);
    for i=Top:1:Bottom
            for j=Left:1:Right
                J(i-Top+1,j-Left+1)=A(i,j);
            end
    end
    J=imresize(J, 64, 'bilinear');  % увеличю в 8 раза
    %figure, imshow(J); title('resize');
    J=BlackWhite(J);
    %figure, imshow(J); title('resize');
    Si=length(J(:,1));
    Sj=length(J(1,:));
    
    Mi=rem(Si, 3);
    Mj=rem(Sj, 3);

    if Mi==1
        J(Si+1,:)=1; J(Si+2,:)=1;
    end
    if Mi==2
        J(Si+1,:)=1;
    end
    if Mj==1
        J(:,Sj+1)=1;   J(:,Sj+2)=1;
    end
    if Mj==2
        J(:,Sj+1)=1;
    end    

    Si=length(J(:,1));
    Sj=length(J(1,:));

    Ans=zeros(1,9);
    
    Di=[0 0 0 Si/3 Si/3 Si/3 2*Si/3 2*Si/3 2*Si/3];
    Dj=[0 Sj/3 2*Sj/3 0 Sj/3 2*Sj/3 0 Sj/3 2*Sj/3];
    for k=1:1:9
        Zero=0;
        One=0;
        for i=Di(k)+1:1:Di(k)+Si/3
            for j=Dj(k)+1:1:Dj(k)+Sj/3
               if J(i,j)==1
                  Zero=Zero+1;
               else
                   One=One+1;
               end
            end
        end
        if Zero~=0 & One/Zero<=2
        Ans(k)=One/Zero; %((One+1)/(Zero+1))/(Bottom-Top);
        else
            Ans(k)=2;
        end
    end
end

