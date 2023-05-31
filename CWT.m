%%CWT
loudness_level = 45;
[Sig,fs,tmp]=rdsamp(['N1_evoked_raw_',num2str(loudness_level),'_F1_R1.dat']);
recording = Sig(:,1);
fs_new = 5000;
sig_new = resample(recording,fs_new/1000,48);

%% Sample CWT
freq = [2000];
for j = 1:length(freq)
    fs_new = freq(j);
    figure;
    for i = 2:20
        loudness_level = i*5;
        if(loudness_level ==20)
            [Sig,fs,tmp]=rdsamp(['N1_evoked_raw_',num2str(loudness_level),'_F1_R1_x.dat']);
            recording = Sig(:,1);
            %sig_new  = downsample(recording,3);
            sig_new = resample(recording,fs_new/1000,48);
            stim_rate = floor(2002/(1000*48/(fs_new)));
            ft_size = 2*stim_rate;
            subplot(5,4,i);
            [cfs,frq] = cwt(sig_new,fs_new);
            tms = (0:numel(sig_new)-1)/fs_new;
            surface(tms,frq,abs(cfs));
            axis tight;
            shading flat;
            set(gca,"yscale","log");
            title(['N1-R1-Loudness-',num2str(loudness_level),' dB and Fs = ',num2str(freq(j))]);
            continue
        end
       
        [Sig,fs,tmp]=rdsamp(['N1_evoked_raw_',num2str(loudness_level),'_F1_R1.dat']);
        recording = Sig(:,1);
        %sig_new  = downsample(recording,3);
        sig_new = resample(recording,fs_new/1000,48);
        stim_rate = floor(2002/(1000*48/(fs_new)));
        ft_size = 2*stim_rate;
        subplot(5,4,i);
        [cfs,frq] = cwt(sig_new,fs_new);
        tms = (0:numel(sig_new)-1)/fs_new;
        surface(tms,frq,abs(cfs));
        axis tight;
        shading flat;
        set(gca,"yscale","log");
        title(['N1-R1-Loudness-',num2str(loudness_level),' dB and Fs = ',num2str(freq(j))]);
    end
    savefig(['CWT_F1_R1_',num2str(freq(j)/1000),'KHz']);
end

%%
        loudness_level = 40;
        fs_new = 2000;
        [Sig,fs,tmp]=rdsamp(['N1_evoked_raw_',num2str(loudness_level),'_F1_R1.dat']);
        recording = Sig(:,1);
        %sig_new  = downsample(recording,3);
        sig_new = resample(recording,fs_new/1000,48);
        stim_rate = floor(2002/(1000*48/(fs_new)));
        ft_size = 2*stim_rate;
        [cfs,frq] = cwt(sig_new,fs_new);
        tms = (0:numel(sig_new)-1)/fs_new;
        subplot(2,1,1);
        surface(tms,frq,abs(cfs));
        axis tight;
        shading flat;
        set(gca,"yscale","log");
        ylabel("Frequency");
        xlabel("Time");
        title(['N1-R1-Loudness-',num2str(loudness_level),' dB and Fs = ',num2str(fs_new)]);
        loudness_level = 45;
        fs_new = 2000;
        [Sig,fs,tmp]=rdsamp(['N1_evoked_raw_',num2str(loudness_level),'_F1_R1.dat']);
        recording = Sig(:,1);
        %sig_new  = downsample(recording,3);
        sig_new = resample(recording,fs_new/1000,48);
        stim_rate = floor(2002/(1000*48/(fs_new)));
        ft_size = 2*stim_rate;
        [cfs,frq] = cwt(sig_new,fs_new);
        tms = (0:numel(sig_new)-1)/fs_new;
        subplot(2,1,2);
        surface(tms,frq,abs(cfs));
        axis tight;
        shading flat;
        set(gca,"yscale","log");
        ylabel("Frequency");
        xlabel("Time");
        title(['N1-R1-Loudness-',num2str(loudness_level),' dB and Fs = ',num2str(fs_new)]);
