clear;
close all;
clc;
load mfcc.mat;
[FileName,PathName] = uigetfile('*.wav','Select the Sound file');
file=fullfile(PathName, FileName);
fprintf('Reading %s.....\n',FileName);
pause(1);
[kk,fs]=audioread(file);
pk=SilenceRemoval(kk,fs);
fprintf('Removing Silence\n');
ck=melcepst(pk,fs);
test.mfcc=ck;
dist = zeros(1,120);
for j=1:120
    dist(1,j) = dtw(test.mfcc, ref(j).mfcc);
end
fprintf('calculating DTW and camparing with database\n');
pause(1);
[M,I] = min(dist);
c=ref(I).emot;
fprintf('Emotion detected\n');
pause(1);
switch c
    case 1
        disp('Emotion: angry')
    case 2
        disp('Emotion: disgust')
    case 3
        disp('Emotion: fear')
    case 4
        disp('Emotion: happy')
    case 5
        disp('Emotion: neutral')
    case 6
        disp('Emotion: sad')
    case 7
        disp('Emotion: surprise')
end;
close all;