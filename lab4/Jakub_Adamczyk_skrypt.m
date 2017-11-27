%Jakub Adamczyk

clear;

%zmienna do wyboru zadania:
choice = input('Podaj numer zadania, które chcesz uruchomić: ');

if choice == 1
    %Zadanie 1:
    clear;
    %tutaj ustawiamy amplitude dla jakiej chcemy przeprowadzić symulację
    Amplituda = 1;
    %tutaj ustawiamy czestotliwosc dla jakiej chcemy przeprowadzic sym.
    Czestotliwosc = 5;
    open('Jakub_Adamczyk_Model1');
nyquist(    sim('Jakub_Adamczyk_Model1');
    %wykres tego co uzyskujemy po przeprowadzeniu symulacji
    plot(simout);
    
elseif choice == 2
    %Zadanie 2:
    %Sprawdzamy czy układ jest stabilny;
    clear;
    %Definicja dwóch ukłšdów otwartych
    Gs1 = tf([1],[1 1 2]);
    Gs2 = tf([1 0], [1 -0.1 1]);
    
    %Rysujemy wykresy dla zbadania kryterium Nyquista
    figure;
    nyquist(Gs1);
    figure;
    nyquist(Gs2);
    
elseif choice == 3
    %Zadanie 3:
    clear;
    
    %Dolnoprzepustowy:
    Gd = tf([1], [4 1]);
    %Górnoprzepustowy:
    Gg = tf([0.4 0], [0.4 1]);
    %Pasmoprzepustowy:
    Gp = tf([1 0], [1 2 1]);
    %filtr drugiego rzedu:
    G2 = tf([1], [1 0.1 1]);
    
    
    
else
    %Zadanie 4
    clear;
    
    %Długość imienia i nazwiska:
    I=length('Jakub');
    N=length('Adamczyk');
    
    f_max=sqrt(I+N);
    f=f_max/64;
    RC=1/(2*pi*f);
    DNum=[1];
    DDen=[RC, 1];
    DFltr=tf(DNum,DDen);
    figure;
    hold on;
    bode(DFltr, [f_max],'X');
    bode(DFltr);
    
end


    
