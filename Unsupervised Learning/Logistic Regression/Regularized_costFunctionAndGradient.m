function [J, grad] = w(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
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

% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


   sum_of_log_odds_matrix = log(hypothesis).*y + log(1-hypothesis).*(1-y);
   J = [(-1/m) * sum(sum_of_log_odds_matrix)]+[(lambda/(2*m))*sum(theta(2:size(theta)).^2)];

 
%===================================================================

%======================To Find Gradient=============================  
    grad= (X'*(hypothesis-y)).*(1/m);

    theta(1)= grad(1);

    theta(2:size(theta)) = grad([2:size(theta)])+(theta(2:size(theta))*(lambda/m));

    grad = theta;


%===================================================================
% Note: grad should have the same dimensions as theta



% =====================================================================================================


end
