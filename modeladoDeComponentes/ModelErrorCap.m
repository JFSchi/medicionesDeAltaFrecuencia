function ErrorM=ModelErrorCap(x,f,Zm)
% x: parametros del modelo (valores iniciales)
% x(1):Capacidad
% x(2):Inductancia
% x(3):Resistencia
% f: vector de frecuencias
% Zm: impedancia medida
% ErrorM: Funci´on a minimizar. Sumatoria de los valores absolutos del error
% para cada frecuencia.
% Modelo
ZL=(1j*2*pi*f*x(2));
ZC=1./(1j*2*pi*x(1)*f);
RS=x(3)*sqrt(f);
%Z= ZL + ZC + RS;
Z=1./(1./ZC+1./(ZL+RS));
% Error
ErrorM=sum(abs(Z-Zm));