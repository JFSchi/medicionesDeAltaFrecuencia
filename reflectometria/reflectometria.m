%% reflectometria
clear all; close all; %Borra variables y gr�aficos previos.
% Datos medidos
datos=importdata('.\ondaRebotes.csv'); % Importa datos provenientes del osciloscopio.
t=datos.data(:,1);
tension=datos.data(:,2);

%reescalamiento de vectores:
t=t*1e9;  % segundos -> nanosegundos

%rango de interes (no esta en ns, es indice del vector):
rango=[1975, 2125];
t=t(rango(1):rango(2));
tension=tension(rango(1):rango(2));

%Graficos de datos medidos
plot(t,tension);grid on; hold on;
xlabel('Tiempo[ns]');ylabel('Tension[V]');
title('Rebotes de lineas en cascada','fontweight','demi');