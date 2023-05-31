%%N1F4
freq = [5000];
for j = 1:length(freq)
    fs_new = freq(j);
    figure;
    for i = 2:20
        loudness_level = i*5;
        if(loudness_level ==15) || (loudness_level ==35)|| (loudness_level==45)||(loudness_level==55)
            [Sig,fs,tmp]=rdsamp(['N1_evoked_raw_',num2str(loudness_level),'_F4_R1_x.dat']);
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
        [Sig,fs,tmp]=rdsamp(['N1_evoked_raw_',num2str(loudness_level),'_F4_R1.dat']);
        recording = Sig(:,1);
        %sig_new  = downsample(recording,3);
        sig_new = resample(recording,fs_new/1000,48);
        stim_rate = floor(2002/(1000*48/(fs_new)));
        ft_size = 2*stim_rate;
        subplot(5,4,i);
        pwelch(sig_new,stim_rate,0,ft_size);
        title(['N1-R1-Loudness-',num2str(loudness_level),' dB and Fs = ',num2str(freq(j))]);
    end
    savefig(['PowerSpectrum_Welch_N1_R1_F4_Fs_',num2str(freq(j)/1000),'KHz']);
end

%%
%N3 F1
freq = [2000 5000 10000];
for j = 1:length(freq)
    fs_new = freq(j);
    figure;
    for i = 8:20
        loudness_level = i*5;
        [Sig,fs,tmp]=rdsamp(['N3_evoked_raw_',num2str(loudness_level),'_F1_R1.dat']);
        recording = Sig(:,1);
        %sig_new  = downsample(recording,3);
        sig_new = resample(recording,fs_new/1000,48);
        stim_rate = floor(2002/(1000*48/(fs_new)));
        ft_size = 2*stim_rate;
        subplot(5,4,i);
        pwelch(sig_new,stim_rate,0,ft_size);
        title(['N3-R1-Loudness-',num2str(loudness_level),' dB and Fs = ',num2str(freq(j))]);
    end
    savefig(['PowerSpectrum_Welch_N3_R1_F1_Fs_',num2str(freq(j)/1000),'KHz']);
end
%% N3 F4
freq = [5000];
for j = 1:length(freq)
    fs_new = freq(j);
    figure;
    for i = 6:20
        loudness_level = i*5;
        [Sig,fs,tmp]=rdsamp(['N3_evoked_raw_',num2str(loudness_level),'_F4_R1.dat']);
        recording = Sig(:,1);
        %sig_new  = downsample(recording,3);
        sig_new = resample(recording,fs_new/1000,48);
        stim_rate = floor(2002/(1000*48/(fs_new)));
        ft_size = 2*stim_rate;
        subplot(5,4,i);
        pwelch(sig_new,stim_rate,0,ft_size);
        title(['N3-R1-Loudness-',num2str(loudness_level),' dB and Fs = ',num2str(freq(j))]);
    end
    savefig(['PowerSpectrum_Welch_N3_R1_F4_Fs_',num2str(freq(j)/1000),'KHz']);
end
%% N5 F1
freq = [5000];
for j = 1:length(freq)
    fs_new = freq(j);
    figure;
    for i = 5:20
        loudness_level = i*5;
        if(loudness_level ==30) || (loudness_level ==35)|| (loudness_level==40)||(loudness_level==85)||(loudness_level==90)
            [Sig,fs,tmp]=rdsamp(['N5_evoked_raw_',num2str(loudness_level),'_F1_R1_x.dat']);
            recording = Sig(:,1);
            %sig_new  = downsample(recording,3);
            sig_new = resample(recording,fs_new/1000,48);
            stim_rate = floor(2002/(1000*48/(fs_new)));
            ft_size = 2*stim_rate;
            subplot(5,4,i);
            pwelch(sig_new,stim_rate,0,ft_size);
            title(['N5-R1-Loudness-',num2str(loudness_level),' dB and Fs = ',num2str(freq(j))]);
            continue
        end
       
        [Sig,fs,tmp]=rdsamp(['N5_evoked_raw_',num2str(loudness_level),'_F1_R1.dat']);
        recording = Sig(:,1);
        %sig_new  = downsample(recording,3);
        sig_new = resample(recording,fs_new/1000,48);
        stim_rate = floor(2002/(1000*48/(fs_new)));
        ft_size = 2*stim_rate;
        subplot(5,4,i);
        pwelch(sig_new,stim_rate,0,ft_size);
        title(['N5-R1-Loudness-',num2str(loudness_level),' dB and Fs = ',num2str(freq(j))]);
    end
    savefig(['PowerSpectrum_Welch_N5_R1_F1_Fs_',num2str(freq(j)/1000),'KHz']);
