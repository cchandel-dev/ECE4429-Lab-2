clear;
close all;
[ampf1, Fs_f1] = audioread('f1.wav')
[ampm1, Fs_m1] = audioread('m1.wav')

figure;
[autocorrelationunbiasf1, x_f1] = xcorr(ampf1, 'unbiased');
plot(x_f1, autocorrelationunbiasf1);
xlabel('x'); % x-axis label
ylabel('Autocorrelation'); % y-axis label
title('Autocorrelation (Unbiased)');

%find fundamental frequency of unbias autocorrelation for f1
[peaksf1, xvalsf1] = findpeaks(autocorrelationunbiasf1, x_f1, 'MinPeakHeight',0.03);
fundfreqf1 = Fs_f1/(xvalsf1(17)-xvalsf1(16))

figure;
[autocorrelationunbiasm1, x_m1] = xcorr(ampm1, 'unbiased');
plot(x_m1, autocorrelationunbiasm1);
xlabel('x'); % x-axis label
ylabel('Autocorrelation'); % y-axis label
title('Autocorrelation (Unbiased)');

%find fundamental frequency of unbias autocorrelation for m1
[peaksm1, xvalsm1] = findpeaks(autocorrelationunbiasm1, x_m1, 'MinPeakHeight',0.007);
fundfreqm1 = Fs_m1/(xvalsm1(14)-xvalsm1(13))