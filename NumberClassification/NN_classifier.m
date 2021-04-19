
k = 1;
N = 1;
%chunk_size = 1000;
num_lab = 10;

data_set = trainv(:,:);
label_results = zeros(N,3);

for j = 1:N
test_point = testv(j,:)';

D = dist(data_set, test_point); % Finding distance between data_set and the point
[min_d, I] = mink(D,k); %Finding the indexes of the k smallest distances

label_count = zeros(num_lab,1);

for i = I
    label_count(trainlab(i) + 1) = label_count(trainlab(i)+ 1) + 1; % Counting the labels of the training data with least distance
end

[max_lab_count, lab_res] = max(label_count); % Checking the label "vote"
lab_res = lab_res - 1;

label_results(j,:) = [testlab(j);lab_res; j]; % Saving result
end


% %% Plotting an image:
for i = 1:N
    if label_results(i,1) == label_results(i,2)
        x = zeros(row_size, col_size); x(:) = trainv(label_results(i,3),:);
        image(x);
        title("")
        input("Is: " + label_results(i,1) + " classified as: " + label_results(i,2));
    end
end