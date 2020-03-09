function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

c= [0.01 0.03 0.1 0.3 1 3 10 30];

cross_error = zeros(size(c,2));

% ====================== Main Logic ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

for i = 1 : length(c)
for j= 1 : length(c)
x1 = X(i,:);
x2 = X(j,:);
model = svmTrain(X,y,c(i),@(x1,x2) gaussianKernel(x1,x2,c(j)));
predictions = svmPredict(model,Xval);
cross_error(i,j) = mean(double(predictions~=yval))
end
end
min_values_col= min(cross_error);
[min_value_row min_value_col] = find(cross_error==min(min_values_col))

C = c(min_value_row);
sigma = c(min_value_col);
min(cross_error)
% =========================================================================

end
