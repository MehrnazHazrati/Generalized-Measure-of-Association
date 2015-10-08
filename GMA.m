function [gma] = GMA(Xm,Ym,varargin)

% This routine computes Generalized Meausre of Assocication (GMA) between
% two time series Xm and Ym
% Author: Mehrnaz Kh. Hazrati, 2013 (modified version)
%         Bilal Fadallah, 2012 
% INPUTS
% Input Xm represents input time series
% Input Ym represents input time series

% Note: For tGMA version : Xm and Ym should be embedded vectors

% OUTPUT
% Output gma represents the GMA value

[nx,dx] = size(Xm); [ny,dy] = size(Ym);

if nx ~= ny || dx ~= dy
        error('X and Y must be the same number of rows and columns')
end

if Xm == Ym
    val=1;
    return
end

Kx = zeros(nx,nx); Ky = zeros(ny,ny);

for count = 1:dx
    Kx = Kx + ( repmat(Xm(:,count),1,nx) - repmat((Xm(:,count))',nx,1)).^2;
end
Kx = sqrt(Kx);

for count = 1:dy
    Ky = Ky + ( repmat(Ym(:,count),1,ny) - repmat((Ym(:,count))',ny,1)).^2;
end
Ky = sqrt(Ky);

Kx(logical(eye(size(Kx)))) = Inf;
Ky(logical(eye(size(Ky)))) = Inf;

[minvaluex, minindexx]=min(Kx);

for smp = 1:ny
    rankAllminxy(smp,1) = sum(Ky(:,smp) <= Ky(minindexx(smp),smp));
end

for smp = 1:ny-1
    empCDF(smp) = mean(rankAllminxy  <= smp);
end

gma=sum(empCDF)/length(empCDF);



