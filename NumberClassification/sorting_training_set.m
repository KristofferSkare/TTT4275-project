load("data_all");
sorted_training_set = {};
count_per_class = zeros(1,10);

for i = 1:10
    sorted_training_set{i} = zeros(vec_size, 1);
end

for i = 1:num_train
    label = trainlab(i);
    count_per_class(label+1) =  count_per_class(label+1) + 1;
    sorted_training_set{label + 1}(:,count_per_class(label+1)) = trainv(i,:)'; 
end

save("sorted_trainv.mat", "sorted_training_set");