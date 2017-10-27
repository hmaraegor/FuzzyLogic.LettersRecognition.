 % Text recognition.
 
 Image3uint8 = imread('E:\Documents\text.BMP');
 Image1uint8 = Image3uint8(:,:,1);
 figure, imshow(Image1uint8); title('resize');
 Answer = funFindStrings(Image1uint8);
 fuzzyis = readfis('E:\Documents\LearningSampleFIS'); % (!)LearningSampleFIS.fis - fuzzy inference system build on LearningSampleData.dat
 Out = '';
 ABC = ['T'; 'Y'; 'y'; 'x'; 'X'; 'A'; 's'; 'S'; 'Z'; 'z'; 'w'; 'W'; 'M'; 'm'; 'n'; 'u'; 'c'; 'C'; 'G'; 'o'; 'O'; 'Q'; 'D'; 'L'; 'U'; 'V'; 'v'; 'e'; 'a'; 'g'; 'q'; 'p'; 'k'; 'K'; 'R'; 'P'; 'r'; 'f'; 'F'; 't'; 'E'; 'B'; 'h'; 'H'; 'N'; 'b'; 'd'; 'J'; 'j'; 'i'; 'I'];
     LettersData = Answer(:,1:9);
     evaluateFIS = evalfis(LettersData,fuzzyis);
     roundEvalfis = round(evaluateFIS);
     flag = 0;
 for i = 2:1:length(Answer(:,1))
     i
     for j = 1:1:51
       if roundEvalfis(i)==j
           Out = [Out ABC(j)];
           flag = 1;
       end
     end
     if flag==0
        Out = [Out '?'];
     else
         flag = 0;
     end
        
      if rem(i-1, 7)==0
         Out = [Out '     '];
     end
 end
save('E:\Documents\Test.dat','Out','-ascii');
Out 
