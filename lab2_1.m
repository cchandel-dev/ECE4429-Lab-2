clear;
close all;
%Generate 300 samples of a 500 Hz sinusoidal signal
%with a peak amplitude of 1 and sampled at 8000 Hz.
x1 = @(t) 1.0*sin(500*2*pi*t);
fs= 8000;
samples = 300;
startT = 0;
endT = 1/fs*(samples-1);
T=startT:1/fs:endT;
xs = x1(T);

%Generate 300 samples of white Gaussian noise
w = wgn(1,300,1,1);

%and scale it to have an RMS value of 0.75.
RMS = 0.75;
w = w/(rms(w)/RMS);


%Add the sine and noise samples together.
signaltotal = xs+w;
figure;
plot(T, signaltotal);
xlabel('s'); % x-axis label
ylabel('Signal value'); % y-axis label
title('Noisy Sine Wave');


SNR = 20*log10(rms(xs)/rms(w))

[autocorrelationunbias, datax1] = xcorr(signaltotal, 'unbiased');
[autocorrelationbias, datax2] = xcorr(signaltotal, 'biased');

figure;
plot(datax1, autocorrelationbias);
xlabel('x'); % x-axis label
ylabel('Autocorrelation'); % y-axis label
title('Autocorrelation (Biased)');


figure;
plot(datax2, autocorrelationunbias);
xlabel('x'); % x-axis label
ylabel('Autocorrelation '); % y-axis label
title('Autocorrelation (Unbiased)');


%find fundamental frequency of unbias autocorrelation
[peaks, xvals] = findpeaks(autocorrelationunbias, datax2, 'MinPeakHeight',0.5, 'MinPeakProminence',0.7);
fundfreq = fs/(xvals(15)-xvals(14));
