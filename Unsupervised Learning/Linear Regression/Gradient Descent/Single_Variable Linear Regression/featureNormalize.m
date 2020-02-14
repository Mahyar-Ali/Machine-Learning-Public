function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% Initially set the normalalized matrix to the original.
X_norm = X;
mu = zeros(1, size(X, 2)); %To store the mean of each feature.
sigma = zeros(1, size(X, 2));%To store the standard Deviation of each feature.

% ======================   IMPLEMENTATION OF MAIN LOGIC ======================
% Instructions: First, for each feature dimension, compute the mean
%               of the feature and subtract it from the dataset,
%               storing the mean value in mu. Next, compute the 
%               standard deviation of each feature and divide
%               each feature by it's standard deviation, storing
%               the standard deviation in sigma. 
%
%               Note that X is a matrix where each column is a 
%               feature and each row is an example. You need 
%               to perform the normalization separately for 
%               each feature. 
%

mu = mu + mean(X,1) % Compute mean of each column(feature) in X and store it in mu.
sigma = sigma + std(X)  % Compute standard deviation of each column(feature) in X and store it in mu.
X = X - mu              % Subtract Standard Mean from each feature.Corresponding entries are subtracted.e.g.,Mean for 2nd feature is subtracted             
                        % from second column
X = X./std(X)            
X_norm = X              % Return the Normalized Matrix            



% ============================================================

end
