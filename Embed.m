function Xe=Embed(Xm,M,L)

% This routine computed performs a time-delay embedding for time series x
% Author: Mehrnaz Kh. Hazrati, 2013
% INPUTS
% Input Xm represents input time series
% Input M represents embedding dimension 
% Input L represents time delay 

% OUTPUT
% Output Xe represents the time-series embedded in
% M dimensional space with L delay


Xe=[]; % Initialize output
S=size(Xm,2);

if S==1
    error('X must be a "horizontal" vector')
end

for i=1:S-(M-1)*L
    Xe = [Xe; Xm(i:L:i+(M-1)*L)];
end