%%
freq = [2000];
for j = 1:length(freq)
    fs_new = freq(j);
    figure;
    for i = 2:20
        loudness_level = i*5;
        if(loudness_level ==20)
            [Sig,fs,tmp]=rdsamp(['N1_evoked_raw_',num2str(loudness_level),'_F1_R1_x.dat']);
            recording = Sig(:,1);
            %sig_new  = downsample(recording,3);
            sig_new = resample(recording,fs_new/1000,48);
            stim_rate = floor(2002/(1000*48/(fs_new)));
            ft_size = 2*stim_rate;
            [cfs,frq] = cwt(sig_new,fs_new);
            tms = (0:numel(sig_new)-1)/fs_new;
            subplot(5,4,i);
            surface(tms,frq,abs(cfs));
            axis tight;
            shading flat;
            set(gca,"yscale","log");
            ylabel("Frequency");
            xlabel("Time");
            title(['N1-R1-Loudness-',num2str(loudness_level),' dB and Fs = ',num2str(freq(j))]);
            continue
        end
        [Sig,fs,tmp]=rdsamp(['N1_evoked_raw_',num2str(loudness_level),'_F1_R1.dat']);
        recording = Sig(:,1);
        %sig_new  = downsample(recording,3);
        sig_new = resample(recording,fs_new/1000,48);
        stim_rate = floor(2002/(1000*48/(fs_new)));
        ft_size = 2*stim_rate;
        [cfs,frq] = cwt(sig_new,fs_new);
        tms = (0:numel(sig_new)-1)/fs_new;
        subplot(5,4,i);
        surface(tms,frq,abs(cfs));
        axis tight;
        shading flat;
        set(gca,"yscale","log");
        ylabel("Frequency");
        xlabel("Time");
        title(['N1-R1-Loudness-',num2str(loudness_level),' dB and Fs = ',num2str(freq(j))]);
    end
    savefig(['PowerSpectrum_Welch_N1_R1_F1_Fs_',num2str(freq(j)/1000),'KHz']);
end

%%
loudness_level = 60;
        fs_new = 4000;
        [Sig,fs,tmp]=rdsamp(['N1_evoked_raw_',num2str(loudness_level),'_F1_R1.dat']);
        recording = Sig(:,1);
        %sig_new  = downsample(recording,3);
        sig_new = resample(recording,fs_new/1000,48);
        stim_rate = floor(2002/(1000*48/(fs_new)));
        ft_size = 2*stim_rate;
        [cfs,frq] = cwt(sig_new,fs_new);
        tms = (0:numel(sig_new)-1)/fs_new;
        subplot(2,1,1);
        surface(tms,frq,abs(cfs));
        axis tight;
        shading flat;
        set(gca,"yscale","log");
        ylabel("Frequency");
        xlabel("Time");
        title(['N1-R1-Loudness-',num2str(loudness_level),' dB and Fs = ',num2str(fs_new)]);

   %%
   figure;
   for i  = 5:20
       loudness_level = 5*i;
       fs_new = 2000;
       [Sig,fs,tmp]=rdsamp(['N1_evoked_raw_',num2str(loudness_level),'_F1_R1.dat']);
       recording = Sig(:,1);
       %sig_new  = downsample(recording,3);
       sig_new = resample(recording,fs_new/1000,48);
       stim_rate = floor(2002/(1000*48/(fs_new)));
       ft_size = 2*stim_rate;
       [cfs,frq] = cwt(sig_new,fs_new);
       tms = (0:numel(sig_new)-1)/fs_new;
       subplot(5,4,i);
       surface(tms,frq,abs(cfs));
       axis tight;
       shading flat;
       set(gca,"yscale","log");
       ylabel("Frequency");
       xlabel("Time");
       title(['N1-R1-Loudness-',num2str(loudness_level),' dB and Fs = ',num2str(fs_new)]);
   end
%% CWT for 1 loudness level
        loudness_level = 20;
        fs_new = 5000;
        [Sig,fs,tmp]=rdsamp(['N1_evoked_ave',num2str(loudness_level),'_F1_R1']);
        recording = Sig(:,1);
        %sig_new  = downsample(recording,3);
        sig_new = resample(recording,fs_new/1000,48);
        stim_rate = floor(2002/(1000*48/(fs_new)));
        ft_size = 2*stim_rate;
        [cfs,frq] = cwt(sig_new,fs_new);
        tms = (0:numel(sig_new)-1)/fs_new;
        subplot(2,1,1);
        surface(tms,frq,abs(cfs));
        axis tight;
        shading flat;
        set(gca,"yscale","log");
        ylabel("Frequency");
        xlabel("Time");
        title(['N1-R1-Loudness-',num2str(loudness_level),' dB and Fs = ',num2str(fs_new)]);
