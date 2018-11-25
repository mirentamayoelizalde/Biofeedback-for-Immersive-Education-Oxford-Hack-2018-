HR = csvread('id-1003_heartrate_15min_20171001_20171007.csv',1,1);
accel = csvread('id-1003_hourlyintensities_20171001_20171007.csv',1,2);


figure;
subplot(2,1,1);
plot(HR)
title('Heart rate')
xlim([0,200]);
subplot(2,1,2);
plot(accel)
title('Accelerometer')

