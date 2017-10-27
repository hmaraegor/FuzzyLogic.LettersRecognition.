% Processing letter. Splitting the letter on 9 parts (3x3).
% Each part is the ratio of white pixels to black.

function Answer = funLetterProcessing(BlackWhiteImage, LeftLett, RightLett, TopLett, BottomLett)
    Letter = zeros(BottomLett - TopLett, RightLett - LeftLett);
    for i = TopLett:1:BottomLett
            for j = LeftLett:1:RightLett
                Letter(i - TopLett + 1, j - LeftLett + 1) = A(i,j);
            end
    end
    Letter=imresize(Letter, 64, 'bilinear');        % resize letter x64
    Letter=BlackWhite(Letter);
    LetterHeight=length(Letter(:,1));
    LetterWidth=length(Letter(1,:));
    
    HeightRemainder=rem(LetterHeight, 3);
    WidthRemainder=rem(LetterWidth, 3);

    if HeightRemainder==1
        Letter(LetterHeight+1,:) = 1; 
        Letter(LetterHeight+2,:) = 1;
    end
    if HeightRemainder==2
        Letter(LetterHeight+1,:) = 1;
    end
    if WidthRemainder==1
        Letter(:,LetterWidth+1) = 1;   
        Letter(:,LetterWidth+2) = 1;
    end
    if WidthRemainder==2
        Letter(:,LetterWidth+1) = 1;
    end    

    LetterHeight = length(Letter(:,1));
    LetterWidth = length(Letter(1,:));

    Answer = zeros(1,9);
    
    PartI = [0 0 0 LetterHeight/3 LetterHeight/3 LetterHeight/3 2*LetterHeight/3 2*LetterHeight/3 2*LetterHeight/3];
    PartJ = [0 LetterWidth/3 2*LetterWidth/3 0 LetterWidth/3 2*LetterWidth/3 0 LetterWidth/3 2*LetterWidth/3];
    for k = 1:1:9
        Zero = 0;
        One = 0;
        for i = PartI(k)+1:1:PartI(k) + LetterHeight/3
            for j = PartJ(k)+1:1:PartJ(k) + LetterWidth/3
               if Letter(i,j)==1
                  Zero = Zero + 1;
               else
                   One = One + 1;
               end
            end
        end
        if Zero~=0 & One/Zero<=2
        Answer(k) = One/Zero;
        else
            Answer(k) = 2;
        end
    end
end

