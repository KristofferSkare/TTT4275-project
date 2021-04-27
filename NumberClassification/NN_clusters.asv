load('data_all.mat');
load('clustered_data.mat');

D = dist(trainv_clust, testv');
[min_d, I] = min(D,[],1); 
label_result_clust = trainlab_clust(I);

save('NN_result_clust.mat', 'label_result_clust');