function adsr = adsr_gen(target,gain,duration)
%*************************************************************************
% ADSR_GEN adsr = adsr_gen(target,gain,duration)
%
% Description: This function returns an Attack, Decay, Sustain, and 
%              Release (ADSR) envelope. This envelope can be used to 
%              Amplitude Modulate a sinusoid and forms the basis for 
%              computer music synthesis.
%
% Input Arguments:
%	Name: target
%	Type: vector
%	Description: vector of attack, sustain, and release targets.
%
%	Name: gain
%	Type: vector
%	Description: vector of attack, sustain, and release gains
%
%	Name: duration
%	Type: vector
%	Description: vector of attack, sustain, and release durations (in
%                milliseconds)
%
% Output Arguments: 
%
%	Name: adsr
%	Type: vector
%	Description: vector of envelope values. The vector has three stages
%                corresponding to attach, sustain, and release portions 
%                of the envelope.
%
% Programmer: Samir Angelo Milani Martins
%
% Creation Date: December 7, 2010
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
if (nargin ~= 3)
    error('Error (adsr_gen): must have 3 input arguments.');
end

fs = 16000;
adsr = zeros(fs,1); % malloc assuming a 1 second duration ADSR envelope
duration = round(duration./1000.*fs); % envelope durations in samples
% Compute ADSR Values
% Attack phase
start = 2;
stop = duration(1);
for n = [start:stop]
adsr(n) = (1.0 - gain(1))*adsr(n-1) + target(1)*gain(1);
end
% Sustain phase
start = stop + 1;
stop = start + duration(2);
for n = [start:stop]
adsr(n) = (1.0 - gain(2))*adsr(n-1) + target(2)*gain(2);
end
% Release phase
start = stop + 1;
stop = fs;
for n = [start:stop]
adsr(n) = (1.0 - gain(3))*adsr(n-1) + target(3)*gain(3);
end;