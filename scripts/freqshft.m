function g = freqshft(h,wo)
%*************************************************************************
% FREQSHFT g = freqshft(h,wo)
%
% Description: This function shifts the frequency response of the
%              filter, h by w0. The resulting impulse response is
%              returned as g.
%
% Input Arguments:
%	Name: h
%	Type: vector
%	Description: impulse response of prototype filter.
%
%	Name: wo
%	Type: scalar
%	Description: frequency in radians/sample of shift.
%
% Output Arguments:
%	Name: g
%	Type: vector
%	Description: impulse response of resulting filter.
%
% Programmer: Samir Angelo Milani Martins
%
% Creation Date: October 14, 2010
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
    error('Error (freqshft): must have 2 input arguments.');
end

% h as a row vector
if size(h,2) == 1
    h = conj(h');
end

% Initializing variables
n = 1:length(h);

if (wo==pi) && (isempty(find(imag(h) ~= 0)))

    g = real(h.*exp(1i*wo*(n-1)));

else

    g = h.*exp(1i*wo*(n-1));

end

% g as a collumn vector
g = conj(g');