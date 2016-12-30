function [A, theta] = PhasorSum(mag, ang)
% Function to calculate the sum of phasors
% Check that inputs all have magnitude and angle
if length(mag) ~= length(ang)
    disp('Input Values missing...')
    return
end

A = 0;
theta = 0;

% Add each element in both arrays
for n = 1:length(mag)
    A = A+mag(n);
    theta = theta + ang(n);
end
