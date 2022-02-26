function periodogram_plot(S,units,fs)
%*************************************************************************
% PERIODOGRAM_PLOT periodogram_plot(S,units,fs)
%
% Description: This function plots periodogram data (PSD estimate).
%
% Input Arguments:
%	Name: S(wk)
%	Type: vector
%	Description: periodogram data for 0 <= wk <= 2pi
%
%	Name: units
%	Type: scalar
%	Description: optional argument with values as follows
%                0{plot in dB (default)
%                1{plot in normal units
%
%	Name: fs
%	Type: scalar
%	Description: optional argument with values as follows
%                2pi{frequency is in radians/sample (default)
%                other specified value{frequency is in Hertz
%
% Output Arguments: Plot of S(wk)
%
% Programmer: Samir Angelo Milani Martins
%
% Creation Date: October 27, 2010
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
if (nargin ~= 3) && (nargin ~= 2) && (nargin ~= 1)
    error('Error (periodogram_plot): must have 1, 2 or 3 input arguments.');
end
    
if (nargin == 1)
    units = 0;
    fs = 2*pi;
end

if (nargin == 2)
    fs = 2*pi;    
end

if units ~= 1 % Plots in dB units
    S = 10*log10(S); % Changing into dB 
end

N = length(S); 
x_axis = 0:fs/N:fs*(1-1/N); % X-axis

figure(); % New figure

% Checking if S(w) = S(-w)
for k = 1:(length(S)/2 -1)
    aux = length(find(S(k+1)==S));
    if aux < 2
        aux = 0; % The plot will be from o to 2pi
        break;
    end
end

if aux == 0 % from 0 to 2pi
    
    plot(x_axis,S);
    grid;
    axis([0 x_axis(end) min(S) max(S)]);
    
else % from 0 to pi
    
    plot(x_axis(1:end/2+1),S(1:end/2+1));
    grid;
    axis([0 x_axis(end/2+1) min(S) max(S)]);
    
end

% Axis
if fs == 2*pi
    
    ylabel('S(\omega) dB');
    xlabel('\omega(rad/sample)');
    
else
    
    ylabel('S(\omega) dB');
    xlabel('f(Hz)');
    
end

