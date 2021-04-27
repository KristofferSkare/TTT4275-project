load('data_all.mat');
chunk_size = 1000;
num_chunks = num_train/chunk_size;

label_results = zeros(num_test,1);
distances = zeros(num_test,num_chunks);
indices = zeros(num_test,num_chunks);

for j = 1:num_chunks

template_set = trainv((j-1)*chunk_size + 1: j*chunk_size,:);

D = dist(template_set, testv');
[min_d, I] = min(D,[],1);

distances(:,j) = min_d';
indices(:,j) = I';
end

[global_min, global_I] = min(distances, [],2);

for i = 1:N 
    chunk_num = global_I(i);
    label_results(i) = trainlab(indices(i, chunk_num) + chunk_size*(chunk_num - 1));
end

save("NN_result.mat", "label_results");

