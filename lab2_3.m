clear;
close all;
[ampf1, Fs_f1] = audioread('f1.wav');

x = [0:1/Fs_f1:(length(ampf1)-1)/Fs_f1];
subplot(2,1,1);
plot(x, ampf1);
xlabel('s');
ylabel('f1');
title('Signal of f1(t)');


ampf1_fft = abs(fft(ampf1));
x = [0:length(ampf1)-1]*Fs_f1/length(ampf1);
subplot(2,1,2);
plot(x, ampf1_fft);
xlabel('f (Hz)');
ylabel('|F1(f)|');
title('Magnitude Spectrum of f1');


[ampm1, Fs_m1] = audioread('m1.wav');
figure;
x = [0:1/Fs_m1:(length(ampm1)-1)/Fs_m1];
subplot(2,1,1);
plot(x, ampm1);
xlabel('s');
ylabel('m1');
title('Signal of m1(t)');


ampm1_fft = abs(fft(ampm1));
x = [0:length(ampm1)-1]*Fs_m1/length(ampm1);
subplot(2,1,2);
plot(x, ampm1_fft);
xlabel('f (Hz)');
ylabel('|M1(f)|');
title('Magnitude Spectrum of m1');

load('ecg.dat');
ampecg = ecg;
Fs_ecg = 500;
figure;
x = [0:1/Fs_ecg:(length(ampecg)-1)/Fs_ecg];
subplot(2,1,1);
plot(x, ampecg);
xlabel('s')
ylabel('ecg')
title('Signal of ecg(t)')


ampecg_fft = abs(fft(ampecg));
x = [0:length(ampecg)-1]*Fs_ecg/length(ampecg);
subplot(2,1,2);
plot(x, ampecg_fft);
xlabel('f (Hz)');
ylabel('|ECG(f)|');
title('Magnitude Spectrum of ecg');



load('seismic.dat');
ampseismic = seismic;
Fs_seismic = 15;
figure;
x = [0:1/Fs_seismic:(length(ampseismic)-1)/Fs_seismic];
subplot(2,1,1);
plot(x, ampseismic);
xlabel('s')
ylabel('seismic')
title('Signal of seismic(t)')


ampseismic_fft = abs(fft(ampseismic));
x = [0:length(ampseismic)-1]*Fs_seismic/length(ampseismic);
subplot(2,1,2);
plot(x, ampseismic_fft);
xlabel('f (Hz)');
ylabel('|Seismic(f)|');
title('Magnitude Spectrum of seismic');
[~, max_f] = max(ampseismic_fft);
seismic_max_f = x(max_f)


load('vbrdata.dat');
ampvbrdata = vbrdata;
Fs_vbrdata = 1000;
figure;
x = [0:1/Fs_vbrdata:(length(ampvbrdata)-1)/Fs_vbrdata];
subplot(2,1,1);
plot(x, ampvbrdata);
xlabel('s')
ylabel('vbrdata')
title('Signal of vbrdata(t)')

ampvbrdata_fft = abs(fft(ampvbrdata));
x = [0:length(ampvbrdata)-1]*Fs_vbrdata/length(ampvbrdata);
subplot(2,1,2);
plot(x, ampvbrdata_fft);
xlabel('f (Hz)');
ylabel('|Vbrdata(f)|');
title('Magnitude Spectrum of vbrdata');
