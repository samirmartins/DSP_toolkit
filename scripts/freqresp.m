function [H_mag, H_phase] = freqresp(b,a,N)
%*************************************************************************
% FREQRESP [H_mag, H_phase] = freqresp(b,a,N)
%
% Description: This function returns the frequency response values of
%
%                   H(exp(jw)) = B(exp(jw))/A(exp(jw))
%
% where the mth DFT frequency, ?m = 2?m/N (rads/sample) and N is the number
% of evaluation points.
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
%	Name: N
%	Type: scalar
%	Description: number of evaluation points
%
% Output Arguments:
%	Name: H_mag
%	Type: vector
%	Description: vector of magnitude response values.
%
%	Name: H_phase
%	Type: vector
%	Description: vector of phase response values.
%
% Programmer: Samir Angelo Milani Martins
%
% Creation Date: October 7, 2010
% Last Revision:
%
% Required subroutines: dft.m
%
% Notes:
%
% References:
%*************************************************************************

%------------------
% Check valid input
%------------------
if (nargin ~= 3)
    error('Error (freqresp): must have 3 input arguments.');
end;

H_mag = zeros(N,1); % prealloc for H_mag
H_phase = zeros(N,1); % prealloc for H_phase
w = [0:2*pi/N:2*pi-2*pi/N]';
H_b = dtft(b,w);
H_a = dtft(a,w);
H_mag = abs(H_b./H_a);
H_phase = atan2(imag(H_b./H_a),real((H_b./H_a)));