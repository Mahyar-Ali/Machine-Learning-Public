function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% 
%
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));
z = X*theta;

%==========================To Calculate Sigmoid====================

g = zeros(size(z));
one = ones (size(z,1),size(z,2));
g = one ./(1+exp(-z));

hypothesis = g;

%================== Cost Function Implementation ===================


    sum_of_log_odds_matrix = log(hypothesis).*y + log(1-hypothesis).*(1-y);
    J = (-1/m) * sum (sum_of_log_odds_matrix);
    J = J + (lambda/(2*m))*sum(theta(2:size(theta),1).^2);

%======================To Find Gradient=============================
    temp = X'*(hypothesis-y).*(1/m)

    grad(1) = temp(1)
    grad (2:size(grad),1)= temp(2:size(temp),1)+((lambda/m)*theta(2:size(theta))) %Note We are not predicting the value of theta.
                                                                                  %It will be done using fmincg.

%===================================================================



end
