function w = hanning2(N)
%*************************************************************************
% HAMMING2 w = hanning2(N)
%
% Description: This function returns the Hanning window of length N.
%
% Input Arguments:
%	Name: N
%	Type: scalar
%	Description: length of the window.
%
% Output Arguments:
%	Name: w
%	Type: vector
%	Description: window of length N
%
% Programmer: Samir Angelo Milani Martins
%
% Creation Date: September 14, 2010
% Last Revision:
%
% Required subroutines:
%
% Notes:
%
% References:
%
%*************************************************************************

%------------------
% Check valid input
%------------------
if (nargin ~= 1)
    error('Error (dft): must have 1 input arguments.');

else

    % Counter
    n = 1:N;
    w(n,1)= 0.5 - 0.5*cos(2*pi*(n-1)/(N-1));
       
end