function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 


% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Hint: The computation of the cost function and gradients can be
%       efficiently vectorized. For example, consider the computation
%
%           sigmoid(X * theta)
%
%       Each row of the resulting matrix will contain the value of the
%       prediction for that example. You can make use of this to vectorize
%       the cost function and gradient computations. 
%
% Hint: When computing the gradient of the regularized cost function, 
%       there're many possible vectorized solutions, but one solution
%       looks like:
%           grad = (unregularized gradient for logistic regression)
%           temp = theta; 
%           temp(1) = 0;   % because we don't add anything for j = 0  
%           grad = grad + YOUR_CODE_HERE (using the temp variable)
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

%===================================================================

% ================================================ Main Logic ========================================

%================== Cost Function Implementation ===================


    sum_of_log_odds_matrix = log(hypothesis).*y + log(1-hypothesis).*(1-y);
    J = (-1/m) * sum (sum_of_log_odds_matrix);
    J = J + (lambda/(2*m))*sum(theta(2:size(theta),1).^2);
%===================================================================

%======================To Find Gradient=============================
    temp = X'*(hypothesis-y).*(1/m)

    grad(1) = temp(1)
    grad (2:size(grad),1)= temp(2:size(temp),1)+((lambda/m)*theta(2:size(theta))) %Note We are not predicting the value of theta.It will be done using fminunc.

%===================================================================

% =============================================================


end
