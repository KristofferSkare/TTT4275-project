sorted_trainv = load("sorted_trainv.mat");
sorted_trainv = sorted_trainv.sorted_training_set;
load("data_all.mat");

M = 64;
clusters = {};
for i = 1:10
[idx, C] = kmeans(sorted_trainv{i}', M);
clusters{i} = C';
end

save("clusters.mat", "clusters");

trainv_clust = zeros(M*10, vec_size);
trainlab_clust = zeros(M*10,1);

for i = 1:10
    trainv_clust((i-1)*M +1:i*M, :) = clusters{i}';
    trainlab_clust((i-1)*M +1:i*M) = (i-1)*ones(M,1);
end

save("clustered_data.mat", "trainv_clust","trainlab_clust");
