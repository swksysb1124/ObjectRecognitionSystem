function X = pre_processing(P)
%UNTITLED2 Summary of this function goes here
    %% whitening : mean = 0, standard deviation = 1;
    [m,n] = size(P);
    mu = sum(sum(P))/(m*n);
    sigma_sqare = sum(sum((P-mu).^2))/(m*n);
    sigma = sqrt(sigma_sqare);
    X = (P-mu)/sigma;
    %% histogram equalization
    X = histeq(X);
end

