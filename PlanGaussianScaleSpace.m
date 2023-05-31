function plane=PlanGaussianScaleSpace(f)

%==========================================================================
% function plane=PlanGaussianScaleSpace(f)
%
% This function build the scale-space representation of f by successive
% convolution with Gausians of different sizes. The function automatically 
% estimates how many scales are needed.
%
% Inputs:
%   -f: the input function
%
% Outputs:
%   -plane: the scale-space representation of f (the horizontal axis 
%           corresponds to the scales)
%
% Author: Jerome Gilles
% Institution: UCLA - Department of Mathematics
% Year: 2013
% Version: 1.0
% =========================================================================

dt=0.25;

Niter=length(f)/sqrt(dt);
Niter=4000;
plane=zeros(length(f),Niter+1);
bounds=LocalMaxMin2(f,-1);

plane(bounds)=1;
N=zeros(1,Niter+1);
N(1)=length(bounds);

%tp=0.01; % pause time
% lm=2;
% lp=length(f)-1;
% taxis=lm:lp;
% figure(1);plot(taxis,f(lm:lp));
% axis([lm lp 0 max(f(lm:lp))]);
% pause
 
t=dt;
for i=1:Niter
    %build the kernel in Fourier domain
    M=ceil(6*sqrt(t)+1);
    n=-M:M;
    ker=(1/(sqrt(2*pi)*t))*exp(-n.^2/(2*t));
    
    %filtering
    filt=conv(f,ker,'same');

    %extract minima
    bounds=LocalMaxMin2(filt,-1);
    plane(bounds,i+1)=1;
    N(i+1)=length(bounds);

%    figure(1);plot(taxis,filt(lm:lp));
%    axis([lm lp 0 max(f(lm:lp))]);
%    name=sprintf('scale%04d.png',i);
%    saveas(gcf,name,'png');
      
%    name=sprintf('minima%04d.png',i);
%    imwrite(plane,name,'png');
%    pause(tp)

    if N(i+1)==1
        break
    end
    t=t+dt;
end
%figure;imshow(plane);title('Scale-space minima');
%figure;plot(N/sum(N));title('Number of minima');
