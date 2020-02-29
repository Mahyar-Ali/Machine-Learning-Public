function [theta, J_history] = RegularizedGradientDescent(X, y, theta, alpha,lambda, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
number_of_features = size (X,2);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %
      cost_matrix = (X*theta-y) ;
      
      partial_derivatives_matrix = X'*cost_matrix;
      
      theta(1) = theta(1) - partial_derivatives_matrix(1).*(alpha*(1/m));
     
      theta([2 size(theta)],:) = theta([2 size(theta)],:).*(1-alpha*(lambda/m)) - partial_derivatives_matrix([2 size(theta)],:).*(alpha*(1/m));


    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter,1) = computeCostMulti(X, y, theta);
    disp(J_history(iter))
end
theta =theta
J_history = J_history

end















