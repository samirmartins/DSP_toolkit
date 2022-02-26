function plotcsig(x,fs,option)
%*************************************************************************
% PLOTCSIG plotcsig(x,fs,option)
%
% Description: This function will plot and label a continuous-time signal
% by connecting the sample values.
%
% Input Arguments:
%	Name: x
%	Type: vector
%	Description: vector of samples.
%
%	Name: fs
%	Type: scalar
%	Description: sample rate in hertz
% 
%   Name: option
%   Type: Scalar
%   Description: 0 - continuous line
%                1 - dashed line - type 1
%                2 - dashed line - type 2
%
% Output Arguments: Plot of a continuous-time signal
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
%
%*************************************************************************

%------------------
% Check valid input
%------------------

if (nargin ~= 2)&&(nargin ~= 3)
    error('Error (plotcsig): must have 2 inputs arguments.');
end;

if (nargin ==2)
    option = 0;
end


if option == 0
    N = length(x)-1;
    t = [0:1/fs:N/fs]'; % build time vector
    plot(t,x,'k'); % plot sequence vs. time vector
    ylabel('x(t)');
    xlabel('t (sec.)');
    grid;
else if option ==1
        N = length(x)-1;
        t = [0:1/fs:N/fs]'; % build time vector
        plot(t,x,'k--'); % plot sequence vs. time vector
        ylabel('x(t)');
        xlabel('t (sec.)');
        grid;
    else if option == 2
            N = length(x)-1;
            t = [0:1/fs:N/fs]'; % build time vector
            plot(t,x,'k.-'); % plot sequence vs. time vector
            ylabel('x(t)');
            xlabel('t (sec.)');
            grid;
        end
    end
end
