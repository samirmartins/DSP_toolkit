function x = cosingen(A,f,phi,fs,duration)
%*************************************************************************
% COSINGEN x = cosingen(A,f,phi,fs,duration)
%
% Description: This function returns samples of a cosinusoid.
%
% Input Arguments:
%	Name: A
%	Type: scalar
%	Description: Amplitude of cosinusoid.
%
%	Name: f
%	Type: scalar
%	Description: Frequency of cosinusoid.
%
%	Name: phi
%	Type: scalar
%	Description: Phase of cosinusoid.
%
%	Name: fs
%	Type: scalar
%	Description: Sampling rate of cosinusoid.
%
%	Name: duration
%	Type: scalar
%	Description: Duration of cosinusoid in seconds.
%
% Output Arguments:
%	Name: x
%	Type: vector
%	Description: cosinusoid signal
%
% Programmer: Samir Angelo Milani Martins
%
% Creation Date: September 02, 2010
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
if (nargin ~= 5)
   error('Error (cosingen): must have 5 input arguments.');
end;

n = [0:fs*duration]';  % time vector
x = A*cos(2*pi*f/fs*n+phi);
