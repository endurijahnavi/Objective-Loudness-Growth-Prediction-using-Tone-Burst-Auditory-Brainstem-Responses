tt = (0:1:length(signal_new))*(1/16000);
 = floor(2002/3); % since fs = 16KHz
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