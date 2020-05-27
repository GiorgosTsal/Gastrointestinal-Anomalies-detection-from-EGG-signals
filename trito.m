clear; close all; clc;

load calculated_features.mat

[p,h] = ranksum(clc_feat.avg_power(1,1:7),clc_feat.avg_power(1,8:14),'alpha',0.01);
[p1,h1] = ranksum(clc_feat.avg_power(2,1:7),clc_feat.avg_power(2,8:14),'alpha',0.01);
[p2,h2] = ranksum(clc_feat.std_power(1,1:7),clc_feat.std_power(1,8:14),'alpha',0.01);
[p3,h3] = ranksum(clc_feat.std_power(2,1:7),clc_feat.std_power(2,8:14),'alpha',0.01);
[p4,h4] = ranksum(clc_feat.main_power_ratio(1,1:7),clc_feat.main_power_ratio(1,8:14),'alpha',0.01);
 
stomach_operation_before_food=reshape(clc_feat.stomach_operations(:,1,:),[],1);
[p5,h5] = ranksum(stomach_operation_before_food(1:35),stomach_operation_before_food(36:70),'alpha',0.01);
stomach_operation_after_food=reshape(clc_feat.stomach_operations(:,2,:),[],1);
[p6,h6] = ranksum(stomach_operation_after_food(1:35),stomach_operation_after_food(36:70),'alpha',0.01);

mbpb=reshape(clc_feat.mean_band_powers(:,1,:),[],1);
[p7,h7] = ranksum(mbpb(1:28),mbpb(29:56),'alpha',0.01);

mbpa=reshape(clc_feat.mean_band_powers(:,2,:),[],1);
[p8,h8] = ranksum(mbpa(1:28),mbpa(29:56),'alpha',0.01);


[p9,h9] = ranksum(clc_feat.total_max_power(1,1:7),clc_feat.total_max_power(1,8:14),'alpha',0.01);
[p10,h10] = ranksum(clc_feat.total_max_power(2,1:7),clc_feat.total_max_power(2,8:14),'alpha',0.01);

[p11,h11] = ranksum(clc_feat.std_freq(1,1:7),clc_feat.std_freq(1,8:14),'alpha',0.01);
[p12,h12] = ranksum(clc_feat.std_freq(2,1:7),clc_feat.std_freq(2,8:14),'alpha',0.01);

[p13,h13] = ranksum(clc_feat.total_main_freq(1,1:7),clc_feat.total_main_freq(1,8:14),'alpha',0.01);
[p14,h14] = ranksum(clc_feat.total_main_freq(2,1:7),clc_feat.total_main_freq(2,8:14),'alpha',0.01);
