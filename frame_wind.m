function Y=frame_wind(X,frame,overlap)

step=1-overlap;
n=size(X,1);
k=floor((n-frame*overlap)/(frame*step)); % Calculate the number of frames that will be needed
Y=zeros(frame,k); 
w=hanning(frame); % Creating the hanning window that will be used

for i=1:k
   offset = (i-1) * step * frame; % Calculating where each frame starts at each iteration
   Y(:,i)=X(offset+1 : offset+frame).*w; % Multiply each frame with the window
end