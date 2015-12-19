clear all;
close all;
clc;

dataSet_paths = {};
dataSet_paths{1,1} = 'C:\Users\USER\Documents\MATLAB\ComputerVisionTwo\img\training\bikes\';
dataSet_paths{2,1} = 'C:\Users\USER\Documents\MATLAB\ComputerVisionTwo\img\training\cars\';
dataSet_paths{3,1} = 'C:\Users\USER\Documents\MATLAB\ComputerVisionTwo\img\training\doors\';
dataSet_paths{4,1} = 'C:\Users\USER\Documents\MATLAB\ComputerVisionTwo\img\training\signs\';
dataSet_paths{5,1} = 'C:\Users\USER\Documents\MATLAB\ComputerVisionTwo\img\training\trees\';

[ wordpool ] = pooling(dataSet_paths);

% load('WordPool.mat');

K = 250;
opts = statset('Display','final', 'MaxIter',200);
[idx,BoW] = kmeans(wordpool,K,'Distance','cityblock','Replicates',5,'Options',opts);

save('BoW.mat','BoW');
