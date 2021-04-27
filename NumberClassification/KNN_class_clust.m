load('data_all.mat');
load('clustered_data.mat');

K = 7;

D = dist(trainv_clust, testv');
[min_d, I] = mink(D,K,1); 
label_result_knn = zeros(num_test,1);

for i = 1:num_test
   labels = trainlab_clust(I(:,i)); % The labels of the K closest template vectors in order of ascending distance 
   [M,F,C] = mode(labels);
   if length(C{1})== 1 % If the plurality "vote" has a clear winner
        label_result_knn(i) = M; 
   else % There is several labels that are equally frequent
       found_label = false;
       for j = 1:K
           if found_label
                break;
           end
           for m = 1:length(C{1})   
               if found_label
                    break;
               end
                if labels(j) == C{1}(m)
                    label_result_knn(i) = C{1}(m); % Finding which label of the labels in C that comes first in labels
                    found_label = true;
                end
           end
       end
   end
end

save('KNN_result_clust.mat', 'label_result_knn');