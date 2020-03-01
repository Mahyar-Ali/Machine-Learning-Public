function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha
%   X : Dataset stored in form of a matrix,Each row in the matrix represents a particular training example while each column
%   represents a particular Feature.
%   y  : Matrix of outputs for each training example 
%   num_iters : Number of iterations for the loop.
% Initialize some useful values
m = length(y); % number of training examples

%To store how the value of J changes with each iteration to select learning rate.
J_history = zeros(num_iters, 1);

    for iter = 1:num_iters

            % ====================== IMPLEMENTATION OF MAIN LOGIC ======================
            %
            % Hint: While debugging, it can be useful to print out the values
            %       of the cost function (computeCost) and gradient here.
            
            % To convert X and theta into a Cost function. [Refer to my article published on Medium about this. Link can be found on my Profile.]
            hypothesis_Function = X*theta  ;
            
            % Below line will create a matrix that will store the cost for each training example in a single column.
            squared_error_matrix = (hypothesis_Function - y);
            
            %===============INCREMENT VALUES OF THETA0 AND THETA1 SIMULTANEOUSLY============

                temp1 = theta(1,1) - alpha*(1/m)*sum(squared_error_matrix); %Implementation of Formula for finding theta0 after taking Partial Derivative.
                
                squared_error_matrix = (hypothesis_Function - y).*X(:,2);%This is because you need to multiply each training example with X(i,2)
                
                temp2 = theta(2,1) - alpha*(1/m)*sum(squared_error_matrix);%Implementation of Formula for finding theta0 after taking Partial Derivative.
                
                theta(1,1) = temp1;
                theta(2,1) = temp2;

            % ============================================================

            % Save the cost J in every iteration    
            J_history(iter) = computeCost(X, y, theta);
            
            disp(J_history(iter))

    end
end
