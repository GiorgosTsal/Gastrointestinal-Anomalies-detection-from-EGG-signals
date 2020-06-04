clear; close all; clc;

load('calculated_features.mat')
tmp  = {clc_feat.name};
str = tmp{1,1};
name = convertStringsToChars(str);

y = zeros(1, length(name)); % target variable
%% enumerate classes, 1 = "Normal", 2 = "Parkinson", create target vector
for i = 1:length(name) 
    str = name{i};
    n_pattern = "n";
    if startsWith(str,n_pattern) == 1
        name{i} = "Normal";
        y(i) = 1;
    else 
        name{i} = "Parkinson";
        y(i) = 2;
    end  
end 
%% Create feature vector
% mesi timi tis kiriarxis energias
avg_power =  {clc_feat.avg_power};
avg_power = avg_power{1,1};

% typiki apoklisi tis kuriarxis energeias
std_power =  {clc_feat.std_power};
std_power = std_power{1,1};

% mesi timi tis kiriarxis sixnotitas
avg_main_freq =  {clc_feat.avg_main_freq};
avg_main_freq = avg_main_freq{1,1};

% typiki apoklisi tis kiriarxis sixnotitas
std_freq =  {clc_feat.std_freq};
std_freq = std_freq{1,1};

% logos tis kuriarxis energeias prin k meta to fagito
main_power_ratio =  {clc_feat.main_power_ratio};
main_power_ratio = main_power_ratio{1,1};

% synoliki kuriarxi energia
total_max_power =  {clc_feat.total_max_power};
total_max_power = total_max_power{1,1};

% synoliki kuriarxi suxnotita
total_main_freq =  {clc_feat.total_main_freq};
total_main_freq = total_main_freq{1,1};

% pososta emfanisis leitourgion stomaxou
% pososta katigorion - kathe pososto leitourgias stomaxou ena feature
for p = 1:length(clc_feat.stomach_operations(:,:,:)) 
    idx = 0;
    for i = 1:length(clc_feat.stomach_operations(:,:,1))
        idx = idx + 1;
        stomach_operations_per(idx, p) = clc_feat.stomach_operations(i,1,p)'; % pososta leitourgias after 
        idx = idx +1;
        stomach_operations_per(idx, p) = clc_feat.stomach_operations(i,2,p)'; % pososta leitourgias before 
    end
end

% mesi timi tou logou tis energeias se 4 diastimata
for p = 1:length(clc_feat.mean_band_powers(:,:,:)) 
    idx = 0;
    for i = 1:length(clc_feat.mean_band_powers(:,:,1))
        idx = idx + 1;
        mean_band_power(idx, p) = clc_feat.mean_band_powers(i,1,p)'; % pososta leitourgias after 
        idx = idx +1;
        mean_band_power(idx, p) = clc_feat.mean_band_powers(i,2,p)'; % pososta leitourgias before 
    end
end

% tupiki apoklisi tou logou tis energeias se 4 diastimata
for p = 1:length(clc_feat.std_band_powers(:,:,:)) 
    idx = 0;
    for i = 1:length(clc_feat.std_band_powers(:,:,1))
        idx = idx + 1;
        std_band_power(idx, p) = clc_feat.std_band_powers(i,1,p)'; % pososta leitourgias after 
        idx = idx +1;
        std_band_power(idx, p) = clc_feat.std_band_powers(i,2,p)'; % pososta leitourgias before 
    end
end

% merge all features into x 
X = [avg_power; std_power; avg_main_freq; std_freq; main_power_ratio; total_max_power;
    total_main_freq; stomach_operations_per;mean_band_power; std_band_power ];

X = X';
y = y';
%% Split into train and test 
per = 0.65; 
rand_num = randperm(size(X,1));
X_train = X(rand_num(1:round(per*length(rand_num))),:);
y_train = y(rand_num(1:round(per*length(rand_num))),:);

X_test = X(rand_num(round(per*length(rand_num))+1:end),:);
y_test = y(rand_num(round(per*length(rand_num))+1:end),:);
%% Cross Validation partition
c = cvpartition(y_train,'k',4);
%% ---------------Feature selection---------------
%% with sequentialfs and criterion how wrong the prediction was
% nfeat = 2;
opts = statset('display','iter');
classf = @(train_data, train_labels, test_data, test_labels)...
    sum(predict(fitcsvm(train_data, train_labels,'KernelFunction','rbf'), test_data) ~= test_labels); % how wrong the prediction was

% uncomment this line for custom n feature selection and nfeat
%  [fs, history] = sequentialfs(classf, X_train, y_train, 'cv', c, 'options', opts,'nfeatures', nfeat);

[fs, history] = sequentialfs(classf, X_train, y_train, 'cv', c, ...
'options', opts); %  % should stop when a local minimum of the criterion is found.

X_train_w_best_feature = X_train(:,fs);
%% PCA - uncomment for this way of feature selection
% 
% nfeat =4;
% [COEFF, SCORE, LATENT, TSQUARED, EXPLAINED, MU] = pca(X_train)
% [out,idx] = sort(MU, 'descend');
% disp("======================");
% disp(out);
% disp(idx);
% for i= 1:nfeat
%     X_train_new(:,i) = X_train(:,idx(i));
%      X_test_new(:,i) = X_test(:,idx(i));
% end
% X_train = X_train_new;
% X_test = X_test_new;
%% Custom selection
% X_train_w_best_feature = X_train(:,5);
%% Best hyperparameter
Md1 = fitcsvm(X_train_w_best_feature,y_train,'KernelFunction','rbf','OptimizeHyperparameters','all',...
      'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName',...
      'expected-improvement-plus','ShowPlots',true)); % Bayes' Optimization 
%% %% Evaluate model, final test with test set
X_test_w_best_feature = X_test(:,fs);
yhat =  predict(Md1,X_test_w_best_feature);
test_accuracy_for_iter_svm = sum(yhat == y_test)/length(y_test)*100;
disp("SVM test accuracy:" + test_accuracy_for_iter_svm);

cm = confusionmat(y_test,yhat); % confusion matrix
figure('NumberTitle', 'off', 'Name', 'SVM Confusion matrix');
confusionchart(cm);
%% Descision trees
Mdl = fitctree(X_train,y_train);

yhat1 =  predict(Mdl,X_test);
test_accuracy_for_iter_dt = sum(yhat1 == y_test)/length(y_test)*100;
disp("Descision trees test accuracy:" + test_accuracy_for_iter_dt);

cm = confusionmat(y_test,yhat1); % confusion matrix
figure('NumberTitle', 'off', 'Name', 'Descition Tree Confusion matrix');
confusionchart(cm% figure;);