function grdplot(b,a,fs)
%*************************************************************************
% GRDPLOT grdplot(b,a,fs)
%
% Description: This function plots the group delay of H(exp(1i*w)) defined
%              as:
%
%                       grd(H(exp(1i*w))) = -d(arg(H(exp(1*iw))))/dw
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
%	Name: fs
%	Type: scalar
%	Description: sampling frequency (optional).
%
% Output Arguments: Plot of group delay
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
if (nargin ~= 2) && (nargin ~= 3)
    error('Error (grdplot): must have 2 or 3 input arguments.');
end

% % Initializing variables
N = 500;

% order of a
oa = length(a)-1;

% order of c
oc = oa + length(b)-1;

% c(z) = b(z)*a(1/z)*z^(-oa)
c = conv(b,fliplr(a));

% derivative of c
cr = c.*[0:oc]';

% Numerator and denominator
num = fft(cr,N);
den = fft(c,N);

% Group delay
gd = real(num ./ den) - oa;
gd = -gd';

% New figure
figure();

% X-Axis
if ((isempty(find(imag(a)~=0)) == 1) && (isempty(find(imag(b)~=0)) == 1))
    x_axis = 0:fs/N:fs*(1-1/N)/2;
else
    x_axis = 0:fs/N:fs*(1-1/N);
end

plot(x_axis,gd(1:length(x_axis)));

if fs == 2*pi

    % Axis, title and label of the magnitude of the DFT
    axis([0 x_axis(end)+(fs/N) 0.9*min(gd) max(gd)*1.1]);
    ylabel('Group delay (samples)');
    xlabel('\omega(rad/sec)');
    title(' Group delay. Frequency in rad/sec');

else if fs == 1

        % Axis, title and label of the magnitude of the DFT
        axis([0 x_axis(end)+(fs/N) min(gd)-5 max(gd)+5]);
        ylabel('Group delay (samples)');
        xlabel('Normalized frequency(f/f_s)');
        title(' Group delay. Normalized frequency');

    else

        % Axis, title and label of the magnitude of the DFT
        axis([0 x_axis(end)+(fs/N) 0.9*min(gd) max(gd)*1.1]);
        ylabel('Group delay (samples)');
        xlabel('f(Hz)');
        title(' Group delay. Frequency in Hz.');

    end

end

grid;
