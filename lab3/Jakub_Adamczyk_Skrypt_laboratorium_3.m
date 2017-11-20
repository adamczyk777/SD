%Jakub Adamczyk
clear;

%wybieranie zadania:
zad = input('podaj numer zadania do wykonania zad = ');

%Zadanie 1:
if zad == 1
    %Nasze WPC czyli x(1)
    x(1)=input('podaj WPC x(1) = ');

    %Wprowadzamy lambde:
    lambda = input('podaj lambde, lambda = ');

    % uzupelniam wartosci kolejnych x(i) okreslonych ponizszym wzorem
    % rekurencyjnym
    for i=2:20
        x(i)=lambda*x(i-1);
    end
    %tworze nowe okno na wykres
    figure;
    %hold on zeby punkty narysowaly sie na jednym figure
    hold on;
    %ustawiam tytuła dla naszego wykresu
    title=strcat('lambda = ', num2str(lambda),'  WPC = ', num2str(x(1)));
    %rysuje wykres
    plot(x,'*r');
    %mozemy zrobic hold off po narysowaniu
    hold off;

elseif zad == 2
    %Zadanie 2:
    clear;

elseif zad == 3
    %Zadanie 3:
    clear;
    %kwota początkowa
    K_0 = input('kwota poczatkowa = ');
    r = input('stopa procentowa w skali roku = ');
    n = input('ile lat pieniadze s ana lokacie n = ');
    for m=1:12
        %Wzór na kwote po n lat dla r stopy i m kapitalizacji w roku
        K(m)=K_0*(1+r/m)^(m*n);
    end 
    %rysowanie wykresu
    figure;
    hold on;
    title = strcat('kwota zgromadzona po ', num2str(n),' latach, przy oprocentowaniu ', num2str(r), '%, oraz kapitalizacji ', num2str(m), ' razy w roku'); 
    plot(K,'*r');
    hold off;
else
    %Zadanie 4:
end
