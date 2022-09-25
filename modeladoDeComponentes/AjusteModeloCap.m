%% Mediciones en alta frecuencia
% Ajuste de modelo de inductor.
% ----- Año 2022---------------
%=======================================================================
clear all; close all; %Borra variables y gr´aficos previos.
% Datos medidos
datos=importdata('.\indJ323.i'); % Importa datos ASCII provenientes del M.C.V.
f=datos.data(1,:); % Vector de frecuencia
mag=datos.data(2,:); % Vector de magnitudes (Ohm)
fase=datos.data(3,:); % Vector de fase (grados)
Zm=mag.*exp(1j*pi*fase/180); % Impedancia medida
% Gr´aficos de datos medidos
%M´odulo
figure('name','Modelizacion');
v1=subplot(2,1,1);
plot(f/1e6,mag);grid on; hold on;
xlabel(v1,'frecuencia [MHz]');ylabel(v1,'Modulo [Ohms]');
title(v1,'Impedancia','fontweight','demi');
%Fase
v2=subplot(2,1,2);
plot(f/1e6,fase);grid on; hold on;
xlabel(v2,'frecuencia [MHz]');ylabel(v2,'fase [o]');
%=========================================================
%Ajuste
%x0: Vector de par´ametros con valores iniciales [C[F],L[Hy],R[Ohm/sqrt(Hz)]];
%ModelErrorCap:Funci´on que calcula el error entre el modelo propuesto y
% los datos medidos. Es la funci´on a minimizar.
%MiFunc: Variable intermedia necesaria para minimizar la funci´on con
% par´ametros f y Zm.
%fminsearch: funci´on de minimizaci´on. Devuelve los par´ametros que minimizan
% la funci´on que se le pasa como argumento.
%x: Par´ametros optimizados.
%x0=[100e-9,26e-9,1e-3];
%este es el x0 modificado para nuestro caso, el inductor:
x0=[1.64e-12,32.2e-6,0.05];
MiFunc = @(x)ModelErrorCap(x,f,Zm);
x = fminsearch(MiFunc, x0);
format shorte;
disp('Parametros [C,L,R] resultantes de la minimizacion:');
disp(x);
%==========================================================
%Comprobaci´on del modelo con los par´ametros obtenidos.
ZL=(1j*2*pi*f*x(2)); %Impedancia del inductor
ZC=1./(1j*2*pi*x(1)*f); %Impedancia del capacitor
RS=x(3)*sqrt(f); %Resistencia con efecto pelicular
%Z= ZL + ZC + RS;% Modelo de impedancia total
Z=1./(1./ZC+1./(ZL+RS));
%===========================================================
% Gr´aficos de datos calculados
%M´odulo
plot(v1,f/1e6,abs(Z),'g');
legend(v1,'Medido','Calculado','location','se');
%fase
plot(v2,f/1e6,180/pi*angle(Z),'g');
legend(v2,'Medido','Calculado','location','se');