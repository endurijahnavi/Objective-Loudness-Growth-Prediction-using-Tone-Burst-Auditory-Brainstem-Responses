
%% For performing CWT on average data
% This is the case for Person N1(R1), 1KHz stimulus frequency, Threshold
% loudness level is 30dB. 
for i = 2:20
    loudness_level = 5*i;
    fs_new = 48000;
    [Sig,fs,tmp]=rdsamp(['N1_evoked_ave',num2str(loudness_level),'_F1_R1']); % reading the signal
    recording = Sig(:,1); % reading the signal
    sig_new = recording;
    [cfs,frq] = cwt(sig_new,fs_new); % performing cwt
    tms = (0:numel(sig_new)-1)/fs_new;
    subplot(5,4,i);% plotting
    surface(tms,frq,abs(cfs));% plotting
    axis tight;% plotting
    shading flat;% plotting
    set(gca,"yscale","log");% plotting
    ylabel("Frequency");% plotting
    xlabel("Time");% plotting
    title(['N1-R1-Loudness-',num2str(loudness_level),' dB and Fs = ',num2str(fs_new)]);% plotting
end

