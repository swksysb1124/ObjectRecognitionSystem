function [ wordpool ] = pooling(dataSet_paths)
% [ wordpool ] = pooling(dataSet_paths, K )
%
% This function reads an set of images and returns a feature pool.
%   Input parameters:
%     dataSet_paths: the file name for the image.
%
%   Returned:
%     wordpool: a N-by-128 matrix, where N refers to the number of total
%     descripters in training set.
%     The descriptor is a vector of 128 values normalized to unit length.
%
% Credits: Thanks for initial version of this program to D. Alvaro and 
%          J.J. Guerrero, Universidad de Zaragoza (modified by D. Lowe)
    [m,n] = size(dataSet_paths);
    wordpool = [];
    for i = 1:m
        file_name = dir(strcat(dataSet_paths{i,1})); % the path tht u hv imges
        ImgNum = length(file_name);
        
        for j = 1:ImgNum
            t = strfind(file_name(j).name,'.JPG');
            if(~isempty(t))
                display(['Reading...',file_name(j).name]);
                [descriptors] = my_sift(strcat(dataSet_paths{i,1} , file_name(j).name));
                wordpool = [wordpool;descriptors];
            end
        end 
        display('**************************** one class end ***********************************');
    end
    save('WordPool.mat','wordpool');
end

