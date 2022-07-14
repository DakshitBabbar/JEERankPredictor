% work in the directory where the data is present
clear;
close all;

%%=======================%%

% loading data from data.txt and normalize using normalise.m
fprintf('Loading data:\n\n');
data = load('data.txt');
testdata = load('data2.txt');
deg = 15;
expdata = mapfeature(data(:,1), deg);
X = [expdata data(:,2)];
y = data(:,3);
m = length(y);
[normx mu sgm] = normalise(X);
X = [ones(m,1) X];
normx = [ones(m,1) normx];

fprintf('Data loaded succesfully, now plotting data:\n');
fprintf('Press Enter to continue\n\n')
pause;
figure;
plot(X(:,2), y, 'rx', 'MarkerSize', 6);
xlabel('Marks out of 360');
ylabel('Rank');
legend('Training Examples');
fprintf('Data plotted succesfully, now defining model:\n');
fprintf('Press Enter to continue:\n\n')
pause;

%%=======================%%

% defining model using hypo.m
theta = zeros(size(X,2), 1);
h = hypo((normx(1,:))', theta); %')
fprintf('Value for the first training example with theta = [0;0;...;0] is: %f\n', h);
fprintf('Model defined successfuly, now defining cost function:\n');
fprintf('Press Enter to continue\n\n');
pause;

%%=======================%%

% defining cost function using costfunc.m
j = costfunc(normx, y, theta);
fprintf('Value for the cost fucntion with theta = [0;0;0] is: %f\n', j);
fprintf('Cost Function defined successfuly, now performing gradient descent:\n');
fprintf('Press Enter to continue\n\n');
pause;

%%=======================%%

% performing gradient descent using gradDesc.m
alpha = 0.07;
numIter = 1000;
[theta, jHist] = gradDesc(normx, y, theta, alpha, numIter);
fprintf('*************Data from Gradient Descent**************\n');
%fprintf('Optimum value of theta is: %f\n', theta);
fprintf('gradient decsent perfomed succesfuly, now plotting J History:\n');
fprintf('Press Enter to continue\n\n');
pause;

% plotting j history;
figure;
plot((1:numIter)', jHist); %')
fprintf('Plotted J history succesfuly, now plotting fit hypothesis:\n');
fprintf('Press Enter to continue\n\n');
pause;

% plot fit hypothesis
figure(1);
hold on;
plot(X(:,2), normx*theta, 'c-');
legend('Training Examples', 'Linear Regression');
fprintf('Hypothesis plotted succesfuly, now predicting rank for marks = 216 in year 2021:\n');
fprintf('Press Enter to continue\n\n');
pause;

% predict rank for marks = 216 in year 2020
expx = mapfeature(216, deg);
x = [expx 285];
nx = (x - mu)./sgm;
nx = [1 nx];
rank = hypo((nx)', theta); %')
fprintf('Rank for marks = 216 in year 2021 is: %f\n', rank);
plot(x(1), rank, 'cx', 'MarkerSize', 10);
legend('Training Examples', 'Linear Regression (GD)', 'Required Prediction');
fprintf('Rank predicted successfuly, now calculating Training RMSE\n');
fprintf('Press Enter to continue\n\n');
pause;

%calculating RMSE percentage
%mep = ((mean(abs((normx*theta) - y)))/mean(y))*100;
rmse = sqrt(mean(((normx*theta) - y).^2));
meny = mean(y);
fprintf('The Training RMSE is %f %%\n', (rmse/meny)*100);
fprintf('Now calculating Testing RMSE\n');
fprintf('Press Enter to continue\n\n');
pause;

testexpdata = mapfeature(testdata(:,1), deg);
testX = [testexpdata testdata(:,2)];
testy = testdata(:,3);
testm = length(testy);
testnormx = (testX - mu)./sgm;
testnormx = [ones(testm,1) testnormx];
testrmse = sqrt(mean(((testnormx*theta) - testy).^2));
testmeny = mean(testy);
fprintf('The Testing RMSE is %f %%\n', (testrmse/testmeny)*100);










