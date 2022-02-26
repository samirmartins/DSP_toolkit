function y = upsamp(x,U)
%*************************************************************************
% UPSAMP y = upsamp(x,U)
%
% Description: This function returns an upsampled signal.
%
% Input Arguments:
%	Name: x
%	Type: vector
%	Description: Input signal
%
%	Name: U
%	Type: scalar
%	Description: Upsampling factor
%
% Output Arguments:
%	Name: y
%	Type: vector
%	Description: Upsampled signal
%
% Programmer: Samir Angelo Milani Martins
%
% Creation Date: November 18, 2010
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
    error('Error (upsamp): must have 2 input arguments.');
end;

for n = 0:length(x)*U-1
    if (n == 0)
        y(n+1) = x(n+1);
    end
    if (mod(n,U)==0)
        y(n+1) = x((n/U)+1);
    else
        y(n+1) = 0;
    end
end
y = y';


