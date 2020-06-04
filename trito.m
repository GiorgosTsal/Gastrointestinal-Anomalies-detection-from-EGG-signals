clear all;
load calculated_features.mat
p=ones(1,39);
h=ones(1,39);
%1
i=1;
[p(i),h(i)] = ranksum(clc_feat.avg_power(1,1:7),clc_feat.avg_power(1,8:14),'alpha',0.01);
%2
i=i+1;
[p(i),h(i)] = ranksum(clc_feat.avg_power(2,1:7),clc_feat.avg_power(2,8:14),'alpha',0.01);
%3
i=i+1;
[p(i),h(i)] = ranksum(clc_feat.std_power(1,1:7),clc_feat.std_power(1,8:14),'alpha',0.01);
%4
i=i+1;
[p(i),h(i)] = ranksum(clc_feat.std_power(2,1:7),clc_feat.std_power(2,8:14),'alpha',0.01);
%5
i=i+1;
[p(i),h(i)] = ranksum(clc_feat.main_power_ratio(1,1:7),clc_feat.main_power_ratio(1,8:14),'alpha',0.01);
%6 
stomach_operation_before_food=reshape(clc_feat.stomach_operations(1,1,:),[],1);
i=i+1;
[p(i),h(i)]  = ranksum(stomach_operation_before_food(1:7),stomach_operation_before_food(8:14),'alpha',0.01);
%7
stomach_operation_before_food=reshape(clc_feat.stomach_operations(2,1,:),[],1);
i=i+1;
[p(i),h(i)]  = ranksum(stomach_operation_before_food(1:7),stomach_operation_before_food(8:14),'alpha',0.01);
%8
stomach_operation_before_food=reshape(clc_feat.stomach_operations(3,1,:),[],1);
i=i+1;
[p(i),h(i)]  = ranksum(stomach_operation_before_food(1:7),stomach_operation_before_food(8:14),'alpha',0.01);
%9
stomach_operation_before_food=reshape(clc_feat.stomach_operations(4,1,:),[],1);
i=i+1;
[p(i),h(i)]  = ranksum(stomach_operation_before_food(1:7),stomach_operation_before_food(8:14),'alpha',0.01);
%10
stomach_operation_before_food=reshape(clc_feat.stomach_operations(5,1,:),[],1);
i=i+1;
[p(i),h(i)]  = ranksum(stomach_operation_before_food(1:7),stomach_operation_before_food(8:14),'alpha',0.01);
%11
stomach_operation_after_food=reshape(clc_feat.stomach_operations(1,2,:),[],1);
i=i+1;
[p(i),h(i)] = ranksum(stomach_operation_after_food(1:7),stomach_operation_after_food(8:14),'alpha',0.01);
%12
stomach_operation_after_food=reshape(clc_feat.stomach_operations(2,2,:),[],1);
i=i+1;
[p(i),h(i)] = ranksum(stomach_operation_after_food(1:7),stomach_operation_after_food(8:14),'alpha',0.01);
%13
stomach_operation_after_food=reshape(clc_feat.stomach_operations(3,2,:),[],1);
i=i+1;
[p(i),h(i)] = ranksum(stomach_operation_after_food(1:7),stomach_operation_after_food(8:14),'alpha',0.01);
%14
stomach_operation_after_food=reshape(clc_feat.stomach_operations(4,2,:),[],1);
i=i+1;
[p(i),h(i)] = ranksum(stomach_operation_after_food(1:7),stomach_operation_after_food(8:14),'alpha',0.01);
%15
stomach_operation_after_food=reshape(clc_feat.stomach_operations(5,2,:),[],1);
i=i+1;
[p(i),h(i)] = ranksum(stomach_operation_after_food(1:7),stomach_operation_after_food(8:14),'alpha',0.01);
%16
mbpb=reshape(clc_feat.mean_band_powers(1,1,:),[],1);
i=i+1;
[p(i),h(i)] = ranksum(mbpb(1:7),mbpb(8:14),'alpha',0.01);
%17
mbpb=reshape(clc_feat.mean_band_powers(2,1,:),[],1);
i=i+1;
[p(i),h(i)] = ranksum(mbpb(1:7),mbpb(8:14),'alpha',0.01);
%18
mbpb=reshape(clc_feat.mean_band_powers(3,1,:),[],1);
i=i+1;
[p(i),h(i)] = ranksum(mbpb(1:7),mbpb(8:14),'alpha',0.01);
%19
mbpb=reshape(clc_feat.mean_band_powers(4,1,:),[],1);
i=i+1;
[p(i),h(i)] = ranksum(mbpb(1:7),mbpb(8:14),'alpha',0.01);
%20
mbpb=reshape(clc_feat.mean_band_powers(1,2,:),[],1);
i=i+1;
[p(i),h(i)] = ranksum(mbpb(1:7),mbpb(8:14),'alpha',0.01);
%21
mbpb=reshape(clc_feat.mean_band_powers(2,2,:),[],1);
i=i+1;
[p(i),h(i)] = ranksum(mbpb(1:7),mbpb(8:14),'alpha',0.01);
%22
mbpb=reshape(clc_feat.mean_band_powers(3,2,:),[],1);
i=i+1;
[p(i),h(i)] = ranksum(mbpb(1:7),mbpb(8:14),'alpha',0.01);
%23
mbpb=reshape(clc_feat.mean_band_powers(4,2,:),[],1);
i=i+1;
[p(i),h(i)] = ranksum(mbpb(1:7),mbpb(8:14),'alpha',0.01);
%24
mbpa=reshape(clc_feat.std_band_powers(1,1,:),[],1);
i=i+1;
[p(i),h(i)] = ranksum(mbpa(1:7),mbpa(8:14),'alpha',0.01);
%25
mbpa=reshape(clc_feat.std_band_powers(2,1,:),[],1);
i=i+1;
[p(i),h(i)] = ranksum(mbpa(1:7),mbpa(8:14),'alpha',0.01);
%26
mbpa=reshape(clc_feat.std_band_powers(3,1,:),[],1);
i=i+1;
[p(i),h(i)] = ranksum(mbpa(1:7),mbpa(8:14),'alpha',0.01);
%27
mbpa=reshape(clc_feat.std_band_powers(4,1,:),[],1);
i=i+1;
[p(i),h(i)] = ranksum(mbpa(1:7),mbpa(8:14),'alpha',0.01);
%28
mbpa=reshape(clc_feat.std_band_powers(1,2,:),[],1);
i=i+1;
[p(i),h(i)] = ranksum(mbpa(1:7),mbpa(8:14),'alpha',0.01);
%29
mbpa=reshape(clc_feat.std_band_powers(2,2,:),[],1);
i=i+1;
[p(i),h(i)] = ranksum(mbpa(1:7),mbpa(8:14),'alpha',0.01);
%30
mbpa=reshape(clc_feat.std_band_powers(3,2,:),[],1);
i=i+1;
[p(i),h(i)] = ranksum(mbpa(1:7),mbpa(8:14),'alpha',0.01);
%31
mbpa=reshape(clc_feat.std_band_powers(4,2,:),[],1);
i=i+1;
[p(i),h(i)] = ranksum(mbpa(1:7),mbpa(8:14),'alpha',0.01);
%32
i=i+1;
[p(i),h(i)] = ranksum(clc_feat.total_max_power(1,1:7),clc_feat.total_max_power(1,8:14),'alpha',0.01);
%33
i=i+1;
[p(i),h(i)] = ranksum(clc_feat.total_max_power(2,1:7),clc_feat.total_max_power(2,8:14),'alpha',0.01);
%34
i=i+1;
[p(i),h(i)] = ranksum(clc_feat.std_freq(1,1:7),clc_feat.std_freq(1,8:14),'alpha',0.01);
%35
i=i+1;
[p(i),h(i)]  = ranksum(clc_feat.std_freq(2,1:7),clc_feat.std_freq(2,8:14),'alpha',0.01);
%36
i=i+1;
[p(i),h(i)] = ranksum(clc_feat.total_main_freq(1,1:7),clc_feat.total_main_freq(1,8:14),'alpha',0.01);
%37
i=i+1;
[p(i),h(i)] = ranksum(clc_feat.total_main_freq(2,1:7),clc_feat.total_main_freq(2,8:14),'alpha',0.01);
%38
i=i+1;
[p(i),h(i)] = ranksum(clc_feat.avg_main_freq(1,1:7),clc_feat.avg_main_freq(1,8:14),'alpha',0.01);
%39
i=i+1;
[p(i),h(i)] = ranksum(clc_feat.avg_main_freq(2,1:7),clc_feat.avg_main_freq(2,8:14),'alpha',0.01);
