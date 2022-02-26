%*************************************************************************
%NAME: Samir Angelo Milani Martins                   DATE: October 27th
%-------------------------------------------------------------------------
%PURPOSE: This program solve the problem 2 of the Exam #2
%-------------------------------------------------------------------------
%OUTLINE: This program designs a notch filter in order to remove a
%         narrow-band interference from a wide-band signal.     
%-------------------------------------------------------------------------
%FUNCTIONS: 
%NOTES: 
%*************************************************************************

% Clearing the variables and the screen
clear; clc; close all;

%================================Part b)================================

% Reading the signal
[x,fs] = audioread('signal2.wav');

w = hamming2(1024); % Hamming window
S = welch2(x,w,256); % Computing the periodogram
periodogram_plot(S,0,fs); % Plotting the periodogram

%================================Part c)================================

fnoise = 1e3;
wnoise = fnoise*2*pi/fs; % rad/sample

%================================Part d)================================

figure();
b = [1;-2*cos(wnoise);1]; % Filter coefficients
polezero(b,1); % Pole-zero pattern
fr_plot(b,1,fs,0);

%================================Part e)================================

y = filter(b,1,x);
fsong = audioplayer(x, fs);
play(fsong);
pause(14);
fsong2 = audioplayer(y, fs);
play(fsong2);
audiowrite('signal2_filtered.wav',y,fs);% Writing the new file
pause(14);
%================================Bonus================================

% wnoise = 0.3927; r = 0.5;
% (Z-0.5*exp(-1i*wnoise))(Z-0.5*exp(1i*wnoise)) = Z^2 - 0.9239 + 0.25
a = [1; -0.9239; 0.25];
figure();
polezero(b,a); % New pole-zero pattern
fr_plot(b,a,fs,0);
y1 = filter(b,a,x);
fsong3 = audioplayer(y1, fs);
play(fsong3); % Playing the filtered signal - Sharpen filter
audiowrite('signal2_filtered_sharpen.wav',y1,fs);% Writing the new file



