loudness_level = 10;
[signal,Fs,tm]=rdsamp(['N1_evoked_raw_',num2str(loudness_level),'_F1_R1']);
[signalinfo,fs,sigclass] = wfdbdesc(['N1_evoked_raw_',num2str(loudness_level),'_F1_R1']);
abr_recording = signal(:,1);
avg_raw = zeros(2002);
for i = 1:1000
    for j = 1:2002
        avg_raw(j) = avg_raw(j) + abr_recording(2002*(i-1)+j);
    end
end
avg_raw = avg_raw(:,1)/1000;
samples = linspace(1,2002,2002);
writematrix(avg_raw,['N1_average_F1_R1_',num2str(loudness_level),'.txt']);
%% 1000 trials, F1_R1_N1
for p = 2:20
    loudness_level = p*5;
    if(loudness_level == 20)
        [signal,Fs,tm]=rdsamp(['N1_evoked_raw_',num2str(loudness_level),'_F1_R1_x']);
        abr_recording = signal(:,1);
        avg_raw = zeros(2002);
        for i = 1:1000
            for j = 1:2002
                avg_raw(j) = avg_raw(j) + abr_recording(2002*(i-1)+j);
            end
        end
        avg_raw = avg_raw(:,1)/1000;
        writematrix(avg_raw,['N1_average_F1_R1_',num2str(loudness_level),'.txt']);
        continue
    end
    [signal,Fs,tm]=rdsamp(['N1_evoked_raw_',num2str(loudness_level),'_F1_R1']);
    abr_recording = signal(:,1);
    avg_raw = zeros(2002);
    for i = 1:1000
        for j = 1:2002
            avg_raw(j) = avg_raw(j) + abr_recording(2002*(i-1)+j);
        end
    end
    avg_raw = avg_raw(:,1)/1000;
    writematrix(avg_raw,['N1_average_F1_R1_',num2str(loudness_level),'.txt']);
end
%%
