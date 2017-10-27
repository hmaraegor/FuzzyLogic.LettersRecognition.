% This function start to create learning sample

Image3uint8 = imread('<E:\Documents\LearningSampleImage.bmp>');
Image1uint8 = Image3uint8(:,:,1); 
BlackWhiteImage = roicolor(J,250,255);
Answer = funFindStrings(BlackWhiteImage);
save('<LearningSampleImage.dat>','Answer','-ascii');
