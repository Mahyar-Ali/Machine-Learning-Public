function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

            
% You need to return the following values correctly
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost function and gradient for collaborative
%               filtering. Concretely, you should first implement the cost
%               function (without regularization) and make sure it is
%               matches our costs. After that, you should implement the 
%               gradient and use the checkCostFunction routine to check
%               that the gradient is correct. Finally, you should implement
%               regularization.
%
% Notes: X - num_movies  x num_features matrix of movie features
%        Theta - num_users  x num_features matrix of user features
%        Y - num_movies x num_users matrix of user ratings of movies
%        R - num_movies x num_users matrix, where R(i, j) = 1 if the 
%            i-th movie was rated by the j-th user
%
% You should set the following variables correctly:
%
%        X_grad - num_movies x num_features matrix, containing the 
%                 partial derivatives w.r.t. to each element of X
%        Theta_grad - num_users x num_features matrix, containing the 
%                     partial derivatives w.r.t. to each element of Theta

# for i=1:num_movies
 #     [temp users_that_rated_the_movie] =  find(R(i,:) == 1)
 #     Theta(users_that_rated_the_movie,:)'
 #     X(i,:)
 #     Y(i,users_that_rated_the_movie)
 #     J += [0.5*sum([X(i,:)*Theta(users_that_rated_the_movie,:)' - Y(i,users_that_rated_the_movie)].^2)]

%
temp1 = ((X*Theta')-Y);
temp = ((X*Theta')-Y).^2;
J=(1/2)*sum(sum(temp.*R))+(lambda/2)*sum(sum(Theta.^2,2))+(lambda/2)*sum(sum(X.^2,2));
% =============================================================
for i = 1:size(X,1)
[temp users_that_rated_the_movie] =  find(R(i,:) == 1);
Theta_i = Theta(users_that_rated_the_movie,:)';      %2*n
X_i = X(i,:) ;                                        %1*n   1*2 2*3
Y_i = Y(i,users_that_rated_the_movie);
X_grad(i,:) = (X_i*Theta_i-Y_i)*Theta(users_that_rated_the_movie,:) + lambda*X(i,:);
end
for i=1:size(Theta,1)
[movies_rated_by_the_user temp] =  find(R(:,i) == 1)  ;%val = 5
Theta_i = Theta(i,:)'                                  ;%1*n
X_i = X(movies_rated_by_the_user,:)                    ;%5*n
Y_i = Y(movies_rated_by_the_user,i)                    ;%5*1
Theta_grad(i,:) = (X_i*Theta_i-Y_i)'*X(movies_rated_by_the_user,:) + lambda*Theta(i,:) ;%5*n n*1  --> 5*1 5*1--> 5*1 5*n              1*n
end

grad = [X_grad(:); Theta_grad(:)];
 



end

 
    











