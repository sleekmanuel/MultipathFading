%% MultiPhathFading mFile 
%  MultiPathFading.m
%  Plot phasors on rectangular complex plane.

f = [900E6, 1.5E9, 2.5E9]; % 3 Frequencies: 900MHz, 1.5GHz, 2.5GHz
y_mag1 = 0.95;  % Magnitude of signal y1 (direct path)
y_mag2 = 0.8;   % Magnitude of signa y2 (reflected)
mag = [y_mag1, y_mag2];

c = 3E8;        % c = 3 x 10^8 m/s

l1 = 1217.58;   % Direct Path Length (m)
l2 = 1581.71;   % Reflected Path Length (m)

shift_1 = [0,0,0];
shift_2 = [0,0,0];
phi_1   = [0,0,0];
phi_2   = [0,0,0];

% Sum of signals - Y(t) = Acos(wt+phi)
Y_t_Mag = [0,0,0];  % Magnitudes for Y(t) for all 3 frequencies
Phi_m   = [0,0,0];  % Phase shift for Y(t) for all frequencies

for n = 1:3     % calculate phase shift for all frequencies
    shift_1(n) = 2 * pi * f(n) * l1 / c;   % total shift for L1 = 2n*pi + phi
    phi_1(n)   = rem(shift_1(n), 2*pi) * 2 * pi;
    shift_2(n) = 2 * pi * f(n) * l2 / c;   % total shift for L2
    phi_2(n)   = rem(shift_2(n), 2*pi) * 2 * pi;
end

% Get sum of phasors y(t) =  y1(t) + y2(t) for all 3 frequencies
for n = 1:3
    A = [y_mag1, y_mag2];
    B = [phi_1(n), phi_2(n)];
    [Y_t_Mag(n), Phi_m(n)] = PhasorSum(A, B);
end


%convert polar to rectangular/cartesian form f = 900MHz
[x1, y1] = pol2cart(phi_1(1),y_mag1);       % direct path
[x2, y2] = pol2cart(phi_2(1),y_mag2);       % reflected path
[xt, yt] = pol2cart(Y_t_Mag(1), Phi_m(1));  % sum of 2 paths

figure
hold on

compass(x1, y1, '^')  %plot of direct path
compass(x2, y2, '*') %plot of relected path
compass(xt, yt)        %plot of sum

%convert polar to rectangular/cartesian form f = 1.5MHz
[x1, y1] = pol2cart(phi_1(2),y_mag1);       % direct path
[x2, y2] = pol2cart(phi_2(2),y_mag2);       % reflected path
[xt, yt] = pol2cart(Y_t_Mag(2), Phi_m(2));  % sum of 2 paths

figure(2)
hold on

compass(x1, y1, '^')  %plot of direct path
compass(x2, y2, '*') %plot of relected path
compass(xt, yt)        %plot of sum

%convert polar to rectangular/cartesian form f = 2.5MHz
[x1, y1] = pol2cart(phi_1(3),y_mag1);       % direct path
[x2, y2] = pol2cart(phi_2(3),y_mag2);       % reflected path
[xt, yt] = pol2cart(Y_t_Mag(3), Phi_m(3));  % sum of 2 paths

figure(3)
hold on

compass(x1, y1)  %plot of direct path
compass(x2, y2) %plot of relected path
compass(xt, yt)        %plot of sum
