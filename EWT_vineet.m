function ewt = EWT_vineet(f,boundaries)

%===========================================
%function EWT = ewt(f,boundaries)
% takes the signal and the desired boundaries and gives the
% ewt with the desired boundaries
%===========================================
f = f';
l=round(length(f)/2);
f = f';
f=[f(l-1:-1:1);f;f(end:-1:end-l+1)];
ff=fft(f);
 
 
% We build the corresponding filter bank
mfb=EWT_Meyer_FilterBank(boundaries,length(ff));
 
% We filter the signal to extract each subband
ewt=cell(length(mfb),1);
for k=1:length(mfb)
    ewt{k}=real(ifft(conj(mfb{k}).*ff));
    ewt{k}=ewt{k}(l:end-l);
end