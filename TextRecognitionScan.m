 I = imread('E:\Документы\Предметы\2015\+Неклассические логики\Letters Recognition\11 скан\attr.BMP');
 J=I(:,:,1);
%  K=imresize(J, 1, 'bicubic');  % увеличю в 4 раза
  figure, imshow(J); title('resize');
%BW = roicolor(K,150,255);     %BlackWhite 0 1
%figure, imshow(BW); title('logical');
 Ans=funFindStrings(J);
 a=readfis('E:\Документы\Предметы\2015\+Неклассические логики\Letters Recognition\11 скан\32test2');
 Out='';
 ABC=['T'; 'Y'; 'y'; 'x'; 'X'; 'A'; 's'; 'S'; 'Z'; 'z'; 'w'; 'W'; 'M'; 'm'; 'n'; 'u'; 'c'; 'C'; 'G'; 'o'; 'O'; 'Q'; 'D'; 'L'; 'U'; 'V'; 'v'; 'e'; 'a'; 'g'; 'q'; 'p'; 'k'; 'K'; 'R'; 'P'; 'r'; 'f'; 'F'; 't'; 'E'; 'B'; 'h'; 'H'; 'N'; 'b'; 'd'; 'J'; 'j'; 'i'; 'I'];
     x=Ans(:,1:9);
     y=evalfis(x,a);
     r=round(y);
     fl=0;
 for i=2:1:length(Ans(:,1))
     i
     for j=1:1:51
       if r(i)==j
           Out=[Out ABC(j)];
           fl=1;
       end
     end
     if fl==0
        Out=[Out '?'];
     else
         fl=0;
     end
        
      if rem(i-1, 7)==0
         Out=[Out '     '];
     end
 end
% save('F:\+Неклассические логики\Letters Recognition\Test img\Test.dat','Out','-ascii');
Out