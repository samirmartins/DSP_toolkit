function x = cexpgen(A,f,phi,fs,duration)
%*************************************************************************
% CEXPGEN x = cexpgen(A,f,phi,fs,duration)
%
% Description: This function returns the samples of a complex exponential
%
% Input Arguments:
%	Name: A
%	Type: scalar
%	Description: Amplitude of the complex exponential
%
%	Name: f
%	Type: scalar
%	Description: Frequency of sinusoid in hertz
%
%	Name: phi
%	Type: scalar
%	Description: Phase of sinusoid in radians
%
%	Name: fs
%	Type: scalar
%	Description: Sampling rate in hertz
%
%	Name: duration
%	Type: scalar
%	Description: Duration of sinusoid in seconds
%
% Output Arguments:
%	Name: x
%	Type: vector
%	Description: vector of complex exponential samples
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
   error('Error (cexpgen): must have 5 input arguments.');
end;

n = [0:fs*duration]'; % index vector
x = A*exp(j*(2*pi*f/fs*n+phi));
