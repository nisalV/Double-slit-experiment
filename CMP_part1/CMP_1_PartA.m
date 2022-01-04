clear all; clc

a = 12*1e-6;     
w = 480*1e-9;    
d = 3;          
Q = pi/8;        %Angle to the furthest away point from the central maximum.

Qall = -Q: 1e-4: Q;        %Setting parameters for each incident wave.
Y = d.*tan(Qall);         
B = (pi*a.*sin(Qall))./w;  %BETA 


I = (sin(B)./B).^2;        %Normalized intensisty for discrete Y points. l

%For 2D plot.
figure;
plot(Y,I,'.', 'MarkerSize', 5);
title('Single slit diffraction');
legend('Normalized Intensity')
xlabel('Distance (Y) to the each resulting peaks from central maximum.');
ylabel('Normalized Intensity');

%For 1D plot.
figure;
plot(I,'.', 'MarkerSize', 5);                          
title('1D Single slit diffraction intensity');
set(gca,'xtick',[]);
legend('Normalized Intensity')
ylabel('Normalized Intensity');