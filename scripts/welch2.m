function S = welch2(u,w,overlap)
%*************************************************************************
% WELCH2 S = welch2(u,w,overlap)
%
% Description: This function returns the periodogram [estimate of power 
%              spectral density (PSD)] of the signal u using Welch's 
%              method of averaging periodograms taken of overlapped 
%              windows of the signal.
%
% Input Arguments:
%	Name: u
%	Type: vector
%	Description: length N input signal
%
%	Name: w
%	Type: vector
%	Description: length L window
%
%	Name: overlap
%	Type: vector
%	Description: window overlap in samples
%
% Output Arguments:
%	Name: S
%	Type: vector
%	Description: S(wk) for 0 <= k <= L - 1 where wk = exp(j2pik/L.)
%
% Programmer: Samir Angelo Milani Martins
%
% Creation Date: October 27, 2010
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
if (nargin ~= 3)
    error('Error (welch2): must have 3 input arguments.');
end

N = length(u);
L = length(w);
U = sum(w.^2)/L; % window gain
K = floor((N-L)/(L-overlap))+1; % number of windows
S = 0; % clear accumulator
start = 1;stop = L;
for i = 1:K
uu = u(start:stop).*w; % window signal
UU = fft(uu,L); % compute periodogram
S = S + (UU.*conj(UU)); % accumulate periodograms
start = start + (L - overlap); % advance window pointers
stop = stop + (L - overlap);
end;
S = S / (K*L*U); % average periodograms, divide out window and FFT gains