function [b,a] = bttrwrth(N,wc)
%*************************************************************************
% BTTRWRTH [b,a] = bttrwrth(N,wc)
%
% Description: This function returns the Nth order LP digital Butterworth 
%              filter coefficients in length N +1 vectors b and a. The 
%              cut-off frequency is wc in radians/sample.
%
% Input Arguments:
%	Name: N
%	Type: scalar
%	Description: filter order.
%
%	Name: wc
%	Type: scalar
%	Description: cutoff frequency.
%
% Output Arguments: 
%
%	Name: b
%	Type: vector
%	Description: vector of feedforward gains.
%
%	Name: a
%	Type: vector
%	Description: vector of feedback gains.
%
% Programmer: Samir Angelo Milani Martins
%
% Creation Date: October 16, 2010
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
    error('Error (bttwrth): must have 2 input arguments.');
end

% Prewarp
Wc = tan(wc/2);
% Compute b coefficients
b = 1;
for n = 1:N
b = conv(b,[Wc;Wc]);
end;
% Compute a coefficients
if (rem(N,2)) % N is odd initialize with 1st order term
a = [1+Wc;-1+Wc];
else % N is even initialize with 1
a = 1;
end;
for n = 1:floor(N/2)
costheta = cos(pi/2*(1+(2*n-1)/N));
An = 1-2*Wc*costheta+Wc*Wc;
Bn = -2+2*Wc*Wc;
Cn = 1+2*Wc*costheta+Wc*Wc;
a = conv(a,[An;Bn;Cn]);
end;
% Scale b and a so that a(0) = 1, i.e. monic A(z);
b = b ./ a(1);
a = a ./ a(1);