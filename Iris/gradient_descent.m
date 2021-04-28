function [W,m]=gradient_descent(gradient,W0,alpha, iterations)
% alpha: learning rate
% gradient: output from MSE_grad
% W0: initial weighting matrix
    W = W0 ;
    m = 1;
    while m < iterations
        mse_grad = gradient(W);
        W = W - alpha*mse_grad ;
        m = m + 1;
    end
end