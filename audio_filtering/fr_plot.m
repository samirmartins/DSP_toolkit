function fr_plot(b,a,fs,option1)
%*************************************************************************
% FR_PLOT fr_plot(b,a,fs,option)
%
% Description: This function plots the magnitude and phase responses of
%
%                               H(exp(jw))
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
%	Description: sampling frequency
%
%   Name: option1
%   Type: scalar
%   Description: optional argument with values as follows
%                0–Magnitude response is plotted in dB (default)
%                1–Magnitude response is plotted in absolute units
%                2–Magnitude response is plotted in squared absolute units
%
% Output Arguments:
%	Plot with magnitude response and a plot with phase response
%
% Programmer: Samir Angelo Milani Martins
%
% Creation Date: October 7, 2010
% Last Revision:
%
% Required subroutines: dft.m, freqresp.m
%
% Notes:
%
% References:
%*************************************************************************

%------------------
% Check valid input
%------------------
if (nargin ~= 4) && (nargin ~= 3) && (nargin ~= 2)
    error('Error (fr_plot): must have 2, 3 or 4 input arguments.');
end

% Initializing variables - N
N = 512;

% Checking the nargin
if nargin == 2
    fs = 2*pi; % Normalized frequency scale
    option1 = 0;
end


if nargin == 3
    option1 = 0;
end

% Cheking the option 1

if option1 == 0 % Magnitude response is plotted in dB

    % Frequency response
    [H_mag,H_phase] = freqresp(b,a,N);
    % Changing to dB
    H_mag = 20*log10(H_mag);

else if option1 == 1 % Magnitude response is plotted in absolute units

        % Frequency response
        [H_mag,H_phase] = freqresp(b,a,N);

    else if option1 == 2 % Magnitude response is plotted in squared absolute units

            % Frequency response
            [H_mag,H_phase] = freqresp(b,a,N);
            % Changing to square absolute units
            H_mag = H_mag.^2;

        end

    end

end

% X-Axis
if ((isempty(find(imag(a)~=0)) == 1) && (isempty(find(imag(b)~=0)) == 1))
    x_axis = 0:fs/N:fs*(1-1/N)/2;
else
    x_axis = 0:fs/N:fs*(1-1/N);
end

% Plotting

figure();
plot(x_axis,H_mag(1:size(x_axis,2)));
grid;
if fs == 2*pi

    % Axis, title and label of the magnitude of the DFT
    axis([0 x_axis(end)+(fs/N) min(H_mag) max(H_mag)]);
    ylabel('|X_{magnitude}|');
    xlabel('\omega(rad/sec)');
    title(' Magnitude of X(m). Frequency in rad/sec');

else if fs == 1

        % Axis, title and label of the magnitude of the DFT
        axis([0 x_axis(end)+(fs/N) min(H_mag) max(H_mag)]);
        ylabel('|X_{magnitude}|');
        xlabel('f(normalized)');
        title(' Magnitude of X(m). Normalized frequency');

    else

        % Axis, title and label of the magnitude of the DFT
        axis([0 x_axis(end)+(fs/N) min(H_mag) max(H_mag)]);
        ylabel('|X_{magnitude}|');
        xlabel('f(Hz)');
        title(' Magnitude of X(m). Frequency in Hz.');

    end

end

figure();
plot(x_axis,H_phase(1:size(x_axis,2)));
grid;
if fs == 2*pi

    % Axis, title and label of the magnitude of the DFT
    axis([0 x_axis(end)+(fs/N) -pi pi]);
    ylabel('X_{phase}');
    xlabel('\omega(rad/sec)');
    title(' Phase of X(m). Frequency in rad/sec');

else if fs == 1

        % Axis, title and label of the magnitude of the DFT
        axis([0 x_axis(end)+(fs/N) -pi pi]);
        ylabel('X_{phase}');
        xlabel('f(normalized)');
        title(' Phase of X(m). Normalized frequency');

    else

        % Axis, title and label of the magnitude of the DFT
        axis([0 x_axis(end)+(fs/N) -pi pi]);
        ylabel('X_{phase}');
        xlabel('f(Hz)');
        title(' Phase of X(m). Frequency in Hz.');

    end

end