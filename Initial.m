[signal,Fs,tm]=rdsamp('N1_evoked_raw_15_F1_R1');
[signalinfo,fs,sigclass] = wfdbdesc('N1_evoked_raw_15_F1_R1');
signalinfo.StartTime
signalinfo.SignalIndex
signalinfo.SamplingFrequency
signalinfo.RecordName
signalinfo.LengthTime
signalinfo.LengthSamples
signalinfo.IO
signalinfo.InitialValue
signalinfo.Gain
signalinfo.Format
signalinfo.File
signalinfo.Description
signalinfo.CheckSum
signalinfo.Baseline
signalinfo.AdcZero
signalinfo.AdcResolution
sigclass(:,:);
%%
signal(1:3,2);
abr_recording = signal(:,1);
length(abr_recording);
signal_new  = downsample(abr_recording,3);
tt = (0:1:length(signal_new))*(1/16000);
% time_ = [];
% for i = 1:length(signal_new)
%     time_(i) = (1/16000)*(i-1);
% end
stimuli_rate = floor(2002/3);
fft_size = 2*stimuli_rate;
first_half = floor(fft_size/2)+1;
no_fft = floor(length(signal_new)/stimuli_rate);
fft_matrix = zeros(first_half,no_fft);
a = 1;
b = tt(stimuli_rate);
for i = 1:no_fft
   spec = fft(signal_new(a:a+stimuli_rate-1),fft_size);
   first_half_fft = 20*log10(abs(spec(1:first_half)));
   fft_matrix(:,i) = first_half_fft;
   a = a+stimuli_rate;
end


figure;
%% 
for i = 2:20
    loudness_level = i*5;
    if (loudness_level==20)
         [Sig,fs,tmp]=rdsamp(['N1_evoked_raw_',num2str(loudness_level),'_F1_R1_x.dat']);
         recording = Sig(:,1);
         fs_new = 2e3;
         %sig_new  = downsample(recording,3);
         sig_new = resample(recording,fs_new/1000,48);
         stim_rate = floor(2002/(1000*48/(fs_new)));
         ft_size = 2*stim_rate;
         subplot(5,4,i);
         spectrogram(sig_new,stim_rate,0,ft_size,fs_new,'xaxis');
         title(['N1-R1-Loudness-',num2str(loudness_level),' dB']);
         continue

    end
    [Sig,fs,tmp]=rdsamp(['N1_evoked_raw_',num2str(loudness_level),'_F1_R1.dat']);
    recording = Sig(:,1);
    fs_new = 2e3;
    %sig_new  = downsample(recording,3);
    sig_new = resample(recording,fs_new/1000,48);
    stim_rate = floor(2002/(1000*48/(fs_new)));
    ft_size = 2*stim_rate;
    subplot(5,4,i);
    spectrogram(sig_new,stim_rate,0,ft_size,fs_new,'xaxis');
    title(['N1-R1-Loudness-',num2str(loudness_level),' dB']);

end

%%
%Plotting spectrograms for sampling frequencies 2k,5k,10k Hz
freq = [2000 5000 10000];
for j = 1:length(freq)
    fs_new = freq(j);
    figure;
    for i = 2:20
        loudness_level = i*5;
        if (loudness_level==20)
            [Sig,fs,tmp]=rdsamp(['N1_evoked_raw_',num2str(loudness_level),'_F1_R1_x.dat']);
            recording = Sig(:,1);
            %sig_new  = downsample(recording,3);
            sig_new = resample(recording,fs_new/1000,48);
            stim_rate = floor(2002/(1000*48/(fs_new)));
            ft_size = 2*stim_rate;
            subplot(5,4,i);
            spectrogram(sig_new,stim_rate,0,ft_size,fs_new,'xaxis');
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
        spectrogram(sig_new,stim_rate,0,ft_size,fs_new,'xaxis');
        title(['N1-R1-Loudness-',num2str(loudness_level),' dB and Fs = ',num2str(freq(j))]);
    end
    savefig(['Loudness_N1_R1_',num2str(freq(j)),'Hz']);
end
%%
%Average raw ABR data 1000 trials, 2002 samples per trial
%Performed for 100dB,F1,R1,1KHz already loaded data

avg_raw = zeros(2002);
for i = 1:1000
    for j = 1:2002
        avg_raw(j) = avg_raw(j) + abr_recording(2002*(i-1)+j);
    end
