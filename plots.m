%clear all; clc; close all;


%% Load struct

dt = load("calculated_features.mat");
dt = dt.clc_feat;
% pkg load statistics


%% 1

figure;
boxplot([dt.avg_power(1,1:7); dt.avg_power(1,8:14)]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Μέση τιμή κυρίαρχης ενέργειας πριν το φαγητό");
% disp ("plots/avg_power_b.png");
%boxplot([dt.avg_power(1,1:7); dt.avg_power(1,8:14)]'); diafora gia matlab anti octave

figure;
boxplot([dt.avg_power(2,1:7); dt.avg_power(2,8:14)]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Μέση τιμή κυρίαρχης ενέργειας μετά το φαγητό");
disp ("plots/avg_power_a.png");


figure;
boxplot([dt.std_power(1,1:7); dt.std_power(1,8:14)]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Τυπική απόκλιση κυρίαρχης ενέργειας πριν το φαγητό");
disp ("plots/std_power_b.png");

figure;
boxplot([dt.std_power(2,1:7); dt.std_power(2,8:14)]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Τυπική απόκλιση κυρίαρχης ενέργειας μετά το φαγητό");
disp ("plots/std_power_a.png");

figure;
boxplot([dt.avg_main_freq(1,1:7); dt.avg_main_freq(1,8:14)]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Μέση τιμή κυρίαρχης συχνότητας πριν το φαγητό");
disp ("plots/avg_main_freq_b.png");

figure;
boxplot([dt.avg_main_freq(2,1:7); dt.avg_main_freq(2,8:14)]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Μέση τιμή κυρίαρχης συχνότητας μετά το φαγητό");
disp ("plots/avg_main_freq_a.png");

figure;
boxplot([dt.std_freq(1,1:7); dt.std_freq(1,8:14)]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Τυπική απόκλιση κυρίαρχης συχνότητας πριν το φαγητό");
disp ("plots/std_freq_b.png");

figure;
boxplot([dt.std_freq(2,1:7); dt.std_freq(2,8:14)]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Τυπική απόκλιση κυρίαρχης συχνότητας μετα το φαγητό");
disp ("plots/std_freq_a.png");

%% 2

figure;
boxplot([dt.main_power_ratio(1,1:7); dt.main_power_ratio(8:14)]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Λόγος κυρίαρχης ενέργειας μετά/πριν το φαγητό");
disp ("plots/main_power_ratio.png");

%% 3

slow_b_n = cell2mat(reshape(num2cell(dt.stomach_operations(1,1,1:7)),1,7));
slow_b_pd = cell2mat(reshape(num2cell(dt.stomach_operations(1,1,8:14)),1,7));
slow_a_n = cell2mat(reshape(num2cell(dt.stomach_operations(1,2,1:7)),1,7));
slow_a_pd = cell2mat(reshape(num2cell(dt.stomach_operations(1,2,8:14)),1,7));

normal_b_n = cell2mat(reshape(num2cell(dt.stomach_operations(2,1,1:7)),1,7));
normal_b_pd = cell2mat(reshape(num2cell(dt.stomach_operations(2,1,8:14)),1,7));
normal_a_n = cell2mat(reshape(num2cell(dt.stomach_operations(2,2,1:7)),1,7));
normal_a_pd = cell2mat(reshape(num2cell(dt.stomach_operations(2,2,8:14)),1,7));

fast_b_n = cell2mat(reshape(num2cell(dt.stomach_operations(3,1,1:7)),1,7));
fast_b_pd = cell2mat(reshape(num2cell(dt.stomach_operations(3,1,8:14)),1,7));
fast_a_n = cell2mat(reshape(num2cell(dt.stomach_operations(3,2,1:7)),1,7));
fast_a_pd = cell2mat(reshape(num2cell(dt.stomach_operations(3,2,8:14)),1,7));

other_b_n = cell2mat(reshape(num2cell(dt.stomach_operations(4,1,1:7)),1,7));
other_b_pd = cell2mat(reshape(num2cell(dt.stomach_operations(4,1,8:14)),1,7));
other_a_n = cell2mat(reshape(num2cell(dt.stomach_operations(4,2,1:7)),1,7));
other_a_pd = cell2mat(reshape(num2cell(dt.stomach_operations(4,2,8:14)),1,7));

arrhythmia_b_n = cell2mat(reshape(num2cell(dt.stomach_operations(5,1,1:7)),1,7));
arrhythmia_b_pd = cell2mat(reshape(num2cell(dt.stomach_operations(5,1,8:14)),1,7));
arrhythmia_a_n = cell2mat(reshape(num2cell(dt.stomach_operations(5,2,1:7)),1,7));
arrhythmia_a_pd = cell2mat(reshape(num2cell(dt.stomach_operations(5,2,8:14)),1,7));

figure;
boxplot([slow_b_n; slow_b_pd]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Ποσοστό εμφάνισης βραδυγαστρίας πριν το φαγητό");
disp ("plots/slow_b.png");

figure;
boxplot([slow_a_n; slow_a_pd]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Ποσοστό εμφάνισης βραδυγαστρίας μετά το φαγητό");
disp ("plots/slow_a.png");

figure;
boxplot([normal_b_n; normal_b_pd]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Ποσοστό εμφάνισης φυσιολογικής λειτουργίας στομάχου πριν το φαγητό");
disp ("plots/normal_b.png");

figure;
boxplot([normal_a_n; normal_a_pd]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Ποσοστό εμφάνισης φυσιολογικής λειτουργίας στομάχου μετά το φαγητό");
disp ("plots/normal_a.png");

figure;
boxplot([fast_b_n; fast_b_pd]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Ποσοστό εμφάνισης ταχυγαστρίας πριν το φαγητό");
disp ("plots/fast_b.png");

figure;
boxplot([fast_a_n; fast_a_pd]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Ποσοστό εμφάνισης ταχυγαστρίας μετά το φαγητό");
disp ("plots/fast_a.png");

figure;
boxplot([other_b_n; other_b_pd]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Ποσοστό εμφάνισης άλλης δραστηριότητας πριν το φαγητό");
disp ("plots/other_b.png");

figure;
boxplot([other_a_n; other_a_pd]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Ποσοστό εμφάνισης άλλης δραστηριότητας μετά το φαγητό");
disp ("plots/other_a.png");

figure;
boxplot([arrhythmia_b_n; arrhythmia_b_pd]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Ποσοστό εμφάνισης αρρυθμίας πριν το φαγητό");
disp ("plots/arrythmia_b.png");

figure;
boxplot([arrhythmia_a_n; arrhythmia_a_pd]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Ποσοστό εμφάνισης αρρυθμίας μετά το φαγητό");
disp ("plots/arrythmia_a.png");

%% 4

mean_i_b_n = cell2mat(reshape(num2cell(dt.mean_band_powers(1,1,1:7)),1,7));
mean_i_b_pd = cell2mat(reshape(num2cell(dt.mean_band_powers(1,1,8:14)),1,7));
mean_i_a_n = cell2mat(reshape(num2cell(dt.mean_band_powers(1,2,1:7)),1,7));
mean_i_a_pd = cell2mat(reshape(num2cell(dt.mean_band_powers(1,2,8:14)),1,7));

mean_ii_b_n = cell2mat(reshape(num2cell(dt.mean_band_powers(2,1,1:7)),1,7));
mean_ii_b_pd = cell2mat(reshape(num2cell(dt.mean_band_powers(2,1,8:14)),1,7));
mean_ii_a_n = cell2mat(reshape(num2cell(dt.mean_band_powers(2,2,1:7)),1,7));
mean_ii_a_pd = cell2mat(reshape(num2cell(dt.mean_band_powers(2,2,8:14)),1,7));

mean_iii_b_n = cell2mat(reshape(num2cell(dt.mean_band_powers(3,1,1:7)),1,7));
mean_iii_b_pd = cell2mat(reshape(num2cell(dt.mean_band_powers(3,1,8:14)),1,7));
mean_iii_a_n = cell2mat(reshape(num2cell(dt.mean_band_powers(3,2,1:7)),1,7));
mean_iii_a_pd = cell2mat(reshape(num2cell(dt.mean_band_powers(3,2,8:14)),1,7));

mean_iv_b_n = cell2mat(reshape(num2cell(dt.mean_band_powers(4,1,1:7)),1,7));
mean_iv_b_pd = cell2mat(reshape(num2cell(dt.mean_band_powers(4,1,8:14)),1,7));
mean_iv_a_n = cell2mat(reshape(num2cell(dt.mean_band_powers(4,2,1:7)),1,7));
mean_iv_a_pd = cell2mat(reshape(num2cell(dt.mean_band_powers(4,2,8:14)),1,7));

figure;
boxplot([mean_i_b_n; mean_i_b_pd]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Μέση τιμή λόγου ενέργειας 1ου διαστήματος πριν το φαγητό");
disp ("plots/mean_i_b.png");

figure;
boxplot([mean_i_a_n; mean_i_a_pd]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Μέση τιμή λόγου ενέργειας 1ου διαστήματος μετά το φαγητό");
disp ("plots/mean_i_a.png");

figure;
boxplot([mean_ii_b_n; mean_ii_b_pd]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Μέση τιμή λόγου ενέργειας 2ου διαστήματος πριν το φαγητό");
disp ("plots/mean_ii_b.png");

figure;
boxplot([mean_ii_a_n; mean_ii_a_pd]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Μέση τιμή λόγου ενέργειας 2ου διαστήματος μετά το φαγητό");
disp ("plots/mean_ii_a.png");

figure;
boxplot([mean_iii_b_n; mean_iii_b_pd]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Μέση τιμή λόγου ενέργειας 3ου διαστήματος πριν το φαγητό");
disp ("plots/mean_iii_b.png");

figure;
boxplot([mean_iii_a_n; mean_iii_a_pd]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Μέση τιμή λόγου ενέργειας 3ου διαστήματος μετά το φαγητό");
disp ("plots/mean_iii_a.png");

figure;
boxplot([mean_iv_b_n; mean_iv_b_pd]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Μέση τιμή λόγου ενέργειας 4ου διαστήματος πριν το φαγητό");
disp ("plots/mean_iv_b.png");

figure;
boxplot([mean_iv_a_n; mean_iv_a_pd]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Μέση τιμή λόγου ενέργειας 4ου διαστήματος μετά το φαγητό");
disp ("plots/mean_iv_a.png");

std_i_b_n = cell2mat(reshape(num2cell(dt.std_band_powers(1,1,1:7)),1,7));
std_i_b_pd = cell2mat(reshape(num2cell(dt.std_band_powers(1,1,8:14)),1,7));
std_i_a_n = cell2mat(reshape(num2cell(dt.std_band_powers(1,2,1:7)),1,7));
std_i_a_pd = cell2mat(reshape(num2cell(dt.std_band_powers(1,2,8:14)),1,7));

std_ii_b_n = cell2mat(reshape(num2cell(dt.std_band_powers(2,1,1:7)),1,7));
std_ii_b_pd = cell2mat(reshape(num2cell(dt.std_band_powers(2,1,8:14)),1,7));
std_ii_a_n = cell2mat(reshape(num2cell(dt.std_band_powers(2,2,1:7)),1,7));
std_ii_a_pd = cell2mat(reshape(num2cell(dt.std_band_powers(2,2,8:14)),1,7));

std_iii_b_n = cell2mat(reshape(num2cell(dt.std_band_powers(3,1,1:7)),1,7));
std_iii_b_pd = cell2mat(reshape(num2cell(dt.std_band_powers(3,1,8:14)),1,7));
std_iii_a_n = cell2mat(reshape(num2cell(dt.std_band_powers(3,2,1:7)),1,7));
std_iii_a_pd = cell2mat(reshape(num2cell(dt.std_band_powers(3,2,8:14)),1,7));

std_iv_b_n = cell2mat(reshape(num2cell(dt.std_band_powers(4,1,1:7)),1,7));
std_iv_b_pd = cell2mat(reshape(num2cell(dt.std_band_powers(4,1,8:14)),1,7));
std_iv_a_n = cell2mat(reshape(num2cell(dt.std_band_powers(4,2,1:7)),1,7));
std_iv_a_pd = cell2mat(reshape(num2cell(dt.std_band_powers(4,2,8:14)),1,7));

figure;
boxplot([std_i_b_n; std_i_b_pd]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Τυπική απόκλιση λόγου ενέργειας 1ου διαστήματος πριν το φαγητό");
disp ("plots/std_i_b.png");

figure;
boxplot([std_i_a_n; std_i_a_pd]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Τυπική απόκλιση λόγου ενέργειας 1ου διαστήματος μετά το φαγητό");
disp ("plots/std_i_a.png");

figure;
boxplot([std_ii_b_n; std_ii_b_pd]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Τυπική απόκλιση λόγου ενέργειας 2ου διαστήματος πριν το φαγητό");
disp ("plots/std_ii_b.png");

figure;
boxplot([std_ii_a_n; std_ii_a_pd]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Τυπική απόκλιση λόγου ενέργειας 2ου διαστήματος μετά το φαγητό");
disp ("plots/std_ii_a.png");

figure;
boxplot([std_iii_b_n; std_iii_b_pd]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Τυπική απόκλιση λόγου ενέργειας 3ου διαστήματος πριν το φαγητό");
disp ("plots/std_iii_b.png");

figure;
boxplot([std_iii_a_n; std_iii_a_pd]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Τυπική απόκλιση λόγου ενέργειας 3ου διαστήματος μετά το φαγητό");
disp ("plots/std_iii_a.png");

figure;
boxplot([std_iv_b_n; std_iv_b_pd]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Τυπική απόκλιση λόγου ενέργειας 4ου διαστήματος πριν το φαγητό");
disp ("plots/std_iv_b.png");

figure;
boxplot([std_iv_a_n; std_iv_a_pd]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Τυπική απόκλιση λόγου ενέργειας 4ου διαστήματος μετά το φαγητό");
disp ("plots/std_iv_a.png");

%% 5

figure;
boxplot([dt.total_max_power(1,1:7); dt.total_max_power(1,8:14)]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Συνολική κυρίαρχη ενέργεια πριν το φαγητό");
disp ("plots/total_max_power_b.png");

figure;
boxplot([dt.total_max_power(2,1:7); dt.total_max_power(2,8:14)]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Συνολική κυρίαρχη ενέργεια μετά το φαγητό");
disp ("plots/total_max_power_a.png");

figure;
boxplot([dt.total_main_freq(1,1:7); dt.total_main_freq(1,8:14)]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Συνολική κυρίαρχη συχνότητα πριν το φαγητό");
disp ("plots/total_main_freq_b.png");

figure;
boxplot([dt.total_main_freq(2,1:7); dt.total_main_freq(2,8:14)]');
set(gca (), "xtick", [1 2], "xticklabel", {"Healthy", "PD"})
title ("Συνολική κυρίαρχη συχνότητα μετά το φαγητό");
disp ("plots/total_main_freq_a.png");
