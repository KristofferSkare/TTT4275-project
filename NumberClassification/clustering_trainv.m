load('data_all.mat');

M = 64;
sorted_training_set = {};
count_per_class = zeros(1,10);
trainv_clust = zeros(M*10, vec_size);
trainlab_clust = zeros(M*10,1);

for i = 1:num_train
    label = trainlab(i);
    count_per_class(label+1) =  count_per_class(label+1) + 1;
    sorted_training_set{label + 1}(:,count_per_class(label+1)) = trainv(i,:)'; 
end


for i = 1:10
    [idx, C] = kmeans(sorted_training_set{i}', M);
    trainv_clust((i-1)*M +1:i*M, :) = C;
    trainlab_clust((i-1)*M +1:i*M) = (i-1)*ones(M,1);
end

save('clustered_data.mat', 'trainv_clust','trainlab_clust');
