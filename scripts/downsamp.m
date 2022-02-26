function y = downsamp(x,D)
%*************************************************************************
% DOWNSAMP y = downsamp(x,D)
%
% Description: This function returns a downsampled signal.
%
% Input Arguments:
%	Name: x
%	Type: vector
%	Description: Input signal
%
%	Name: D
%	Type: scalar
%	Description: Downsampling factor
%
% Output Arguments:
%	Name: y
%	Type: vector
%	Description: Downsampled signal
%
% Programmer: Samir Angelo Milani Martins
%
% Creation Date: November 18, 2010
% Last Revision:
%
% Required subroutines:
%
% Notes:
%
% References:
%*************************************************************************

%------------------
% Check valid input
%------------------
if (nargin ~= 2)
    error('Error (downsamp): must have 2 input arguments.');
end;

for n = 0:(length(x)-mod(length(x),D))/D
    if (1+n*D>length(x))
        break;
    end
    y(n+1) = x(1+n*D);
end

y = y';