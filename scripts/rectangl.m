function w = rectangl(N)
%*************************************************************************
% RECTANGL w = rectangl(N)
%
% Description: This function returns the rectangular window of length N.
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
    w(n,1)=1;
    
end