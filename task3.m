function out = task3(data, main_freqs,  max_powers , max_indices, cpm)
    out = zeros(5,1); % 5 categories
    sec_pows = zeros(size(max_indices));
    sec_idx  = zeros(size(max_indices));
    sec_freq = zeros(size(max_indices));
    
    for i=1:size(data,2)
        % Calculate second frequency and power
        data(max_indices(i),i)=0; % set the maximum power as 0 so its no more the maximum. Its value is known
        [sec_pows(i), sec_idx(i)] = max(data(:,i)); % get the new maximum power which is the 2nd maximum of the frame
        sec_freq(i) = cpm(sec_idx(i)); % get the frequency that corresponds to the 2nd maximum power
              
        % Calculate category of first and second main frequency for each
        % frame
        max_cat = find_category(main_freqs(i));
        sec_cat = find_category(sec_freq(i));
        
        % Increase the counter for the main frequency categories
        out(max_cat) = out(max_cat) + 1;
        
        % Increase the counter if main and second frequency belong to
        % different category while second power is greater or equal than
        % 85% of maximum power
        if(max_cat~=sec_cat && (sec_pows(i)/max_powers(i))>=0.85)
            out(5) = out(5) + 1 ;
        end
    end

    out = out/size(data,2);
end