%clear all; clc; close all;

%% Preparing the files to read
filelist = dir('EGG_data/*.csv'); % this returns a structure with more info than just the file names
N=max(size(filelist)); % get number of files
names = string(zeros(N,1));
for i=1:N
   names(i)= filelist(i).name; % Read file names into a String array
end
names = replace(names,"after.csv",""); % remove ending "after.csv"
names = replace(names,"before.csv",""); % remove ending "before.csv"
names = unique(names); % Remove dublicates
suffix = ["before.csv","after.csv"];
 
%% Preprocessing steps

for j=1:size(names,1)
%for j=1:1   
    for i=1:2 

        file = replace(join(['EGG_data/',names(j),suffix(i)])," ",""); % reconstruct filename
        pre_data = csvread(file); % read csv file

        pre_data = interp1([0, 65535],[-1, 1], pre_data); % map pre_data range to [-1, 1]
        pre_data = pre_data - mean(pre_data); % subtract mean value
        [b,a] = butter(3, 1.5/500); % Butterworth 3rd order and cutoff freq 1.5Hz for pre_data sampled at 1KHz
        pre_data = filter(b,a,pre_data); % filtering pre_data with butterworth filter
        frame = 4 * 60 * 1000; % frame size of 4 mins
        overlap = 0.75;
        Fs = 1000; % sample frequence is 1000Hz
        freq_step = Fs/frame; % Transfor will have length size of "frame" which represents up to 1000Hz
        data = frame_wind(pre_data, frame, overlap); % Returns the signal split in frames
        
        % Task No4 , bandpower examples use signal in time domain
        % No4 : Calculate bands power ratios'  mean and std value
        [mean_band_powers(:,i,j), std_band_powers(:,i,j)] = task4(data,Fs) ;
        
        data = abs(fft(data)); % calculate the amplitude of fft
        %data = data(1:end/2,:); % discard half to dump images of frequencies around Nyquist freq. (Fnyq = Fs/2)
        data = data(1:1.5/freq_step,:); % keep only frequencies up to 1.5Hz since the others are filtered
        data = (data/frame).^2; % calculate the power of fft
     
        %frequency = (0:freq_step:Fs/2-freq_step);
        frequency = (0:freq_step:1.5-freq_step); % Create frequency vector
        cpm = frequency' * 60; % Create cpm vector
        %figure, plot(cpm(1:end),(data(1:end,1)));

        %% Tasks 
        % No1 : Calculate main freq, max powers per frequency , average
        % power and main frequency and std 
        % i [1 - 2] , j [1 - 14] , per patient before and after meal
        [max_powers(:,i,j),max_indices] = max(data); % Gets the max power per frame and its index
        main_freqs(:,i,j) = cpm(max_indices); % Gets the main frequency
        avg_power(i,j) = mean(max_powers(:,i,j));
        std_power(i,j) = std(max_powers(:,i,j));
        avg_main_freq(i,j) = mean(main_freqs(:,i,j));
        std_freq(i,j) = std(main_freqs(:,i,j));
        
        %No3 : Calculate stomach function rates
        stomach_operations(:,i,j) = task3(data, main_freqs(:,i,j), max_powers(:,i,j), max_indices, cpm);
      
        %No5 : Calculate total main frequency and power
        pre_data = abs(fft(pre_data)); % calculate the amplitude of fft
        L = size(pre_data,1); % Signal length
        freq_step = Fs/L ; % Calculate the frequency step
        pre_data = (pre_data/L).^2; % calculate the power of fft
        pre_data = pre_data(1:1.5/freq_step,:); % keep only frequencies up to 1.5Hz since the others are filtered      
        frequency = (0:freq_step:1.5-freq_step); % Create frequency vector
        cpm2 = frequency' * 60; % Create cpm vector
        
        [total_max_power(i,j),max_idx] = max(pre_data); % Gets the max power per frame and its index
        total_main_freq(i,j) = cpm2(max_idx); % Gets the main frequency
    end
    % No2 : find the ratio of avg_power after/before meal per patient
    main_power_ratio(j) = avg_power(2,j)/avg_power(1,j);  % after/before
end

%% Structure of calculated features
clc_feat.info = string([" Data are split into patients (when u see dimension size = 14) and before/after meal (when u see dimension size = 2)",
"Main power ratio is the ratio of main power after/before meal thus the size is 1x14"]);
clc_feat.name = names;
%No1
clc_feat.avg_power = avg_power;
clc_feat.std_power = std_power;
clc_feat.avg_main_freq = avg_main_freq;
clc_feat.std_freq = std_freq;
%No2
clc_feat.main_power_ratio = main_power_ratio;
%No3
clc_feat.stomach_operations = stomach_operations;
%No4
clc_feat.mean_band_powers = mean_band_powers;
clc_feat.std_band_powers = std_band_powers;
%No5
clc_feat.total_max_power = total_max_power;
clc_feat.total_main_freq = total_main_freq;
