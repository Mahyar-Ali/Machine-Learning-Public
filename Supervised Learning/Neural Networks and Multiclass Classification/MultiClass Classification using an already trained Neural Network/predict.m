function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels_1 = size(Theta1, 1);
num_labels_2 = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);
X = [ones(m, 1) X];

% To compute values of each neuron in the hidden layer.
z = X*Theta1';
one = ones (size(X,1),num_labels_1);
sigmoid_1 = one./(1+exp(-z));

%To compute sigmoid the final weight of each neuron in the last layer w.r.t each training example
sigmoid_1 = [ones(size(sigmoid_1,1),1) sigmoid_1]
 size(sigmoid_1);
 X = [ones(m, 1) X];
 z = sigmoid_1*Theta2';
 one = ones (size(sigmoid_1,1),num_labels_2);
 sigmoid_2 = one./(1+exp(-z));

%=================================================================================
  % return the index of those element in each row which has the largest probability.
         [temp p] = max(sigmoid_2,[],2);
%=================================================================================         
end
