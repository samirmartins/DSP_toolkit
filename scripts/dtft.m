function X = dtft(x,w)
%*************************************************************************
% DTFT X = dtft(x,w)
%
% Description: This function returns the DTFT of a length L signal at
% desired frequency points.
%
% Input Arguments:
%	Name: x
%	Type: vector
%	Description: signal of length L.
%
%	Name: w
%	Type: vector
%	Description: Desired frequency points in radian/sample
%
% Output Arguments:
%	Name: X
%	Type: vector
%	Description: DTFT of x at w
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
if (nargin ~= 2)
    error('Error (dft): must have 2 input arguments.');

else

    % Verifying if x is a row or column vector, and doing x as a column
    if size(x,2) ~= 1
        x = x';
    end

    % Number of points in each frequency
    n = 0:(length(x)-1);

    % DTFT - 0 < m < N-1 . Since that Matlab does not allow zero as an index,
    % the values is going to be put from 1 to N
    
    m = 1:length(w);
    W = conj(exp(-1i*w(m)*n)');
    X = conj(W')*x; 
    
end