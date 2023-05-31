%%
n = 'N1';
r = 'R1';
for  p = 8:20
    loudness_level  = p*5;
    if (loudness_level == 200)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F4_',r,'_x']);
        abr_recording = signal(:,1);
        for cycle = 1:1000
            file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
            file  = resample(file,3,48);
            writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f4_n1\','F4_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
        end
        continue
    end
    if (loudness_level == 200)
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F4_',r]);
    abr_recording = signal(:,1);
    for cycle = 1:1000
        file = abr_recording((cycle-1)*2002+1:(cycle)*2002);
        file  = resample(file,3,48);
        writematrix(file,['C:\Users\vinee\Documents\BTP\resampled_dataset_f4_n1\','F1_raw_',n,'_',r,'_','cycle_',num2str(cycle),'_',num2str(loudness_level),'.txt']);
    end
end
%%
n = 'N1';
r = 'R1'
for p = 2:20
    loudness_level = p*5;
    if(loudness_level == 15 || loudness_level == 35 || loudness_level ==45 || loudness_level == 55)
        [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F4_',r,'_x']);
        abr_recording = signal(:,1);
        avg_raw = zeros(2002);
        for i = 1:1000
            for j = 1:2002
                avg_raw(j) = avg_raw(j) + abr_recording(2002*(i-1)+j);
            end
        end
        avg_raw = avg_raw(:,1)/1000;
        writematrix(avg_raw,['C:/Users/vinee/Documents/BTP/n1f4/N1_average_F4_R1_',num2str(loudness_level),'.txt']);
        continue
    end
    [signal,Fs,tm]=rdsamp([n,'_evoked_raw_',num2str(loudness_level),'_F4_',r]);
    abr_recording = signal(:,1);
    avg_raw = zeros(2002);
    for i = 1:1000
        for j = 1:2002
            avg_raw(j) = avg_raw(j) + abr_recording(2002*(i-1)+j);
        end
    end
    avg_raw = avg_raw(:,1)/1000;
    writematrix(avg_raw,['C:/Users/vinee/Documents/BTP/n1f4/N1_average_F4_R1_',num2str(loudness_level),'.txt']);
end
%%
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
   sig_new = readmatrix(['C:/Users/vinee/Documents/BTP/n1f4/N1_average_F4_R1_',num2str(loudness_level),'.txt']);
   %sig_new  = downsample(recording,3);
   sig_new = resample(sig_new,fs/1000,48);

   [freq1,freq1_bndr,freq2,a3,ewt,mfb,boundaries]=FBexp(sig_new,params);
   x_axis = linspace(1,length(a3),length(a3));
   writematrix(boundaries,['N4R1_Boundaries_',num2str(loudness_level),'.txt']);
end

