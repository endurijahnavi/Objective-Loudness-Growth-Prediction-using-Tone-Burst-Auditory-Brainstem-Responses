dir_in = 'C:\Users\vinee\Documents\BTP\Dataset'; % set directory

filelist = dir(fullfile(dir_in, '*.txt')); % get file list
fs_new = 3000;
for i = 1 : length(filelist); % iterate over files in dir
    filename = filelist(i).name;
    disp(['Processing ' num2str(i) '/' num2str(length(filelist)) ': ' filename])
    sig_new  = readmatrix(filename);
    sig_new = resample(sig_new,fs_new/1000,48);
    ewt_boundaries = readmatrix('mean_boundaries_F1_N1_R1.txt');
    ewt = EWT_vineet(sig_new,ewt_boundaries);
    writecell(ewt,'ewt_output.txt');
    data = readmatrix('ewt_output.txt');
    writematrix(data,['C:\Users\vinee\Documents\BTP\EWT_data\',filename(1:end-8),'.txt']);
    %[data, fs] = audioread(fullfile(dir_in,filename)); % Do your stuff for every file
     % add filename to output filename, but without '.wav'
end