function x_hat = requantize(x,B)
%*************************************************************************
% REQUANTIZE x_hat = requantize(x,B)
%
% Description: This function requantizes input samples to floats which
%              are represented with B bits per sample.
%
% Input Arguments:
%	Name: x
%	Type: vector
%	Description: Signal
%
%	Name: B
%	Type: scalar
%	Description: Desired bits per sample
%
% Output Arguments:
%	Name: x_hat
%	Type: vector
%	Description: Requantized signal
%
% Programmer: Samir Angelo Milani Martins
%
% Creation Date: November 20, 2010
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
   error('Error (requantize): must have 2 input arguments.');
end

if (max(abs(x))>1.0)
disp('Warning: signal amplitude exceeds +/- 1.0. Will scale.');
x = x ./ max(abs(x));
end;
% Do not allow any +1.0
i = find(x == 1.0);
x(i) = 1.0 - eps;
% Calculate step size = [1-(-1)]/[2^B]
delta = 2.0 / (2.0 ^ B);
% Quantize
x_hat = floor(x./delta).*delta + delta/2; % mid-tread
