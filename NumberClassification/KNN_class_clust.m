load("data_all.mat");
load("clustered_data.mat");
k = 7;

template_set = trainv_clust(:,:);
test_set = testv(:,:);
tic
D = dist(template_set, test_set');
[min_d, I] = mink(D,k,1); 
label_result_knn = zeros(num_test,1);
for i = 1:num_test
   label_result_knn(i) = mode(trainlab_clust( I(:,i)));
end
toc

save("KNN_result_clust.mat", "label_result_knn");