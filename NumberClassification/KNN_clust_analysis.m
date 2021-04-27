
load('KNN_result_clust.mat');
load('data_all.mat');

conf_mat = zeros(10);
for j = 1:num_test
   conf_mat(testlab(j) + 1,label_result_knn(j)+1) =  conf_mat(testlab(j) + 1,label_result_knn(j)+1) + 1;
end
error_rate = 1 - trace(conf_mat)/num_test;

string = "";
for i = 1:10
    for j = 1:10
        string = string + conf_mat(i,j);
        if j ~= 10
            string = string + "&";
        end
    end
    string = string + "\\";
end

