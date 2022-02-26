function y = fltr(b,a,x)
%*************************************************************************
% FLTR y = fltr(b,a,x)
%
% Description: This function returns the output of a linear,
%              shift-invariant system described by H(z) = B(z)=A(z), where
%
%               B(z) = b(0) + b(1)z^-1 + ... + b(L)z^-L
% and
%               A(z) = 1 + a(1)z^-1 + ... + a(M)z^-M
% for any given input signal.
%
% Input Arguments:
%	Name: b
%	Type: vector
%	Description: vector of feedforward gains.
%
%	Name: a
%	Type: vector
%	Description: vector of feedback gains.
%
%   Name: x
%   Type: vector
%   Description: input signal.
%
% Output Arguments:
%	Name: y
%	Type: vector
%	Description: output signal.
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
if (nargin ~= 3)
    error('Error (flts): must have 3 input arguments.');
end

% Turning a and b in a collumn vector
if size(a,2) == 1
    a = a';
end
if size(b,2) == 1
    b = b';
end

for k = (length(b)):length(x)
        
        y(1:length(b)-1,1) = b(1:length(b)-1); % Initials conditions
        y(k,1) = (b*x(k:-1:(k - length(b)+1)) - a(2:end)*y(k-1:-1:(k - length(a)+1)))/a(1);
        
end           