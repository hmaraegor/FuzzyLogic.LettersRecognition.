% This function start to create learning sample

Image3uint8 = imread('<E:\Documents\LearningSampleImage.bmp>'); %sample with strings
Image1uint8 = Image3uint8(:,:,1); 
BlackWhiteImage = roicolor(Image1uint8,250,255);
Answer = funFindStrings(BlackWhiteImage);     %finding strings
save('<LearningSampleImage.dat>','Answer','-ascii');
