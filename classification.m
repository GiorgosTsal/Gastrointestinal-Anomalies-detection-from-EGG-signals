clear; close all; clc;

load('calculated_features.mat')
tmp  = {clc_feat.name};
str = tmp{1,1};
name = convertStringsToChars(str);

y = zeros(1, length(name)); % Preallocation for better performance
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

%X = normalize(X);
%X = (X - min(X))/(max(X) - min(X));

per = 0.65; 
rand_num = randperm(size(X,1));
X_train = X(rand_num(1:round(per*length(rand_num))),:);
y_train = y(rand_num(1:round(per*length(rand_num))),:);

X_test = X(rand_num(round(per*length(rand_num))+1:end),:);
y_test = y(rand_num(round(per*length(rand_num))+1:end),:);
%% CV partition

c = cvpartition(y_train,'k',5);
%% feature selection
nfeat = 10;
opts = statset('display','iter');
classf = @(train_data, train_labels, test_data, test_labels)...
    sum(predict(fitcsvm(train_data, train_labels,'KernelFunction','rbf'), test_data) ~= test_labels); % how wrong the prediction was

 [fs, history] = sequentialfs(classf, X_train, y_train, 'cv', c, 'options', opts,'nfeatures', nfeat);

% [fs, history] = sequentialfs(classf, X_train, y_train, 'cv', c, ...
% 'options', opts); %  % should stop when a local minimum of the criterion is found.
%% Best hyperparameter

X_train_w_best_feature = X_train(:,fs);

Md1 = fitcsvm(X_train_w_best_feature,y_train,'KernelFunction','rbf','OptimizeHyperparameters','auto',...
      'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName',...
      'expected-improvement-plus','ShowPlots',true)); % Bayes' Optimization 
%% %% Evaluate model, final test with test set
X_test_w_best_feature = X_test(:,fs);
yhat =  predict(Md1,X_test_w_best_feature);
test_accuracy_for_iter = sum(yhat == y_test)/length(y_test)*100;
disp("Test accuracy:" + test_accuracy_for_iter);

cm = confusionmat(y_test,yhat); % confusion matrix
figure;
confusionchart(cm);


% %% PCA
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
% %% descision trees
% 
% Mdl = fitctree(X_train,y_train);
% 
% yhat =  predict(Mdl,X_test);
% test_accuracy_for_iter = sum(yhat == y_test)/length(y_test)*100;
% disp("Test accuracy:" + test_accuracy_for_iter);
% 
% cm = confusionmat(y_test,yhat); % confusion matrix
% figure;
% confusionchart(cm);

% %% hyperplane
% figure;
% hgscatter = gscatter(X_train_w_best_feature(:,1),X_train_w_best_feature(:,2),y_train);
% hold on;
% h_sv=plot(Md1.SupportVectors(:,1),Md1.SupportVectors(:,2),'ko','markersize',8);
% 
% 
% % test setdata
% gscatter(X_test_w_best_feature(:,1),X_test_w_best_feature(:,2),y_test,'rb','xx')
% 
% % decision plane
% XLIMs = get(gca,'xlim');
% YLIMs = get(gca,'ylim');
% [xi,yi] = meshgrid([XLIMs(1):0.01:XLIMs(2)],[YLIMs(1):0.01:YLIMs(2)]);
% dd = [xi(:), yi(:)];
% pred_mesh = predict(Md1, dd);
% redcolor = [1, 0.7, 0.7];
% bluecolor = [0.7, 0.7, 1];
% pos = find(pred_mesh == 1);
% h1 = plot(dd(pos,1), dd(pos,2),'s','color',redcolor,'Markersize',5,'MarkerEdgeColor',redcolor,'MarkerFaceColor',redcolor);
% pos = find(pred_mesh == 2);
% h2 = plot(dd(pos,1), dd(pos,2),'s','color',bluecolor,'Markersize',5,'MarkerEdgeColor',bluecolor,'MarkerFaceColor',bluecolor);
% uistack(h1,'bottom');
% uistack(h2,'bottom');
% legend([hgscatter;h_sv],{'Normal','Parkinson Disease','support vectors'})