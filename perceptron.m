function w = perceptron(w0, X, Y)
%Perceptron algorithm
%   w0 is the initial weight vector (d * 1)
%   X is feature values of training examples (d * n)
%   Y is labels of training examples (1 * n)

[d,n] = size(X);
maxiter = 100;
stop_criteria = 1;

% WEIGHTING vector "w" initialized to zeros. 
w = w0;

% PREDICTION vector "y_hat" initialized to zeros. 
y_hat = zeros(1,n);
y_hat_prev = y_hat;

for k = 1:maxiter

for j = 1:n
    x=X(:,j);
   [pred] = perceptron_pred(w,x);
   if(pred ~= Y(j))
    if( Y(j) == 1)
       w = w + x;
     elseif (Y(j) == -1)
       w = w - x;
     else 
      w = w;
      end
    end

 end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    eps = sum(y_hat == y_hat_prev) / length(y_hat);
    fprintf('%21d %20g\n', k, eps);
    if eps >= stop_criteria
        break;
    end
    y_hat_prev = y_hat;
    
end
