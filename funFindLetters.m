% This function find top, bottom and edges each letter.

function Answer = funFindLetters(BlackWhiteImage, TopStr, BottomStr)
LeftLett = 0; 
RightLett = length(BlackWhiteImage(1,:))+1;
TopLett = length(BlackWhiteImage(:,1))+1; 
BottomLett = 0;
Answer = zeros(1,10);
StringNumber = 1;
    for j = 1:1:length(BlackWhiteImage(1,:))
        BotL = 0;
        for i = TopStr:1:BottomStr
            if BlackWhiteImage(i,j)~=1 & LeftLett==0
                LeftLett = j;
            end
            if BlackWhiteImage(i,j)~=1 & TopLett>i
               TopLett = i;
            end
            if BlackWhiteImage(i,j)~=1 & BottomLett<i
               BottomLett = i;
            end
            if BlackWhiteImage(i,j)~=1
               BotL = 1;
            end
        end
        if BotL==0 & LeftLett~=0
           RightLett = j - 1;
           Answer(StringNumber,:) = [funLetterProcessing(BlackWhiteImage,LeftLett,RightLett,TopLett,BottomLett) StringNumber];
           StringNumber = StringNumber + 1;
           LeftLett = 0; 
           RightLett = length(BlackWhiteImage(1,:)) + 1;
           TopLett = length(BlackWhiteImage(:,1)) + 1; 
           BottomLett = 0;
        end
    end
end

