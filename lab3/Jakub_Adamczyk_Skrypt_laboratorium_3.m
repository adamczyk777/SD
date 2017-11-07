%Jakub Adamczyk

%czyszczenie przestrzeni nazw i zmiennych
clear;
%Zadanie 1:
%lambde wprowadzamy w konsoli
lambda=input('lambda = ');
% Ustawiam WPC
x(1)=1;
% uzupelniam wartosci kolejnych x(i) okreslonych ponizszym wzorem
% rekurencyjnym
for i=2:20
    x(i)=lambda*x(i-1);
end
%tworze nowe okno na wykres
figure;
%hold on zeby punkty narysowaly sie na jednym figure
hold on;
%ustawiam tytu³a dla naszego wykresu
title=strcat('lambda = ', num2str(lambda),'  WPC = ', num2str(x(1)));
%rysuje wykres
plot(x,'*r');
%mozemy zrobic hold off po narysowaniu
hold off;
