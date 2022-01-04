clear all; clc

a = 30*1e-6;      %Slit width.
b = 0.15*1e-3;    %Distance between two slits.
w = 480*1e-9;     %Wavelength of the light ray.
d = 3;            %Distance from the slit to the screen.
Q = pi/50;        %Angle to the furthest away point from the central maximum.

Qall = -Q:1e-5:Q;         %Setting parameters for each incident wave.
Y = d*tan(Qall);          %Distance (Y) to the each resulting peaks (or any point) from central maximum.

B = pi*a*sin(Qall)/w;     %BETA
D = pi*b*sin(Qall)/w;     %Delta

I1 = cos(D).^2;       %Sourse intensity 
I2 = (sin(B)./B).^2;  %Single slit Diffraction intensity
I = I1.*I2;           %Effecting normalized intensity

%For 2D plot.
figure;
plot(Y,I,'.', 'MarkerSize', 5);
title('Double slit diffraction');
legend('Normalized Intensity')
xlabel('Distance (Y) to the each resulting peaks from central maximum.');
ylabel('Normalized Intensity');

%For 1D plot.
figure;
plot(I,'.', 'MarkerSize', 5);                         
title('1D Double slit diffraction intensity');
set(gca,'xtick',[]);
legend('Normalized Intensity')
ylabel('Normalized Intensity');