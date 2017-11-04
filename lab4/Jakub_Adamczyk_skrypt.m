%Jakub Adamczyk

clear;

%zmienna do wyboru zadania:
choice = input('Podaj numer zadania, które chcesz uruchomiæ: ');

if choice == 1
    %Zadanie 1:
    clear;
    %tutaj ustawiamy amplitude dla jakiej chcemy przeprowadziæ symulacjê
    Amplituda = 1;
    %tutaj ustawiamy czestotliwosc dla jakiej chcemy przeprowadzic sym.
    Czestotliwosc = 5;
    open('Jakub_Adamczyk_Model1');
nyquist(    sim('Jakub_Adamczyk_Model1');
    %wykres tego co uzyskujemy po przeprowadzeniu symulacji
    plot(simout);
    
elseif choice == 2
    %Zadanie 2:
    %Sprawdzamy czy uk³ad jest stabilny;
    clear;
    %Definicja dwóch uk³¹dów otwartych
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
    
end


    
