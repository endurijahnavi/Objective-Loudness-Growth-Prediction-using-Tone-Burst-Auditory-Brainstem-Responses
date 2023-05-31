clear all
duration=8;
Fs=173.61;
f=load('S001.txt'); % input signal
f=f(200:round(Fs*duration));
N=length(f);
dt=linspace(0,duration,N);

figure
subplot(4,1,1)
plot(dt,f)
set(findobj(gca,'type','line'),'linew',2);
grid on

title('Bessel EEG')

params.SamplingRate = Fs; 

% Choose the wanted global trend removal (none,plaw,poly,morpho,tophat)
params.globtrend = 'none';
params.degree=6; % degree for the polynomial interpolation

% Choose the wanted regularization (none,gaussian,avaerage,closing)
params.reg = 'gaussian';
params.lengthFilter = 10;
params.sigmaFilter = 1.5;

% Choose the wanted detection method (locmax,locmaxmin,ftc,
% adaptive,adaptivereg,scalespace)
params.detect = 'scalespace';
params.typeDetect='otsu'; %for scalespace:otsu,halfnormal,empiricallaw,mean,kmeans
params.N = 10; % maximum number of bands
params.completion = 1; % choose if you want to force to have params.N modes
                       % in case the algorithm found less ones (0 or 1)
params.log=1;

% Choose the results you want to display (Show=1, Not Show=0)
Bound=1;   % Display the detected boundaries on the spectrum


          
subresf=1;
[freq1,freq1_bndr,freq2,a3,ewt,mfb,boundaries]=FBexp(f,params);


if Bound==1 %Show the boundaries on the spectrum
    div=1;
    
        %ShFBEWT(abs(a3),freq1,boundaries,div,params.SamplingRate);
        Show_EWTFB_Boundaries(a3,freq1,freq1_bndr)
        
   axis tight
    title('FBEWT boundaries')
    xxx=(linspace(0,1,round(length(mfb{1,1}))))*Fs;
subplot(4,1,3)
for i=1:size(mfb)
plot(xxx,mfb{i,1})
hold on
end
xlim([0 round(173.61/2)])
ylim([0 3])
title('FBEWT filter bank')
end
 
rec=Modes_EWT1D(ewt,mfb);
for i=1:length(rec)
imf(i,:)=rec{i,1};
end