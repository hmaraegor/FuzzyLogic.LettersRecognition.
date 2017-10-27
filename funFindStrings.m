% This function find top and bottom each string.

function Answer = funFindStrings(BlackWhiteImage)
    TopStr = 0;
    Answer = zeros(1,10);
    for i = 1:1:length(BlackWhiteImage(:,1))
        BotS = 0;
        for j = 1:1:length(BlackWhiteImage(1,:)) 
            if BlackWhiteImage(i,j)~=1 & BotS==0 & TopStr==0   
            TopStr = i; 
            BotS = 1;
            end
            if BlackWhiteImage(i,j)~=1 & TopStr~=0         
            BotS = 1;                              
            end
        end
        if BotS==0 & TopStr~=0                     
        BottomStr = i-1;  
        Answer=[Answer; funFindLetters(BlackWhiteImage, TopStr, BottomStr)];        %finding letters 
        Top = 0;
        end
    end
end

