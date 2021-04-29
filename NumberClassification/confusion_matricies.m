load('data_all.mat');
load('NN_result.mat');
%load('NN_result_clust.mat');
%load('KNN_result_clust');

figure(1)
confution_test = confusionchart(testlab, label_results);
confusion_test.RowSummary = 'row-normalized';
confusion_test.ColumnSummary = 'column-normalized';
%input('');





