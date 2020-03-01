function [J, grad] = costFunctionAndGradient(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.


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

%===================================================================

% ================================================ Main Logic ========================================

%================== Cost Function Implementation ===================


    sum_of_log_odds_matrix = log(hypothesis).*y + log(1-hypothesis).*(1-y);
    J = (-1/m) * sum (sum_of_log_odds_matrix);

%===================================================================

%======================To Find Gradient=============================

    grad= (X'*(hypothesis-y)).*(1/m)      %Note We are not predicting the value of theta.It will be done using fminunc.

%===================================================================
% Note: grad should have the same dimensions as theta



% =====================================================================================================

end
