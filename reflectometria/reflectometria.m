%% Mediciones en alta frecuencia
%
% ----- Año 2022---------------
%=======================================================================
clear all; close all; %Borra variables y gr´aficos previos.
% Datos medidos
datos=importdata('.\ondaRebotes.csv'); % Importa datos provenientes del osciloscopio.
t=datos.data(:,1); % Vector de
tension=datos.data(:,2); % Vector de

% Gr´aficos de datos medidos
%M´odulo
figure('name','abcd');
plot(t,tension);grid on; hold on;
xlabel('abcd []');ylabel('abcd []');
title('avdsac','fontweight','demi');