function [histogram] = wordhist( BoW, descriptors )
% [histogram] = wordhist( BoW, descriptors )
% This function maps all descriptors of an image to their corresponding closest word, 
% and conuts frequency of these words to inform a histogram of codewords in BoW.  
%   Input parameters:
%     BoW: bag of word generated from training set.
%     descriptors : all descriptors of an image
% 
%   Returned:
%     histogram: histogram of codewords in BoW.

%   Detailed explanation goes here
    [K,no_use] = size(BoW);
    histogram = zeros(1,K);
    histogram = histogram + 1/K;
    
    [N,p] = size(descriptors);
    
    for i = 1:N
        descriptor = descriptors(i,:); % descriptor is 1 * p
        
        diff = ones(K,1)*descriptor - BoW;
        diff = abs(diff);
        distance = sum(diff,2);
        [index]=find(distance == min(distance));
        
        num_of_match_word = length(index);
        for j = 1:num_of_match_word;
            histogram( index(j) ) = histogram( index(j) ) + 1/num_of_match_word;
        end
    end
    
    % Normalization
    histogram = histogram / sum(sum(histogram));
    %figure; stem(histogram)
end

