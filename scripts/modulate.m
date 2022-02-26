function g = modulate(h,wo)
%*************************************************************************
% MODULATE g = modulate(h,wo)
%
% Description: This function modulates the impulse response h by wo. The
%              resulting impulse response is returned as g.
%
% Input Arguments:
%	Name: h
%	Type: vector
%	Description: impulse response of prototype filter.
%
%	Name: wo
%	Type: scalar
%	Description: frequency in radians/sample for modulation.
%
% Output Arguments:
%	Name: g
%	Type: vector
%	Description: impulse response of resulting filter.
%
% Programmer: Samir Angelo Milani Martins
%
% Creation Date: October 14, 2010
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
    error('Error (freqshft): must have 2 input arguments.');
end

% h as a row vector
if size(h,2) == 1
    h = conj(h');
end

% Initializing variables
n = 1:length(h);

g = h.*cos(wo*(n-1));

% g as a collumn vector
g = conj(g');