function [b,a] = chebyshv(N,epsilon,wc)
%*************************************************************************
% CHEBYSHV [b,a] = chebyshv(N,wc)
%
% Description: This function returns the Nth order, Type I, LP digital 
%              Chebyshev filter coefficients in length N +1 vectors
%              b and a. The cut-off frequency is wc in radians/sample
%              and passband ripple is 1=(1 +eps^2) on a magnitude-squared
%              plot.
%
% Input Arguments:
%	Name: N
%	Type: scalar
%	Description: filter order.
%
%	Name: epsilon
%	Type: scalar
%	Description: passband ripple parameter.
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
if (nargin ~= 3)
    error('Error (chebyshv): must have 3 input arguments.');
end

% Prewarp
Wc = tan(wc/2);
% Initialize
mu = log((1+sqrt(1+epsilon*epsilon))/epsilon)/N;
% Compute b coefficients
b = 1;
for n = 1:N
b = conv(b,[Wc;Wc]);
end;
% Compute a coefficients
if (rem(N,2)) % N is odd initialize with 1st order term
a = [1+Wc*sinh(mu);-1+Wc*sinh(mu)];
else % N is even initialize with 1
a = 1;
end;
for n = 1:floor(N/2)
theta = pi/2*(2*n-1)/N;
An = 1+2*Wc*sinh(mu)*sin(theta)+Wc*Wc*(sinh(mu)^2+cos(theta)^2);
Bn = -2+2*Wc*Wc*(sinh(mu)^2+cos(theta)^2);
Cn = 1-2*Wc*sinh(mu)*sin(theta)+Wc*Wc*(sinh(mu)^2+cos(theta)^2);
a = conv(a,[An;Bn;Cn]);
end;
% Scale DC gain
if (rem(N,2)) % N is odd
g = sum(a)/sum(b);
else
g = sum(a)/(sqrt(1+epsilon*epsilon)*sum(b));
end;
b = b .* g;
% Scale b and a so that a(0) = 1, i.e. monic A(z);
b = b ./ a(1);
a = a ./ a(1);