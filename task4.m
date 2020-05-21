function [mean_band_power, std_band_power] = task4(data,Fs)
    
    band_vector = [0.5,2,4,9,15]/60; % convert cpm to Hz       
    for k=1:size(band_vector,2)-1
        band_powers(:,k)=bandpower(data,Fs,band_vector(k:k+1)); % Calculate the power of each band
    end
    
    for i=1:size(data,2)
        % normalize with bandpower of each frame
        band_powers(i,:)=band_powers(i,:)/bandpower(data(:,i),Fs,[band_vector(1), band_vector(end)]); % Find power ration per band, by diving with the band power of 0.5-15
    end

    mean_band_power = mean(band_powers); 
    std_band_power  = std(band_powers);
end