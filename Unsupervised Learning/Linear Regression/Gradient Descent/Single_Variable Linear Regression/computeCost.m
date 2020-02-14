function J = computeCost(X, y, theta)
    %   COMPUTECOST Compute cost for linear regression
    %   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
    %   parameter for linear regression to fit the data points in X and y
    %   Note : Instead of loops, I have used matrices, considering Vectorization.

    %   X : Dataset stored in form of a matrix,Each row in the matrix represents a particular training example while each column
    %   represents a particular Feature.
    %   y  : Matrix of outputs for each training example 
    % Initialize some useful values
    m = length(y); % number of training examples

    % J:Cost will return the cost for a particular Data Set 
    J = 0;

    % ====================== IMPLEMENTATION OF MAIN LOGIC ======================
    %               Compute the cost of a particular choice of theta
    %               You should set J to the cost.
    %To convert X and theta into a Cost function. Refer to my article published on Medium about this.Link can be found on my Profile.

    hypothesis_Function = X*theta  ;

    %Below line will create a matrix that will store the cost for each training example in a single column.

    squared_error_matrix = (hypothesis_Function - y).^2 ;%Take square of each individual cost. As mentioned in formula.

    %Sum the cost for all training examples.

    J = 1/(2*m)*sum(squared_error_matrix);

    % =========================================================================

end
