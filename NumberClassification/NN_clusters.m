load("data_all.mat");
load("clustered_data.mat");


template_set = trainv_clust(:,:);
test_set = testv(:,:);
% 
tic
D = dist(template_set, test_set');
[min_d, I] = min(D,[],1); 
label_result_clust = trainlab_clust(I);
toc
save("NN_result_clust.mat", "label_result_clust");

