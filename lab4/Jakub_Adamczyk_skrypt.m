%Jakub Adamczyk

clear;

%zmienna do wyboru zadania:
choice = menu('Zadanie: ', 'Zadanie 1', 'Zadanie 2', 'Zadanie 3', 'Zadanie 4');

switch choice
    case 1
        %Zadanie 1:
        clear;
        %tutaj ustawiamy amplitude dla jakiej chcemy przeprowadziÄ‡ symulacjÄ™
        Amplituda = 1;
        %tutaj ustawiamy czestotliwosc dla jakiej chcemy przeprowadzic sym.
        Czestotliwosc = 5;
        open('Jakub_Adamczyk_Model1');
        sim('Jakub_Adamczyk_Model1');
        %wykres tego co uzyskujemy po przeprowadzeniu symulacji
        plot(simout);
    case 2
         %Zadanie 2:
        %Sprawdzamy czy uklad jest stabilny;
        clear;
        %Definicja dwoch ukladow otwartych
        Gs1 = tf([1],[1 1 2]);
        Gs2 = tf([1 0], [1 -0.1 1]);
    
        %Rysujemy wykresy dla zbadania kryterium Nyquista
        figure;
        nyquist(Gs1);
        figure;
        nyquist(Gs2);
    case 3
        %Zadanie 3:
        clear;
        %ró¿ne amplitudy:
        Amps = [2,3,1,2,4];
        %rozne czestotliwosci do testowania:
        Freqs = [0.001,1,30,0.01,5];
        %Przesuniecia fazowe:
        fis = [1,5,2,1,0];

        choice = menu('Wybierz filtr', 'Dolnoprzepustowy', 'Gornoprzepustowy', 'Pasmoprzepustowy', 'filtr drugiego rzedu');

        switch choice
            case 1
                %Dolnoprzepustowy
                Licznik = [1];
                Mianownik = [4 1];
            case 2
                % Gornoprzepustowy
                Licznik = [0.4 0];
                Mianownik = [0.4 1];
            case 3
                %Pasmoprzepustowy:
                Licznik = [1 0];
                Mianownik = [1 2 1];
            case 4
                %filtr drugiego rzedu:
                Licznik = [1];
                Mianownik = [1 0.1 1];
        end

        FiltrDlaBode = tf(Licznik, Mianownik);

        for i=1:5
            %Ustawiam amplitude
            Amplituda = Amps(i);
            %Ustawiam czestotliwosc
            Czestotliwosc = Freqs(i);
            %Ustawiam Przesuniecie fazowe
            Faza = fis(i);
            %tworze nowe okno na wykres
            figure;
            hold on;
            %przeprowadzam symulacje:
            sim('model_zad3');
            title(strcat('Przyklad filtrowania: ', num2str(i), 'Amplituda = ', num2str(Amplituda), ' Czestotliwosc = ', num2str(Czestotliwosc), ' Faza = ', num2str(Faza)));
            %rysuje wykres na podstawie danych symulacji:
            plot(simout);
            hold off;
        end
        
        %okno dla bode:
        figure;            
        bode(FiltrDlaBode);
    case 4
        %Zadanie 4
        clear;

        %Obliczenia pozadanego RC=T
        %Z podstawienia do wzoru 20=10*log(T^2*omega^2+1)
        %po podstawieniu omegi=2*pi*f
        %gdze jeœli dobrze rozumiem f to f graniczne równe dla mojego
        %imienia i nazwiksa sqrt(13), daje nam okolo
        T=0.44;
        
        %Podstawianie do Transmitancji
        Licznik = [1];
        Mianownik = [T, 1];
        %Transmitancja
        Transmitancja = tf(Licznik, Mianownik);
        %wykres dla naszych danych
        bode(Transmitancja);
        
end