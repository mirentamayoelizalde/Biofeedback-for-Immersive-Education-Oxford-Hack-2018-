eeg_relax = csvread('Calm.csv',3,2);
eeg_LongFocused =csvread('Long_focused.csv',3,2);
eeg_Moving =csvread('Moving.csv',3,2);

eeg_relax(eeg_relax < 500) = []; %remove accelerometer data
eeg_relax(eeg_relax > 1300) = []; 

eeg_Moving(eeg_Moving < 500) = []; %remove accelerometer data
eeg_Moving(eeg_Moving > 1300) = []; 
eeg_Moving=abs(eeg_Moving)-mean(eeg_Moving);

eeg_LongFocused(eeg_LongFocused < 500) = []; %remove accelerometer data
eeg_LongFocused(eeg_LongFocused > 1300) = []; 
eeg_LongFocused=abs(eeg_LongFocused)-mean(eeg_LongFocused);

eeg_relax_mean=mean(eeg_relax);
eeg_relax_std=std(eeg_relax);

eeg_focused_mean=mean(eeg_LongFocused);
eeg_focuses_std=std(eeg_LongFocused);

len1= size(eeg_relax,2)
len2= size(eeg_Moving,2)
len3= size(eeg_LongFocused,2)



figure;
subplot(2,1,1);
plot(eeg_LongFocused(1:25525));
xlim([0,25000]);
title('Focused and still')
subplot(2,1,2);
plot(eeg_Moving(1:25525));
title('Distracted and moving')
xlim([0,25000]);

% for i=1:size(eeg_relax,2)
%     eeg_relax(eeg_relax < 500) = []
%     if eeg_relax(1,1) > 500
%         plot(eeg_relax(:,i));
%         hold on
%         waitforbuttonpress;
%     else 
%         i=i+1;
%     end
% end
%heart_rate = csvread('id-1003_heartrate_15min_20171001_20171007');
%intensity = csvread('id-1003_hourlyintensities_20171001_20171007.csv');
%sleep = csvread('id-1003_sleepday_20171001_20171007.csv');