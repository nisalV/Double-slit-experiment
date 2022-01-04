clear all; clc

%Load image 'single_slit.bmp'.
I = imread('C:\Users\Nisal Perera\Desktop\CMP_s14359_Q2\single_slit.bmp');
I = double(I); %Converts to double precision 

%Display it
figure;
imagesc(I, []);
axis equal; 
axis off;
title('Single Slit Image');

% Extract Green Channel data from 'single_slit.bmp'.
green = I(:,:,2);
a = zeros(size(I, 1), size(I, 2));
Green = cat(3, a, green, a);

%Display image in GREEN channel.
figure;
imagesc(Green, []);
axis off;
title('Green channel');

%Centered Fourier transform of 'I'.
k = abs(fftshift(abs(fft2(green))));

%Centered Fourier Transform (diffraction Pattern) of the given Single Slit
figure; 
subplot(1,1,1); 
imagesc(k, []);
axis equal;
axis off;
title('Centered Fourier Transform (diffraction Pattern) of the given Single Slit');

%Obtaining the colunm number of maximum intensities with values (for each 256 of rows).
[k_max, index] = max(k);
fprintf('The colunm number of the maximum recorded intensities for each row: %d \n',max(index));
%To obtain the maximum value of 'k'.
fprintf('Maximum value for "k" : %d \n', max(k_max));

%%% Line 44 to 50 performed for further confirmination.
%3D Plot (as a image) for confirmation.
figure;
surf(k);
axis on;
title('3D Centered Fourier Transform (diffraction Pattern) of the given Single Slit');
xlabel('Row number of [k]');
ylabel('Column number of [k]');
zlabel('Intensity');

%To normalized all the intensities.
s = k./max(k_max);

%To normalized the intensities in column 129.
xk = k_max./max(k_max);

%Horizontal cross (2D like) section of above 3D plot.
figure;
surf(s);
view(360,0);         %To obtain the viewing algle as looking directly from infront of the X axis.
title('2D Horizontal cross section of 3D Centered Fourier Transform (diffraction Pattern) of the given Single Slit');
xlabel('Row number of [k]');
zlabel('Normalized Intensity');
%%%

%To obtain a single variable normalized intensity (s) plot for maximum recorded intensities.
figure;
plot(xk,'.', 'MarkerSize', 10);
set(gca,'xtick',[]);
legend('Normalized Intensity')
title('1D Horizontal cross section values of the Centered Fourier Transform of the given Single Slit');
ylabel('Normalized Intensity');

