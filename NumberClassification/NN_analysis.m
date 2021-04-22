
load("NN_result.mat");
load("data_all.mat");

conf_mat = zeros(10);
for j = 1:num_test
   conf_mat(label_results(j)+1,testlab(j) + 1) =  conf_mat(label_results(j)+1,testlab(j) + 1) + 1;
end
error_rate = 1 - trace(conf_mat)/num_test;

