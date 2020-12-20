clear;
close all;
load('sensor_data.mat');

[correlation1_2, deltax2_1] = xcorr(s1, s2);
figure;
plot(deltax2_1, correlation1_2);
xlabel('x'); % x-axis label
ylabel('value'); % y-axis label
title('Cross-correlation (s1, s2)');
[~, y_21] = max(correlation1_2);
delta2_1 = deltax2_1(y_21)

[correlation2_3, deltax2_3] = xcorr(s2, s3);
figure;
plot(deltax2_3, correlation2_3);
xlabel('x'); % x-axis label
ylabel('value'); % y-axis label
title('Cross-correlation (s2, s3)');
[~, y_23] = max(correlation2_3);
delta2_3 = deltax2_3(y_23)

[correlation3_1, deltax3_1] = xcorr(s3, s1);
figure;
plot(deltax3_1, correlation3_1);
xlabel('x'); % x-axis label
ylabel('value'); % y-axis label
title('Cross-correlation (s3, s1)');
[~, y_31] = max(correlation3_1);
delta3_1 = deltax3_1(y_31)

s1x = transpose(0:1:length(s1)-1);
s2x = transpose(0:1:length(s2)-1)+350;
s3x = transpose(0:1:length(s3)-1)-150;

figure;
plot(s1x, s1,'r',s2x,s2,'b',s3x,s3,'g');


