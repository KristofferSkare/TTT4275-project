

load("NN_result.mat");
load("data_all.mat");

miss_class_indecies = [];
corr_class_indecies = [];

for i = 1:num_test
    if label_results(i) ~= testlab(i)
       miss_class_indecies(length(miss_class_indecies) + 1) = i;
    else
         corr_class_indecies(length(corr_class_indecies) + 1) = i;
    end
end

%% Plot miss classified images

for i = miss_class_indecies
     x = zeros(row_size, col_size); x(:) = testv(i,:);
    image(x);
    title("Is: " + testlab(i) + " classified as: " + label_results(i))
    input("");
end 

%% Plott correctly classified images

for i = corr_class_indecies
     x = zeros(row_size, col_size); x(:) = testv(i,:);
    image(x);
    title("Is: " + testlab(i) + " classified as: " + label_results(i))
    input("");
end 



