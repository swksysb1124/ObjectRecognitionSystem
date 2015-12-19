clear all;
close all;
clc;

load('BoW.mat');

dataSet_paths = {};
basic_path = 'C:\Users\USER\Documents\MATLAB\ComputerVisionTwo\img\testing\';
dataSet_paths{1,1} = strcat(basic_path,'bikes\');
dataSet_paths{2,1} = strcat(basic_path,'cars\');
dataSet_paths{3,1} = strcat(basic_path,'doors\');
dataSet_paths{4,1} = strcat(basic_path,'signs\');
dataSet_paths{5,1} = strcat(basic_path,'trees\');

classname = {'bike';'car';'door';'sign';'tree'};


imagename = {};
class = [];
training = [];
for i = 1:length(dataSet_paths(:,1))
    file_name = dir(strcat( dataSet_paths{i,1} ));
    
    k=1;
    for j = 1:length(file_name)
         t = strfind(file_name(j).name,'.JPG');
         if(~isempty(t))
            display(['** Reading...',file_name(j).name]);
            imagename = [imagename;file_name(j).name];
            [descriptors] = my_sift(strcat( dataSet_paths{i,1} , file_name(j).name));
            
            training_temp(k,:) = wordhist( BoW, descriptors );
            class_temp{k,1} = classname{i,1};
            k=k+1;
         end
    end
    class = [class;class_temp];
    training = [training;training_temp];
    display('**************************** one class end ***********************************');
end
% Prediction
classifier = NaiveBayes.fit(training,class);


C_Inferred = classifier.predict(training);
% [fail] = splitWrong(class,C_Inferred,imagename)
cMat1 = confusionmat(class,C_Inferred);
fail = {};
for i = 1:length(C_Inferred(:,1))
    if(strcmp(C_Inferred{i,1},class{i,1})==0)
        fail = [fail;{imagename{i,1},class{i,1},C_Inferred{i,1}}];
    end
end
figure;
for i = 1:length(fail(:,1))/2
    path = [basic_path,fail{i,2},'s\',fail{i,1}];
    I = imread(path);
    pos = [1 1];
    subplot(4,5,i); imshow(I);title(['Predicted class: ' fail{i,3}]);
end
figure;
for i = (length(fail(:,1))/2+1):length(fail(:,1))
    path = [basic_path,fail{i,2},'s\',fail{i,1}];
    I = imread(path);
    pos = [1 1];
    subplot(4,5,i-length(fail(:,1))/2); imshow(I);title(['Predicted class: ' fail{i,3}]);
end