end

%% N5 F4
freq = [5000];
for j = 1:length(freq)
    fs_new = freq(j);
    figure;
    for i = 5:20
        loudness_level = i*5;
        if(loudness_level ==50) || (loudness_level ==55)
            [Sig,fs,tmp]=rdsamp(['N5_evoked_raw_',num2str(loudness_level),'_F4_R1_x.dat']);
            recording = Sig(:,1);
            %sig_new  = downsample(recording,3);
            sig_new = resample(recording,fs_new/1000,48);
            stim_rate = floor(2002/(1000*48/(fs_new)));
            ft_size = 2*stim_rate;
            subplot(5,4,i);
            pwelch(sig_new,stim_rate,0,ft_size);
            title(['N5-R1-Loudness-',num2str(loudness_level),' dB and Fs = ',num2str(freq(j))]);
            continue
        end
       
        [Sig,fs,tmp]=rdsamp(['N5_evoked_raw_',num2str(loudness_level),'_F4_R1.dat']);
        recording = Sig(:,1);
        %sig_new  = downsample(recording,3);
        sig_new = resample(recording,fs_new/1000,48);
        stim_rate = floor(2002/(1000*48/(fs_new)));
        ft_size = 2*stim_rate;
        subplot(5,4,i);
        pwelch(sig_new,stim_rate,0,ft_size);
        title(['N5-R1-Loudness-',num2str(loudness_level),' dB and Fs = ',num2str(freq(j))]);
    end
    savefig(['PowerSpectrum_Welch_N5_R1_F4_Fs_',num2str(freq(j)/1000),'KHz']);
end
%% N7 F1
freq = [5000];
for j = 1:length(freq)
    fs_new = freq(j);
    figure;
    for i = 6:20
        loudness_level = i*5;    
        [Sig,fs,tmp]=rdsamp(['N7_evoked_raw_',num2str(loudness_level),'_F1_R1.dat']);
        recording = Sig(:,1);
        %sig_new  = downsample(recording,3);
        sig_new = resample(recording,fs_new/1000,48);
        stim_rate = floor(2002/(1000*48/(fs_new)));
        ft_size = 2*stim_rate;
        subplot(5,4,i);
        pwelch(sig_new,stim_rate,0,ft_size);
        title(['N7-R1-Loudness-',num2str(loudness_level),' dB and Fs = ',num2str(freq(j))]);
    end
    savefig(['PowerSpectrum_Welch_N7_R1_F1_Fs_',num2str(freq(j)/1000),'KHz']);
end
%% N7 F4
freq = [5000];
for j = 1:length(freq)
    fs_new = freq(j);
    figure;
    for i = 6:20
        loudness_level = i*5;    
        [Sig,fs,tmp]=rdsamp(['N7_evoked_raw_',num2str(loudness_level),'_F4_R1.dat']);
        recording = Sig(:,1);
        %sig_new  = downsample(recording,3);
        sig_new = resample(recording,fs_new/1000,48);
        stim_rate = floor(2002/(1000*48/(fs_new)));
        ft_size = 2*stim_rate;
        subplot(5,4,i);
        pwelch(sig_new,stim_rate,0,ft_size);
        title(['N7-R1-Loudness-',num2str(loudness_level),' dB and Fs = ',num2str(freq(j))]);
    end
    savefig(['PowerSpectrum_Welch_N7_R1_F4_Fs_',num2str(freq(j)/1000),'KHz']);
end

