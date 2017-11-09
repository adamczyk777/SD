%Jakub Adamczyk

%Najppiew czyszcz? konsol? (m.in ró?ne zmienne globalne)
clear;

%macierz P jako jednostkowa:
P=eye(2);

J=[0,1;0,0];

%Zmienna A przechowuj?ca macierz zapisan? w postaci Kanonicznej Jordana
A=P*J*P^-1;

%ustawiam hold on przed rozpoczeciem p?tli, zgodnie ze skryptem dla
%poprawnego narysowania wykresu gdzie jest wiecej ni? jedna trajektoria
hold on;
%for x=0:pi/30:2*pi
for x=-25:25
    %Deklaruj? tutaj wektor WPC warto?ci poczatkowej, który zawiera warto?ci odpowiednio sin(x)
    %i cos(x) jak napisano w skrypcie
    % WPC Dla ko?a
    %WPC=[sin(x);cos(x)];
    % WPC Dla Kwadratu
    ro=max(abs(sin(x)),abs(cos(x)));
    WPC=[cos(x)/ro, sin(x)/ro];
    open 'jakub_adamczyk_model';
    sim('jakub_adamczyk_model');
    plot(x(:,1), x(:,2));
    
end;
hold off;