%% CWT for F1_R1_avg
for i = 2:20
    loudness_level = 5*i;
    fs_new = 5000;
    [Sig,fs,tmp]=rdsamp(['N1_evoked_ave',num2str(loudness_level),'_F1_R1']);
    recording = Sig(:,1);
    %sig_new  = downsample(recording,3);
    sig_new = recording;
    [cfs,frq] = cwt(sig_new,fs_new);
    tms = (0:numel(sig_new)-1)/fs_new;
    subplot(5,4,i);
    surface(tms,frq,abs(cfs));
    axis tight;
    shading flat;
    set(gca,"yscale","log");
    ylabel("Frequency");
    xlabel("Time");
    title(['N1-R1-Loudness-',num2str(loudness_level),' dB and Fs = ',num2str(fs_new)]);
end
savefig(['PowerSpectrum_Welch_N1_R1_F4_Fs_',num2str(freq(j)/1000),'KHz']);

%% FBSE
fs = 48000;
params.SamplingRate = fs; 

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
params.completion = 0; % choose if you want to force to have params.N modes
                       % in case the algorithm found less ones (0 or 1)
params.log=1;

% Choose the results you want to display (Show=1, Not Show=0)
Bound=1;   % Display the detected boundaries on the spectrum 

          
subresf=1;
loudness_level = 15;
fs_new = 48000;
sig_new = readmatrix(['N1_average_F1_R1_',num2str(loudness_level),'.txt']);
%sig_new  = downsample(recording,3);
%sig_new = resample(recording,fs_new/1000,48);

[freq1,freq1_bndr,freq2,a3,ewt,mfb,boundaries]=FBexp(sig_new,params);
x_axis = linspace(1,length(a3),length(a3));
plot(x_axis,a3);
xlim([0 900]);
title(['FBSE Coeff ',num2str(loudness_level),' dB F1 R1']);

%% for F1,R1, FBSE coeff computation for averaged data
for i = 2:20
    fs = 3000;
    params.SamplingRate = fs; 

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
   loudness_level = 5*i;
   if(loudness_level == 20) || (loudness_level == 25)
       continue
   end
   fs_new = 3000;
   sig_new = readmatrix(['N1_average_F1_R1_',num2str(loudness_level),'.txt']);
   %sig_new  = downsample(recording,3);
   sig_new = resample(sig_new,fs_new/1000,48);

   [freq1,freq1_bndr,freq2,a3,ewt,mfb,boundaries]=FBexp(sig_new,params);
   x_axis = linspace(1,length(a3),length(a3));
   subplot(5,4,i);
   plot(x_axis,a3);
   xlim([0 200]);
   title(['FBSE Coeff ',num2str(loudness_level),' dB F1 R1']);
end
%% saving boundaries
for i = 2:20
    fs = 48000;
    params.SamplingRate = fs; 

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
   params.completion = 0; % choose if you want to force to have params.N modes
                       % in case the algorithm found less ones (0 or 1)
   params.log=1;

% Choose the results you want to display (Show=1, Not Show=0)
   Bound=1;   % Display the detected boundaries on the spectrum 

          
   subresf=1;
   loudness_level = 5*i;
   fs_new = 48000;
   sig_new = readmatrix(['N1_average_F1_R1_',num2str(loudness_level),'.txt']);
   %sig_new  = downsample(recording,3);
   %sig_new = resample(recording,fs_new/1000,48);

   [freq1,freq1_bndr,freq2,a3,ewt,mfb,boundaries]=FBexp(sig_new,params);
   x_axis = linspace(1,length(a3),length(a3));
   writematrix(boundaries,['N1_average_F1_R1_Boundaries',num2str(loudness_level),'.txt']);
end
%% Concatenation to decide boundaries
loudness_level = 10;
avg_signal = readmatrix(['N1_average_F1_R1_',num2str(loudness_level),'.txt'])
for i = 3:20
    loudness_level = 5*i
    if(loudness_level == 20)
        continue
    end
    avg_signal = cat(1,avg_signal,readmatrix(['N1_average_F1_R1_',num2str(loudness_level),'.txt']));
end
writematrix(avg_signal,'N1_F1_R1_Concatenated_avg_signal.txt');
%%

%% FBSE for concatenated average signal , 20dB left out
params.SamplingRate = fs; 

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
fs_new = 48000;
sig_new = readmatrix('N1_F1_R1_Concatenated_avg_signal.txt');
%sig_new  = downsample(recording,3);
%sig_new = resample(recording,fs_new/1000,48);

[freq1,freq1_bndr,freq2,a3,ewt,mfb,boundaries]=FBexp(sig_new,params);
x_axis = linspace(1,length(a3),length(a3));
plot(x_axis,a3);
title(['FBSE Coeff concatenated F1 R1']);
%%
writematrix(boundaries,'Boundaries_ConcatenatedSignal.txt');

