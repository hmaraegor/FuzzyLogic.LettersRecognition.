I = imread('E:\Документы\Предметы\2015\+Неклассические логики\Letters Recognition\11 скан\5.bmp'); %3 uint8
J=I(:,:,1);                     %1 uint8
figure, imshow(J); title('original');
%K=imresize(J, 1, 'bicubic');  % увеличю в 4 раза
%figure, imshow(K); title('resize');
% BW = roicolor(J,250,255);     %BlackWhite 0 1
% figure, imshow(BW); title('logical');
Ans=funFindStrings(J); %A J I L M N H P F E B R G C D O Q T Y U V X W K S Z
                       %j i l t f k h b d q p g y v x w s z m n r u o c e a
                       %v y s z x w m n u o c e a g q p k h b d j i l r f t
                       %T Y V W M N H K R P F E B G L I J U D C O Q S Z X A
                       %M H N K R P F E B T Y X A W I Z S G C O Q D L U J V
    
%Ans(:,10)=Ans(:,10).*2;
%Out=[Ans(:,1)+Ans(:,4) Ans(:,2) Ans(:,3)+Ans(:,6) Ans(:,5) Ans(:,7) Ans(:,8) Ans(:,9) Ans(:,10)];
%save 3Str9.dat Ans -ascii

% k=0;              %Столбцы
% for i=1:3:78
%     k=k+1;
%    for j=1:1:3
%       Ans(i+j,10)=k; 
%    end
% end

save('E:\Документы\Предметы\2015\+Неклассические логики\Letters Recognition\11 скан\5.dat','Ans','-ascii');





% b=ans+uint8(edge(ans,'sobel'))+uint8(edge(ans,'prewitt'))...
%     +uint8(edge(ans,'roberts'))+uint8(edge(ans,'log'))...
%     +uint8(edge(ans,'zerocross'))+uint8(edge(ans,'canny'));
% figure, imshow(b); title('resizeEdge');







% % BW=BW+edge(ans,'zerocross');
% % for i = 1:1:size(BW(:,1))
% %     for j = 1:1:size(BW(:,1))
% %         if BW(i,j)<0
% %             BW(i,j)=0;
% %         end
% %     end
% % end
%imshow(ans);






% S = qtdecomp(BW,.50,2);
% blocks = repmat(uint8(0),size(S));
%  
% for dim = [512 256 128 64 32 16 8 4 2 1];    
%   numblocks = length(find(S==dim));    
%   if (numblocks > 0)        
%     values = repmat(uint8(1),[dim dim numblocks]);
%     values(2:dim,2:dim,:) = 0;
%        blocks = qtsetblk(blocks,S,dim,values);
%   end
% end
%  
% blocks(end,1:end) = 1;
% blocks(1:end,end) = 1;
% 
% figure, imshow(blocks,[]); title('blocks');

