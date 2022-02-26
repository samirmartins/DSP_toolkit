function polezero(b,a)
%*************************************************************************
% POLEZERO polezero(b,a)
%
% Description: This function plots the pole-zero diagram of H (z).
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
% Output Arguments: Plot of pole-zero diagram including poles and zeros at
%                   the origin
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
    error('Error (polezero): must have 2 input arguments.');
end

M = length(b)-1; % poly order
N = length(a)-1; % poly order
if (M > N) % add zero coefs to account for pole(s) at the origin
a = [a;zeros(M-N,1)];
end;
if (M < N) % add zero coefs to account for zero(s) at the origin
b = [b;zeros(N-M,1)];
end;
p = roots(a); % pole locations
z = roots(b); % zero locations
w = [0:2*pi/100:2*pi]'; % a few phase angles...
unit_circle = exp(j*w); % ...to compute points around the unit circle
plot(unit_circle); % draw a unit circle
hold on;
plot([0 0],[-1 1],'--'), % cross hairs
plot([-1 1],[0 0],'--'), % cross hairs
plot(real(p),imag(p),'x'), % draw the poles
plot(real(z),imag(z),'o'), % draw the zeros
axis('square'), % 1:1 aspect ratio
title('Pole/Zero Locations for Filter'),
ylabel('Imag(z)'),
xlabel('Real(z)'),
grid;
hold off;