%%
for i = 2:20
    fs = 3000;
    params.SamplingRate = fs; 

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
   loudness_level = 5*i;
   if(loudness_level == 20)
       continue
   end
   fs_new = 3000;
   sig_new = readmatrix(['N1_average_F1_R1_',num2str(loudness_level),'.txt']);
   %sig_new  = downsample(recording,3);
   sig_new = resample(sig_new,fs_new/1000,48);

   [freq1,freq1_bndr,freq2,a3,ewt,mfb,boundaries]=FBexp(sig_new,params);
   x_axis = linspace(1,length(a3),length(a3));
   subplot(5,4,i);
   plot(x_axis,a3);
   xlim([0 200]);
   title(['FBSE Coeff ',num2str(loudness_level),' dB F1 R1']);
end
%%
%====================Saving Boundaries==================%
% Fs = 3KHz , 1000 trials averaged data,changed Boundary detection
% algorithm
fs = 3000;
for i = 2:20
    params.SamplingRate = fs; 

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
   loudness_level = 5*i;
   sig_new = readmatrix(['N1_average_F1_R1_',num2str(loudness_level),'.txt']);
   %sig_new  = downsample(recording,3);
   sig_new = resample(sig_new,fs/1000,48);

   [freq1,freq1_bndr,freq2,a3,ewt,mfb,boundaries]=FBexp(sig_new,params);
   x_axis = linspace(1,length(a3),length(a3));
   writematrix(boundaries,['N1_average_F1_R1_Boundaries_Fs_3KHz',num2str(loudness_level),'.txt']);
end
%%
%%=============== Plotting FBEWT Filter bank ==========%%
for i = 2:20
    Fs =3000;
    fs = 3000;
    params.SamplingRate = fs; 

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
   loudness_level = 5*i;
   fs_new = 3000;
   sig_new = readmatrix(['N1_average_F1_R1_',num2str(loudness_level),'.txt']);
   %sig_new  = downsample(recording,3);
   sig_new = resample(sig_new,fs_new/1000,48);

   [freq1,freq1_bndr,freq2,a3,ewt,mfb,boundaries]=FBexp(sig_new,params);
          %ShFBEWT(abs(a3),freq1,boundaries,div,params.SamplingRate);
       xxx=(linspace(0,1,round(length(mfb{1,1}))))*Fs;
       subplot(5,4,i);
      for i=1:size(mfb)

plot(xxx,mfb{i,1});
hold on;
end
xlim([0 round(Fs/2)]);
ylim([0 3]);
title(['FBEWT filter bank ',num2str(loudness_level),' dB']);
 end

%% Mean Boundaries computation
% We take average of the boundaries obtained for all the 19 loudness levels
% as our new boundaries
boundaries = readmatrix('N1_average_F1_R1_boundaries_Fs_3KHz.txt');
boundary_mean = mean(boundaries); % These will be our new boundaries for EWT Computation
writematrix(boundary_mean,'mean_boundaries_F1_N1_R1.txt');
%% EWT computation
fs_new = 3000;
for i = 2:20
    loudness_level = 5*i;
    sig_new = readmatrix(['N1_average_F1_R1_',num2str(loudness_level),'.txt']);
    sig_new = resample(sig_new,fs_new/1000,48);
    ewt = EWT_vineet(sig_new,readmatrix('mean_boundaries_F1_N1_R1.txt'));
    writecell(ewt,['ewt_F1_N1_R1 ',num2str(loudness_level),'.txt']);
end
%%
% Fs = 3KHz , 1000 trials averaged data,changed Boundary detection
% algorithm
fs = 3000;
for i = 3:20
    params.SamplingRate = fs; 

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
   loudness_level = 5*i;
   [sig_new,fs_new,tmp] = rdsamp(['C:\Users\vinee\Downloads\average\N1_evoked_ave',num2str(loudness_level),'_F1_R1']);
   %sig_new  = downsample(recording,3);
   sig_new = resample(sig_new,fs/1000,48);

   [freq1,freq1_bndr,freq2,a3,ewt,mfb,boundaries]=FBexp(sig_new,params);
   x_axis = linspace(1,length(a3),length(a3));
   writematrix(boundaries,['N1_avg_F1_R1_Boundaries_Fs_3KHz',num2str(loudness_level),'.txt']);
end
%%
boundaries = readmatrix(['Boundaries_F4.txt']);
mean_boundaries = mean(boundaries);