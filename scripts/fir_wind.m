function h = fir_wind(wc,w,option)
%*************************************************************************
% FIR_WIND fir_wind(wc,w,option)
%
% Description: This function returns the coefficients of a lowpass filter
% designed using the window method.
%
% Input Arguments:
%	Name: wc
%	Type: scalar
%	Description: cut off frequency in radians/sample
%
%	Name: w
%	Type: vector
%	Description: vector of N window samples
%
%   Name: option
%   Type: scalar
%   Description: optional argument with values as follows
%                0– yields |H(exp(jwc))| = 1/2 (half amplitude) (default)
%                1– yields |H(exp(jwc))|^2 = 1/2 (half power or 3 dB)
%
% Output Arguments:
%	Name: h
%   Type: vector
%   Description: h, impulse response of fillter
%
% Programmer: Samir Angelo Milani Martins
%
% Creation Date: October 7, 2010
% Last Revision:
%
% Required subroutines: dft.m, freqresp.m
%
% Notes:
%
% References:
%*************************************************************************

%------------------
% Check valid input
%------------------
if (nargin ~= 2) && (nargin ~= 3)
    error('Error (fir_wind): must have 2 or 3 input arguments.');
end

if nargin == 2
    option = 0;
end

if option == 0

    % Initializing variables
    N = length(w);
    M = (N-1)/2;

    for n = 0:N-1
        if (n-M)~=0
            h(n+1) = (wc/pi)*sin(wc*(n-M))/(wc*(n-M))*w(n+1);
        else
            h(n+1) = (wc/pi)*w(n+1);
        end
    end

end