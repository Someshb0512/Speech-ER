% train.m

%after downloading the database 
%save it under folder name 'English Emotion database'
%i have taken DC folder as refrence 
%remaining 3 folder are kept for testing
%before running the this file 
%rename all wav file in DC folder
%rename a01 to a1
%a02 to a2
%and similerly all
%then run it
% you have to this only once

for i=1:15
    fname=sprintf('English Emotion database\\DC\\a%d.wav',i);
    [k,fs]=audioread(fname);
    p=SilenceRemoval(k,fs);
    cc=melcepst(p,fs);
    ref(i).mfcc=cc;
    ref(i).emot=1;
end
for i=1:15
    fname=sprintf('English Emotion database\\DC\\d%d.wav',i);
    [k,fs]=audioread(fname);
    p=SilenceRemoval(k,fs);
    cc=melcepst(p,fs);
    ref(i+15).mfcc=cc;
    ref(i+15).emot=2;
end
for i=1:15
    fname=sprintf('English Emotion database\\DC\\f%d.wav',i);
    [k,fs]=audioread(fname);
    p=SilenceRemoval(k,fs);
    cc=melcepst(p,fs);
    ref(i+30).mfcc=cc;
    ref(i+30).emot=3;
end
for i=1:15
    fname=sprintf('English Emotion database\\DC\\h%d.wav',i);
    [k,fs]=audioread(fname);
    p=SilenceRemoval(k,fs);
    cc=melcepst(p,fs);
    ref(i+45).mfcc=cc;
    ref(i+45).emot=4;
end
for i=1:30
    fname=sprintf('English Emotion database\\DC\\n%d.wav',i);
    [k,fs]=audioread(fname);
    p=SilenceRemoval(k,fs);
    cc=melcepst(p,fs);
    ref(i+60).mfcc=cc;
    ref(i+60).emot=5;
end
for i=1:15
    fname=sprintf('English Emotion database\\DC\\sa%d.wav',i);
    [k,fs]=audioread(fname);
    p=SilenceRemoval(k,fs);
    cc=melcepst(p,fs);
    ref(i+90).mfcc=cc;
    ref(i+90).emot=6;
end
for i=1:15
    fname=sprintf('English Emotion database\\DC\\su%d.wav',i);
    [k,fs]=audioread(fname);
    p=SilenceRemoval(k,fs);
    cc=melcepst(p,fs);
    ref(i+105).mfcc=cc;
    ref(i+105).emot=7;
end
save 'mfcc.mat' ref;
close all;
