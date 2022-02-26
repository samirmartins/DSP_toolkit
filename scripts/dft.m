function [X_mag,X_phase,X] = dft(x,N)
%*************************************************************************
% DFT [X_mag,X_phase] = dft(x,N)
%
% Description: This function returns the N-point DFT of a length L signal.
%
% Input Arguments:
%	Name: x
%	Type: vector
%	Description: signal of length L.
%
%	Name: N
%	Type: scalar
%	Description: Number of frequency evaluation points.
% Output Arguments:
%	Name: X_mag
%	Type: vector
%	Description: N-pt magnitude DFT of x
%
%	Name: X_phase
%	Type: vector
%	Description: N-pt phase DFT of x
%
%	Name: X
%	Type: vector
%	Description: N-pt DFT of x
%
% Programmer: Samir Angelo Milani Martins
%
% Creation Date: September 04, 2010
% Last Revision: September 22, 2010
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
if (nargin ~= 2) && (nargin ~= 1)
    error('Error (dft): must have 1 or 2 input arguments.');

else

    % Defining N, in case nargin == 1
    if nargin == 1

        N = length(x);

    end

    % Verifying if x is a row or column vector, and doing x as a row column
    if size(x,1) ~= 1
        x = conj(x');
    end

    % Vector n
    n = 0:(length(x)-1); n = n';

    % DFT - 0 < m < N-1 . Since that Matlab does not allow zero as an index,
    % the values is going to be put from 1 to N
    m = 1:N;
    W = exp(-1i*2*pi*n*(m-1)/N);
    X = x*W;

    % Phase of the DFT
    X_phase = phase(X);

    % Magnitude of the DFT
    X_mag = abs(X);

end