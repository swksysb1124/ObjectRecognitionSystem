function X = whitening(P)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    [m,n] = size(P);
    mu = sum(sum(P))/(m*n);
    sigma_sqare = sum(sum((P-mu).^2))/(m*n);
    sigma = sqrt(sigma_sqare);
    X = (P-mu)/sigma;
end

