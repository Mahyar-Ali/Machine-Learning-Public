function g = sigmoid(z)
%SIGMOID Compute sigmoid function
%   g = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z));

% ====================== Main Logic ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).

one = ones (size(z,1),size(z,2));
g = one ./(1+exp(-z));

%=======================For Reference============================
%for iter = 1 : length(z)
%   g(iter) = 1/(1+exp(z(iter)))
%end



% =============================================================

end
