# FuzzyLogic.LettersRecognition.
Letters recognition project with fuzzy logic. Matlab + Fuzzy Logic Toolbox.

It's student project for find out how the fuzzy inference system is suitable for letter recognition.

ImageProcessing.m start to create learning sample (LearningSampleData.dat). 
TextRecognitionScan.m - fis-based text recognition (LearningSampleFIS.fis build on LearningSampleData.dat).

For training was chosen this sequence:
T Y y x X A s S Z z w W M m n u c C G o O Q D L U V v e a g q p k K R P r f F t E B h H N b d J j i I
32 strings was printed Arial font and scan(LearningSampleImage.bmp) – 32 samples of 51 elements in each (51: I=l in Arial font).

Optim. method (train FIS): hybrid, 0 error tolerance, 10 epochs. After 10 training cycles, the network error is 0.05.
FIS type: sugeno. 9 input variables and 1 output variable. To reduce the computational complexity for each input variable, only two membership functions are selected, such as 'trimf'. For the output variable, the type of membership functions is chosen 'linear', since it gives a better approximation. Since we have 2 rules for each of the 9 variables, we have 2 ^ 9 = 512 rules.
