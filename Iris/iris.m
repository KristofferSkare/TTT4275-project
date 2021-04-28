x1all = load('class_1','-ascii');
x2all = load('class_2','-ascii');
x3all = load('class_3','-ascii');

train_first = 1;    % Set to 1 to use first 30 data points for training, set to 0 to use the last 30
M = length (x1all); % size of the data sets
N = 30;             % Training set size
n_test = M - N;     % Test set size
C = 3;              % Number of classes 
remove_most_overlapped = 1;          % Set to 1 to exclude the most overlapped feature 
remove_second_most_overlapped = 1;   % Set to 1 to exclude the second most overlapped feature 
remove_third_most_overlapped = 1;    % Set to 1 to exclude the third most overlapped feature 

if remove_third_most_overlapped
    x1all(:, 3) = [];
    x2all(:, 3) = [];
    x3all(:, 3) = [];
end
if remove_most_overlapped
    x1all(:, 2) = [];
    x2all(:, 2) = [];
    x3all(:, 2) = [];
end
if remove_second_most_overlapped
    x1all(:, 1) = [];
    x2all(:, 1) = [];
    x3all(:, 1) = [];
end

if train_first == 1
    x1_training = x1all(1:N, :);          % Training set for class 1
    x2_training = x2all(1:N, :);          % Training set for class 2
    x3_training = x3all(1:N, :);          % Training set for class 3
  
    x1_testing = x1all(N+1:end, :);      % Test set for class 1
    x2_testing = x2all(N+1:end, :);      % Test set for class 2
    x3_testing = x3all(N+1:end, :);      % Test set for class 3
else
    x1_training = x1all(n_test+1:end, :); % Training set for class 1
    x2_training = x2all(n_test+1:end, :); % Training set for class 2
    x3_training = x3all(n_test+1:end, :); % Training set for class 3

    x1_testing = x1all(1:n_test, :);      % Test set for class 1
    x2_testing = x2all(1:n_test, :);      % Test set for class 2
    x3_testing = x3all(1:n_test, :);      % Test set for class 3
end

X_training = [x1_training; x2_training; x3_training]; % Total training set
X_testing  = [x1_testing; x2_testing; x3_testing];    % Total testing set

D = size(X_training,2); % Input feature dimension
W0 = eye(C , D);        % Initial weighting matrix
w0 = ones(C, 1);        % Initial offset weight
W0 = [W0 w0];           % Weighting matrix
X = [X_training.'; ones(1 , size(X_training ,1))]; % Input data for training
T = [kron(ones(1,N), [1 0 0].') ...
    kron(ones(1,N), [0 1 0].') ...
    kron(ones(1,N), [0 0 1].')]; % Targets
sigmoid = @(x) (1./(1+ exp(-x)));

gk = @(xk ,W) sigmoid(W*xk);

%% Training
alpha = 0.01;       % learning rate
iterations = 2*1e4;	% Number of times to adjust the classifier

gradient = @(W) MSE_grad(X,T,W,gk); % MSE gradient
[W ,n] = gradient_descent(gradient,W0,alpha, iterations); % Trained weighting matrix W


%% Testing
Xtest=[X_testing'; ones(1 , size(X_testing ,1))]; % Test data
Ttest = [repelem(1, n_test ), repelem(2, n_test ) , repelem(3, n_test )]; % True solutions for test data
[~ , classified_classes ] = max(W*Xtest);   % Classes predixted from test data

% Finding error rate and confusion matrix for test data
error_test = classified_classes ~= Ttest ;
disp('Error rate from test set: ');
error_rate_test = sum(error_test)/length(error_test)

% Ploting confusion matrix for test data
figure(1)
confusion_test = confusionchart( Ttest , classified_classes );
confusion_test.Title = 'Confusion matrix for test set with last 20 data points, with 1 features, alpha = 0.01, iterations = 20000';
confusion_test.RowSummary = 'row-normalized';
confusion_test.ColumnSummary = 'column-normalized';

% Finding error rate and confusion matrix for training data
Ttraining = [repelem(1,N), repelem(2,N), repelem(3,N)]; % True solutions for training data
[~ ,classified_tclasses] = max(W*X);  % Classes predixted from training data

error_training = classified_tclasses~= Ttraining ;
disp('Error rate from training set: ');
error_rate_training = sum(error_training)/length(error_training)

% Ploting confusion matrix for training data
figure(2)
confusion_training = confusionchart(Ttraining , classified_tclasses );  
confusion_training.Title = 'Confusion matrix for training set with first 30 data points, with 1 features, alpha = 0.01, iterations = 20000';
confusion_training.RowSummary = 'row-normalized';
confusion_training.ColumnSummary = 'column-normalized';