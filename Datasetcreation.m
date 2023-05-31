% %======= Creating Training and Test resampled_dataset for Deep learning model =====%
% % loudness_level = 15;
% % sig_new = readmatrix(['N1_average_F1_R1_',num2str(loudness_level),'.txt']);
% % ewt_data = readmatrix(['ewt_F1_N1_R1 10.txt']);
% % for i = 1:10
% %     min_value = min(ewt_data(i,:));
% %     if(min_value < 0)
% %         ewt_data(i,:) = ewt_data(i,:) - min_value;
% %         min_value = min(ewt_data(i,:));
% %     end
% % end
% % normalized_ewt_data = zscore(ewt_data,1,2);
% % writematrix(normalized_ewt_data,['C:\Users\vinee\Documents\BTP\resampled_dataset\','ewt_F1_N1_R1_','15dB','.txt']);
% 
% %%==== resampled_dataset for F1 =====%%
% % Created provided given the average raw files
% % %%
% % fs_new = 3000;
% % n = 'N1';
% % r = 'R1';
% % % F1 R1
% % for j = 2:20
% %     loudness_level = 5*j;
% %     sig_new = readmatrix(['N1_average_F1_R1_',num2str(loudness_level),'.txt']);
% %     sig_new = resample(sig_new,fs_new/1000,48);
% %     file_name = ['mean_boundaries_F1_',n,'_',r,'.txt']
% %     ewt = EWT_vineet(sig_new,readmatrix(['mean_boundaries_F1_',n,'_',r,'.txt']));
% %     writecell(ewt,['ewt_F1_',n,'_',r,'_',num2str(loudness_level),'.txt']);
% %     ewt_data = readmatrix(['ewt_F1_',n,'_',r,'_',num2str(loudness_level),'.txt']);
% %     for i = 1:10
% %         min_value = min(ewt_data(i,:));
% %         if(min_value < 0)
% %             ewt_data(i,:) = ewt_data(i,:) - min_value;
% %             min_value = min(ewt_data(i,:));
% %         end
% %     end
% %     normalized_ewt_data = zscore(ewt_data,1,2);
% %     writematrix(normalized_ewt_data,['C:\Users\vinee\Documents\BTP\resampled_dataset\','ewt_F1_',n,'_',r,'_',num2str(loudness_level),'dB','.txt']);
% % end
% %%
% for p = 2:20
%     loudness_level = p*5;
%     if(loudness_level == 20)
%         [signal,Fs,tm]=rdsamp(['N1_evoked_raw_',num2str(loudness_level),'_F1_R1_x']);
%         abr_recording = signal(:,1);
%         avg_raw = zeros(2002);
%         for i = 1:1000
%             for j = 1:2002
%                 avg_raw(j) = avg_raw(j) + abr_recording(2002*(i-1)+j);
%             end
%         end
%         avg_raw = avg_raw(:,1)/1000;
%         writematrix(avg_raw,['N1_average_F1_R1_',num2str(loudness_level),'.txt']);
%         continue
%     end
%     [signal,Fs,tm]=rdsamp(['N1_evoked_raw_',num2str(loudness_level),'_F1_R1']);
%     abr_recording = signal(:,1);
%     avg_raw = zeros(2002);
%     for i = 1:1000
%         for j = 1:2002
%             avg_raw(j) = avg_raw(j) + abr_recording(2002*(i-1)+j);
%         end
%     end
%     avg_raw = avg_raw(:,1)/1000;
%     writematrix(avg_raw,['N1_average_F1_R1_',num2str(loudness_level),'.txt']);
% end
% 
%% resampled_dataset creation F1 R1 N1 - 1000 cycles 
n = 'N1';
r = 'R1';
for  p = 2:20
    loudness_level  = p*5;
    if(loudness_level ==20)
        [signal,Fs,tm]=rdsamp(['N1_evoked_raw_',num2str(loudness_level),'_F1_R1_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    [signal,Fs,tm]=rdsamp(['N1_evoked_raw_',num2str(loudness_level),'_F1_R1']);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%% resampled_dataset creation for F1 R2 N1 - 1000 cycles
n = 'N1';
r = 'R1';
for  p = 2:20
    loudness_level  = p*5;
    if(loudness_level ==20)
        [signal,Fs,tm]=rdsamp(['N1_evoked_raw_',num2str(loudness_level),'_F1_R1_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    [signal,Fs,tm]=rdsamp(['N1_evoked_raw_',num2str(loudness_level),'_F1_R1']);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%% N1 F1 R1
n = 'N1';
r = 'R1';
for  p = 2:20
    loudness_level  = p*5;
    if(loudness_level ==20)
        [signal,Fs,tm]=rdsamp(['N1_evoked_raw_',num2str(loudness_level),'_F1_R1_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    [signal,Fs,tm]=rdsamp(['N1_evoked_raw_',num2str(loudness_level),'_F1_R1']);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%% resampled_dataset creation for F1 R2 N1 - 1000 cycles
n = 'N1';
r = 'R2';
for  p = 2:20
    loudness_level  = p*5;
    if(loudness_level ==30) || (loudness_level == 35) ||(loudness_level == 45 ) || (loudness_level==50) || (loudness_level ==70) || (loudness_level == 80) || (loudness_level == 85)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
n = 'N1';
r = 'R3';
for  p = 2:20
    loudness_level  = p*5;
    if(loudness_level ==15) || (loudness_level == 95) ||(loudness_level == 75 )
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
n = 'N1';
r = 'R4';
for  p = 2:20
    loudness_level  = p*5;
    if(loudness_level ==15) || (loudness_level == 20)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if(loudness_level == 95) || (loudness_level == 100)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
n = 'N1';
r = 'R5';
for  p = 2:20
    loudness_level  = p*5;
    if (loudness_level == 20)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if(loudness_level == 80) || (loudness_level == 95) ||(loudness_level == 100)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
n = 'N1';
r = 'R6';
for  p = 2:20
    loudness_level  = p*5;
    if (loudness_level == 20) || (loudness_level == 45) || (loudness_level == 50) || (loudness_level == 55) ||(loudness_level == 20) || (loudness_level == 65) || (loudness_level == 70)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if(loudness_level == 80) || (loudness_level == 75) ||(loudness_level == 100) || (loudness_level == 95)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
n = 'N1';
r = 'R7';
for  p = 2:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if(loudness_level == 80) || (loudness_level == 75) ||(loudness_level == 100) || (loudness_level == 95) || (loudness_level ==20)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
n = 'N1';
r = 'R8';
for  p = 2:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if(loudness_level == 80) || (loudness_level == 75) ||(loudness_level == 100) || (loudness_level == 95) || (loudness_level ==20) || (loudness_level == 70) || (loudness_level == 90)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%% === Dataset generation for N2 ==========%%%%%%%
%%
n = 'N2';
r = 'R1';
for  p = 2:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n2\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if(loudness_level == 10) || (loudness_level == 15) ||(loudness_level == 20) || (loudness_level == 25) || (loudness_level ==30) || (loudness_level == 35)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n2\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
n = 'N2';
r = 'R2';
for  p = 2:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n2\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if(loudness_level == 10) || (loudness_level == 15) ||(loudness_level == 20) || (loudness_level == 25) || (loudness_level ==30) || (loudness_level == 35)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n2\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
n = 'N2';
r = 'R3';
for  p = 2:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n2\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if(loudness_level == 10) || (loudness_level == 15) ||(loudness_level == 20) || (loudness_level == 25) || (loudness_level ==30) || (loudness_level == 35)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n2\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
n = 'N2';
r = 'R4';
for  p = 2:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n2\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if(loudness_level == 10) || (loudness_level == 15) ||(loudness_level == 20) || (loudness_level == 25) || (loudness_level ==30) || (loudness_level == 35)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n2\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
n = 'N2';
r = 'R5';
for  p = 2:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n2\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if(loudness_level == 10) || (loudness_level == 15) ||(loudness_level == 20) || (loudness_level == 25) || (loudness_level ==30) || (loudness_level == 35)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n2\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
n = 'N2';
r = 'R6';
for  p = 2:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n2\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if(loudness_level == 10) || (loudness_level == 15) ||(loudness_level == 20) || (loudness_level == 25) || (loudness_level ==30) || (loudness_level == 35) || (loudness_level == 90)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n2\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
n = 'N2';
r = 'R7';
for  p = 2:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n2\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if(loudness_level == 10) || (loudness_level == 15) ||(loudness_level == 20) || (loudness_level == 25) || (loudness_level ==30) || (loudness_level == 35) || (loudness_level == 90)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n2\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%

n = 'N2';
r = 'R8';
for  p = 2:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n2\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if(loudness_level == 10) || (loudness_level == 15) ||(loudness_level == 20) || (loudness_level == 25) || (loudness_level ==30) || (loudness_level == 35) || (loudness_level == 90)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n2\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
% Dataset for N4, % N3 will be taken as test subject
n = 'N4';
r = 'R1';
for  p = 6:20
    loudness_level  = p*5;
    if (loudness_level == 50)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n4\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if(loudness_level == 200)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n4\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%

n = 'N4';
r = 'R2';
for  p = 6:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n4\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if(loudness_level == 200)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n4\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
n = 'N4';
r = 'R3';
for  p = 6:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n4\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if(loudness_level == 200)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n4\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
n = 'N4';
r = 'R4';
for  p = 6:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n4\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if(loudness_level == 200) || (loudness_level == 85) || (loudness_level == 90) || (loudness_level == 95)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n4\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%

n = 'N4';
r = 'R5';
for  p = 6:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n4\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if(loudness_level == 100) || (loudness_level == 85) || (loudness_level == 90) || (loudness_level == 95)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n4\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%

n = 'N4';
r = 'R6';
for  p = 6:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n4\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if(loudness_level == 100) || (loudness_level == 85) || (loudness_level == 90) || (loudness_level == 95) || (loudness_level == 80)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n4\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
n = 'N4';
r = 'R7';
for  p = 6:13
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n4\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if(loudness_level == 100) || (loudness_level == 85) || (loudness_level == 90) || (loudness_level == 95) || (loudness_level == 80)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n4\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
n = 'N4';
r = 'R8';
for  p = 6:12
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n4\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if(loudness_level == 100) || (loudness_level == 85) || (loudness_level == 90) || (loudness_level == 95) || (loudness_level == 80)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n4\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
n = 'N4';
r = 'R9';
for  p = 6:12
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n4\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if(loudness_level == 100) || (loudness_level == 85) || (loudness_level == 90) || (loudness_level == 95) || (loudness_level == 80)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n4\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
%Dataset for N5
n = 'N5';
r = 'R1';
for  p = 5:20
    loudness_level  = p*5;
    if (loudness_level == 30) || (loudness_level == 35) || (loudness_level == 40) || (loudness_level == 90) || (loudness_level == 85)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n5\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if(loudness_level == 2000)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n5\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
n = 'N5';
r = 'R2';
for  p = 5:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n5\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if(loudness_level == 2000)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n5\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
n = 'N5';
r = 'R3';
for  p = 5:20
    loudness_level  = p*5;
    if (loudness_level == 100)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n5\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if(loudness_level == 2000)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n5\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
n = 'N5';
r = 'R4';
for  p = 5:20
    loudness_level  = p*5;
    if (loudness_level == 45) || (loudness_level == 50) || (loudness_level == 55) ||(loudness_level == 60) 
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n5\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if(loudness_level == 2000)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n5\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
n = 'N5';
r = 'R5';
for  p = 5:20
    loudness_level  = p*5;
    if (loudness_level == 25) || (loudness_level == 35) || (loudness_level == 40) ||(loudness_level == 100) || (loudness_level == 90)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n5\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if(loudness_level == 80) || (loudness_level == 85) || (loudness_level == 95)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n5\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
n = 'N5';
r = 'R6';
for  p = 5:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n5\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if(loudness_level == 80) || (loudness_level == 85) || (loudness_level == 95)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n5\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
n = 'N5';
r = 'R7';
for  p = 5:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n5\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if(loudness_level == 80) || (loudness_level == 85) || (loudness_level == 95) || (loudness_level == 100) || (loudness_level == 65) || (loudness_level == 70)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n5\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
n = 'N5';
r = 'R8';
for  p = 5:20
    loudness_level  = p*5;
    if (loudness_level == 40) || (loudness_level == 60)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n5\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if(loudness_level == 80) || (loudness_level == 85) || (loudness_level == 95) || (loudness_level == 100) || (loudness_level == 65) || (loudness_level == 70) || (loudness_level == 75)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n5\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
% Dataset for N6

n = 'N6';
r = 'R1';
for  p = 6:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n6\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if (loudness_level == 200)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n6\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%

n = 'N6';
r = 'R2';
for  p = 6:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n6\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if (loudness_level == 200)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n6\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
n = 'N6';
r = 'R3';
for  p = 6:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n6\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if (loudness_level == 200)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n6\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
n = 'N6';
r = 'R4';
for  p = 6:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n6\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if (loudness_level == 200)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n6\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
n = 'N6';
r = 'R5';
for  p = 6:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n6\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if (loudness_level == 200)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n6\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
cd ..;
cd n6f1r6;
n = 'N6';
r = 'R6';
for  p = 6:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n6\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if (loudness_level == 200)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n6\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
cd ..;
cd n6f1r7;
n = 'N6';
r = 'R7';
for  p = 6:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n6\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if (loudness_level == 200)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n6\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
cd ..;
cd n6f1r8;
n = 'N6';
r = 'R8';
for  p = 6:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n6\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if (loudness_level == 200)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n6\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
cd ..;
cd n6f1r10;
n = 'N6';
r = 'R10';
for  p = 6:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n6\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if (loudness_level == 200)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n6\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
cd ..;
cd n6f1r9;
n = 'N6';
r = 'R9';
for  p = 6:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n6\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if (loudness_level == 200)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n6\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
% Dataset for N7
n = 'N7';
r = 'R1';
for  p = 6:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n7\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if (loudness_level == 200)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n7\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
cd ..;
cd n7f1r2;
n = 'N7';
r = 'R2';
for  p = 6:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n6\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if (loudness_level == 200)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n7\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
cd ..;
cd n7f1r3;
n = 'N7';
r = 'R3';
for  p = 6:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n7\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if (loudness_level == 200)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n7\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
cd ..;
cd n7f1r4;
n = 'N7';
r = 'R4';
for  p = 6:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n7\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if (loudness_level == 200)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n7\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
cd ..;
cd n7f1r5;
n = 'N7';
r = 'R5';
for  p = 6:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n7\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if (loudness_level == 200)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n7\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
cd ..;
cd n7f1r6;
n = 'N7';
r = 'R6';
for  p = 6:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n7\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if (loudness_level == 200)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n7\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
cd ..;
cd n7f1r7;
n = 'N7';
r = 'R7';
for  p = 6:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n7\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if (loudness_level == 200)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n7\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
cd ..;
cd n7f1r8;
n = 'N7';
r = 'R8';
for  p = 6:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n7\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if (loudness_level == 200)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n7\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
n = 'N3';
r = 'R1';
for  p = 8:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n3\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if (loudness_level == 200)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n3\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
n = 'N3';
r = 'R2';
for  p = 8:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n3\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if (loudness_level == 200)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n3\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
n = 'N3';
r = 'R3';
for  p = 8:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n3\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if (loudness_level == 200)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F1_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f1_n3\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end