%% Load data
% normal
n1afterT = readtable('EGG_data/n1after.csv');
n1beforeT = readtable('EGG_data/n1before.csv');

n2afterT = readtable('EGG_data/n2after.csv');
n2beforeT = readtable('EGG_data/n2before.csv');

n3afterT = readtable('EGG_data/n3after.csv');
n3beforeT = readtable('EGG_data/n3before.csv');

n4afterT = readtable('EGG_data/n4after.csv');
n4beforeT = readtable('EGG_data/n4before.csv');

n5afterT = readtable('EGG_data/n5after.csv');
n5beforeT = readtable('EGG_data/n5before.csv');

n6afterT = readtable('EGG_data/n6after.csv');
n6beforeT = readtable('EGG_data/n6before.csv');

n7afterT = readtable('EGG_data/n7after.csv');
n7beforeT = readtable('EGG_data/n7before.csv');

%parkinson
pd1afterT = readtable('EGG_data/pd1after.csv');
pd1beforeT = readtable('EGG_data/pd1before.csv');

pd2afterT = readtable('EGG_data/pd2after.csv');
pd2beforeT = readtable('EGG_data/pd2before.csv');

pd3afterT = readtable('EGG_data/pd3after.csv');
pd3beforeT = readtable('EGG_data/pd3before.csv');

pd4afterT = readtable('EGG_data/pd4after.csv');
pd4beforeT = readtable('EGG_data/pd4before.csv');

pd5afterT = readtable('EGG_data/pd5after.csv');
pd5beforeT = readtable('EGG_data/pd5before.csv');

pd6afterT = readtable('EGG_data/pd6after.csv');
pd6beforeT = readtable('EGG_data/pd6before.csv');

pd7afterT = readtable('EGG_data/pd7after.csv');
pd7beforeT = readtable('EGG_data/pd7before.csv');

%% join tables for each patient

% combine them along column dimension
n1 = [n1afterT n1beforeT];
n2 = [n2afterT n2beforeT]; 
n3 = [n3afterT n3beforeT]; 
n4 = [n4afterT n4beforeT]; 
n5 = [n5afterT n5beforeT]; 
n6 = [n6afterT n6beforeT]; 
n7 = [n7afterT n7beforeT]; 

pd1 = [pd1afterT pd1beforeT];
pd2 = [pd2afterT pd2beforeT];
pd3 = [pd3afterT pd3beforeT];
pd4 = [pd4afterT pd4beforeT];
pd5 = [pd5afterT pd5beforeT];
pd6 = [pd6afterT pd6beforeT];
pd7 = [pd7afterT pd7beforeT];

%% Join all normal and pd patient into one table
nAll = [n1 n2 n3 n4 n5 n6 n7];
pdAll = [pd1 pd2 pd3 pd4 pd5 pd6 pd7];

%name the variables 
nAll.Properties.VariableNames = {'n1afterT','n1beforeT','n2afterT','n2beforeT', ...
    'n3afterT','n3beforeT','n4afterT','n4beforeT', 'n5afterT', 'n5beforeT','n6afterT', ....
    'n6beforeT','n7afterT', 'n7beforeT'};

pdAll.Properties.VariableNames = {'pd1afterT','pd1beforeT','pd2afterT','pd2beforeT', ...
    'pd3afterT','pd3beforeT','pd4afterT','pd4beforeT', 'pd5afterT', 'pd5beforeT','pd6afterT', ....
    'pd6beforeT','pd7afterT', 'pd7beforeT'};

%% plot timeseries 
nAllfig = figure('units','normalized','outerposition',[0 0 1 1]);
stackedplot(nAll);
saveas(nAllfig ,'images/nAlltimeseries', 'jpg');

pdAllfig = figure('units','normalized','outerposition',[0 0 1 1]);
stackedplot(pdAll);
saveas(pdAllfig ,'images/pdAlltimeseries', 'jpg');