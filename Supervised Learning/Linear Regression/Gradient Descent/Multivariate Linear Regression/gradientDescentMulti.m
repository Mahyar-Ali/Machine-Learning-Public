function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
    %   COMPUTECOST Compute cost for linear regression
    %   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
    %   parameter for linear regression to fit the data points in X and y
    %   Note : Instead of loops, I have used matrices, considering Vectorization.

    %   X : Dataset stored in form of a matrix,Each row in the matrix represents a particular training example while each column
    %   represents a particular Feature.
    %   y  : Matrix of outputs for each training example 
        % Initialize some useful values
    m = length(y); % number of training examples

    J_history = zeros(num_iters, 1);
    number_of_features = size (X,2);

    for iter = 1:num_iters

            % ====================== IMPLEMENTATION OF MAIN LOGIC ======================
            % Instructions: Perform a single gradient step on the parameter vector
            %               theta. 
            %
            % Hint: While debugging, it can be useful to print out the values
            %       of the cost function (computeCostMulti) and gradient here.
            %Both the hypothesis function and cost are combined inone.Refer to Gradient Descent for single Variable.
              cost_matrix = (X*theta-y) ;
            
            %===============Important: Detail about it can be found in my article on Medium. Link in Profile[github]=====================
            
            %Implementation of the summation part in Gradiend Descent Formula.
              partial_derivatives_matrix = X'*cost_matrix;
              
              %Calculate all the thetas and store them in a matrix.
              
              theta = theta - partial_derivatives_matrix.*(alpha*(1/m));


            % ============================================================

            % Save the cost J in every iteration    
            J_history(iter,1) = computeCostMulti(X, y, theta);
            disp(J_history(iter))
    end

theta =theta
J_history = J_history

end
