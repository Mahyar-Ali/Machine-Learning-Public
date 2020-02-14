function plotData(x, y)
%PLOTDATA Plots the data points x and y into a new figure 
%   PLOTDATA(x,y) plots the data points and gives the figure axes labels of
%   population and profit.

figure(1); % open a new figure window

% ====================== IMPLEMENTATION OF MAIN LOGIC ======================
% Instructions:  Assume the population and revenue data have been passed in
%                as the x and y arguments of this function.
%

    plot (x,y,'rx','MarkerSize',10)
    xlabel ('Population of city in 10,000s')
    ylabel ('Profit in $10,000s')
    hold




% ============================================================

end
