x1all = load('class_1','-ascii');
x2all = load('class_2','-ascii');
x3all = load('class_3','-ascii');


figure(1)
histogram(x1all(:,1), 10);
hold on
histogram(x2all(:,1), 10);
hold on
histogram(x3all(:,1), 10);
legend('Setosa', 'Versicolor', 'Virginica', 'FontSize', 16)
xlabel('Sepal length in cm', 'FontSize', 24)
ylabel('Count', 'FontSize', 24)
%title('Histogram of sepal length for the different classes', 'FontSize', 24)
hold off

figure(2)
histogram(x1all(:,2),  10);
hold on
histogram(x2all(:,2), 10);
hold on
histogram(x3all(:,2), 10);
legend('Setosa', 'Versicolor', 'Virginica', 'FontSize', 16)
xlabel('Sepal width in cm', 'FontSize', 24)
ylabel('Count', 'FontSize', 24)
%title('Histogram of sepal width for the different classes', 'FontSize', 24)
hold off

figure(3)
histogram(x1all(:,3), 10);
hold on
histogram(x2all(:,3), 10);
hold on
histogram(x3all(:,3), 10);
legend('Setosa', 'Versicolor', 'Virginica', 'FontSize', 16)
xlabel('Petal length in cm', 'FontSize', 24)
ylabel('Count', 'FontSize', 24)
%title('Histogram of petal length for the different classes', 'FontSize', 24)
hold off

figure(4)
histogram(x1all(:,4), 10);
hold on
histogram(x2all(:,4), 10);
hold on
histogram(x3all(:,4), 10);
legend('Setosa', 'Versicolor', 'Virginica', 'FontSize', 16)
xlabel('Petal width in cm', 'FontSize', 24)
ylabel('Count', 'FontSize', 24)
%title('Histogram of petal width for the different classes', 'FontSize', 24)
hold off