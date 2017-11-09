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
    %Deklaruj? tutaj wektor WPC warto?ci poczatkowej
    % WPC Dla ko?a [sin(x),cos(x)]
    %WPC=[sin(x);cos(x)];
    % WPC Dla Kwadratu ro = max(|sin(x)|,|cos(x)|) WPC
    % [sin(x)/ro,cos(x)/ro]
    ro=max(abs(sin(x)),abs(cos(x)));
    WPC=[cos(x)/ro, sin(x)/ro];
    %otwieram plik z modelem
    open 'jakub_adamczyk_model';
    %przeprowadzam symulacj?
    sim('jakub_adamczyk_model');
    %rysuj? na podstawie danych symulacji wykres, argumentami sa kolejne
    %wiersze macierzy o wymiarach 2 x liczbakrokow
    plot(x(:,1), x(:,2));
    
end;
hold off;