end
avg_raw = avg_raw(:,1)/1000;
samples = linspace(1,2002,2002);
plot(samples,avg_raw);
%% Calculating Power Spectrum for 2,5,10 KHz 
freq = [2000 5000 10000];
for j = 1:length(freq)
    fs_new = freq(j);
    figure;
    for i = 2:20
        loudness_level = i*5;
        if (loudness_level==20)
            [Sig,fs,tmp]=rdsamp(['N1_evoked_raw_',num2str(loudness_level),'_F1_R1_x.dat']);
            recording = Sig(:,1);
            %sig_new  = downsample(recording,3);
            sig_new = resample(recording,fs_new/1000,48);
            stim_rate = floor(2002/(1000*48/(fs_new)));
            ft_size = 2*stim_rate;
            subplot(5,4,i);
            pspectrum(sig_new,fs_new);
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
        periodogram(sig_new,'rectangular',fs_new);
        title(['N1-R1-Loudness-',num2str(loudness_level),' dB and Fs = ',num2str(freq(j))]);
    end
    savefig(['PeriodogramSpectrum_N1_R1_',num2str(freq(j)),'Hz']);
end
%% Calculating power spectrum using pwelch
freq = [2000 5000 10000];
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
            pwelch(sig_new,stim_rate,0,ft_size);
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
        pwelch(sig_new,stim_rate,0,ft_size);
        title(['N1-R1-Loudness-',num2str(loudness_level),' dB and Fs = ',num2str(freq(j))]);
    end
    savefig(['PowerSpectrum_Welch_N1_R1_F1_Fs_',num2str(freq(j)/1000),'KHz']);
end
%% Power spectrum manual computation
freq = [2000 5000 10000];
for j = 1:length(freq)
    fs_new = freq(j);
    figure;
    for i = 2:20
        loudness_level = i*5;
        if (loudness_level==20)
            continue
        end
        [Sig,fs,tmp]=rdsamp(['N1_evoked_raw_',num2str(loudness_level),'_F1_R1.dat']);
        recording = Sig(:,1);
        %sig_new  = downsample(recording,3);
        sig_new = resample(recording,fs_new/1000,48);
        stim_rate = floor(2002/(1000*48/(fs_new)));
        ft_size = 2*stim_rate;
        subplot(5,4,i);
        spectrogram(sig_new,stim_rate,0,fs_new)
        title(['N1-R1-Loudness-',num2str(loudness_level),' dB and Fs = ',num2str(freq(j))]);
    end
    savefig(['PowerSpectrum_Welch_N1_R1_',num2str(freq(j)),'Hz']);
end

%%
L = spectrogram(sig_new,stim_rate,0,ft_size,fs_new);
mean_array = mean(L,2);
x_axes_array = linspace(1,size(L,1),size(L,1));
plot(x_axes_array,abs(mean_array));
%%
[avg_signal,avg_Fs,avg_tm]=rdsamp('N1_evoked_ave100_F1_R1');
[signalinfo,fs,sigclass] = wfdbdesc('N1_evoked_raw_100_F1_R1');
signalinfo.StartTime;
signalinfo.SignalIndex;
signalinfo.SamplingFrequency;
signalinfo.RecordName;
signalinfo.LengthTime;
signalinfo.LengthSamples;
signalinfo.IO;
signalinfo.InitialValue;
signalinfo.Gain;
signalinfo.Format;
signalinfo.File;
signalinfo.Description;
signalinfo.CheckSum;
signalinfo.Baseline;
signalinfo.AdcZero;
signalinfo.AdcResolution;
sigclass(:,:);

%%
% We fix sampling frequency to be 5KHz, and we check the spectrum for Persons
% N1,N3,N5,N7 for 1KHz and 4KHz.

% N1 1KHz
% Already performed

%N1 4KHz

%%

stimuli_rate = floor(2002/3);
fft_size = 2*stimuli_rate;
first_half = floor(fft_size/2)+1;
no_fft = floor(length(signal_new)/stimuli_rate);
fft_matrix = zeros(first_half,no_fft);
a = 1;
b = tt(stimuli_rate);
for i = 1:no_fft
   spec = fft(signal_new(a:a+stimuli_rate-1),fft_size);
   first_half_fft = 20*log10(abs(spec(1:first_half)));
   fft_matrix(:,i) = first_half_fft;
   a = a+stimuli_rate;
end



