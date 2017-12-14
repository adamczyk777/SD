%Jakub Adamczyk

clear;

% menu do wyboru danego zadania
choice = menu('Wybierz zadanie: ', 'Stabilnosc punktow rownowagi', 'Wplyw wartosci epsilon na rozmiar otoczenia', 'Wplyw braku hiperbolicznosci na podst. prz. 2', 'Dzialanie twierdzenia GH na podst prz. 3');

% Switch z odpowiednimi numerami zadania:
switch choice
    case 1
        clear;
        %  Zbada? i zilustrowa? wykresami w dziedzine czasu (dla przyk?adu 1) i portretami fazowymi
        %  (dla przyk?adów 2 i 3) stabilno?? punktów równowagi;
        
        %okreslenie czasu poczatkowego i koncowego
        t0 = 0;
        tk = 10;
        
        %przyklad 1:
        
        % epsilon ze wzoru w przyk?adzie
        epsilon = 0.5;
        %funkcja defiiuj?ca rownanie rozniczkowe do rozwiazania w osobnym
        %pliku
        handle = @function_handle1;
        
        %logika tworzenia wykresów:
        
        %Przyk?ad 1:
        figure;
        hold on;
        %iteruje po kolejnych wartosciach poczatkowych
        for x0=-4:0.5:4
            %zapisuje wyniki do zmiennej
            [TT,Y] = ode45(@(t, x) handle(t,x, epsilon), [t0,tk], x0);
            %rysuje wykres wraz z opisem osi tytulem i definicja jakie mamy
            %osie
            plot(TT, Y, 'r');
            ylabel('x(t)');
            xlabel('Czas t');
            title({'Wykres w dziedzinie czasu przyk?adu 1 dla wartosci epsilon = 0.5'});
            axis([0 tk -3 3]);
        end
        %dodatkowe powtorzenie trajektorii w innym kolorze dla punktow rownowagi
        x0 = 0;
        [TT,Y] = ode45(@(t, x) handle(t,x, epsilon), [t0,tk], x0);
        plot(TT, Y, 'c');
        x0 = 2;
        [TT,Y] = ode45(@(t, x) handle(t,x, epsilon), [t0,tk], x0);
        plot(TT, Y, 'c');
        hold off;
        % jak widac w punkcie x0 = 0 mamy stabilny lokalnie punkt
        % rownowagi, a w punkcie x0 = 2 mamy niestabilny punkt rownowagi,
        % poniewaz w 0 inne trajektorie zbiegaja do tej wartosci, gdzie w
        % x0 = 2 wartosci te nie zbiegaja a wrecz uciekaja
        
        %Przyklad 2:
        
        handle = @function_handle2;
        
        figure;
        hold on;
        %iteruje po roznych wartoscaich poczatkowych
        for i=-2:0.5:2
            for j=-2:0.5:2
                %ustalenie punktu poczatkowego w formie wektora
                x0=[i,j];
                %obliczanie wartosci
                [TT,Y]=ode45(handle,[t0, tk], x0);
                plot(Y(:,1), Y(:,2), 'r');
            end
        end
        %dodatkowo stworzone kolka dla lepszego zobrazowania punktów
        %rownowagi na portrecie fazowym
        x0 = [0,0];
        plot3(0,x0(1),x0(2),'og');
        [TT,Y] = ode45(handle, [t0, tk], x0);
        plot(Y(:,1), Y(:,2), 'c');
        hold off;
        ylabel('x2(t)');
        xlabel('x1(t)');
        title({'Portret fazowy przyklad 2'});
        axis([-2 2 -2 2]);
        
        %Przyk?ad 3:
        
        handle = @function_handle3;
        
        figure;
        hold on;
        %iteracja po kolejnych wartosciach do wektora punktu poczatkowego
        %j.w.
        for i=-2:0.5:2
            for j=-2:0.5:2
                %deklaracja wartosci wektora dla punktu poczatkowego
                x0=[i,j];
                %obliczanie wartosci metoda dormanda prince'a
                [TT,Y]=ode45(handle,[t0, tk], x0);
                plot(Y(:,1), Y(:,2), 'r');
            end
        end
        x0 = [0,0];
        plot3(0,x0(1),x0(2),'og');
        [TT,Y] = ode45(handle, [t0, tk], x0);
        plot(Y(:,1), Y(:,2), 'c');
        x0 = [-2/3,0];
        [TT,Y] = ode45(handle, [t0, tk], x0);
        plot3(0,x0(1),x0(2),'og');
        plot(Y(:,1), Y(:,2), 'c');
        hold off;
        ylabel('x2(t)');
        xlabel('x1(t)');
        title({'Portret fazowy przyklad 3'});
        axis([-2 2 -2 2]);
        
    case 2
        clear;
        %  Na podstawie przyk?adu 1 zanalizowa? wp?yw warto?ci epsilon na rozmiar otoczenia, w którym
        %  dynamiki systemu zlienaryzowanego i nieliniowego s? podobne;
        t0=0;
        tk=10;
        
        handle=@function_handle1;
        
        %rysuje okno z wykresem dla danego epsilon po ktorym iteruje j.w. w
        %zadaniu 1 gdzie rysowalismy to samo tylko z jednym epsilon
        for eps=0:0.5:4
            figure;
            hold on;
            for x0=-4:0.5:4
                [TT,Y]=ode45(@(t,x) handle(t, x, eps), [t0, tk], x0);
                plot(TT,Y,'r');
                ylabel('x(t)');
                xlabel('Czas t');
                title({'eps=';eps});
                axis([0 tk -3 3]);
            end
            x0=1/eps;
            [TT,Y]=ode45(@(t, x) handle(t, x, eps), [t0, tk], x0);
            plot(TT,Y,'b');
            hold off
        end
        
    case 3
        clear;
        %  Na podstawie przyk?adu 2 zweryfikowa? wp?yw braku hiperboliczno?ci;
        
        % dwa handle do funkcji pierwszy do oryginalnej niezlinearyzowanej,
        % drugi do zlinearyzowanej wersji równania
        handle = @function_handle2;
        handle_hyperbolic = @function_handle4;
        
        %Wartosci dla rpzedzialu czasu t poczatkowe i koncowe
        t0 = 0;
        tk = 20;
        
        %calosc logiki rysowania odbywa sie tak samo jak we wczesniejszych
        %zadaniach
        figure;
        hold on;
        for i=-2:0.5:2
            for j=-2:0.5:2
             x0=[i,j];
             [TT,Y]=ode45(handle,[t0, tk],x0);
             plot3(TT, Y(:,1),Y(:,2),'r');
             [TT,Y1]=ode45(handle_hyperbolic, [t0, tk],x0);
             plot3(TT, Y1(:,1),Y1(:,2),'b');
            end
        end
        hold off
        %podpis osi
        ylabel('x_1(t)');
        xlabel('x_2(t)');
        % ustawienie odpowiednich skal dla osi na wykresie 3d
        axis([0 tk -2 2 -2 2]);
        
    case 4
        clear;
        %  Na podstawie przyk?adu 3 pokaza? dzia?anie Tw. Grobmana Hartmana - porównuj?c
        %  portret fazowy systemu nieliniowego i jego linearyzacji w obydwu punktach równowagi.
        
        % wskazniki do funkcji
        %oryginalna:
        handle_orig = @function_handle3;
        %dla xr=[-2/3, 0]:
        handle_23rds = @function_handle5;
        %dla xr=[0, 0]:
        handle_zeros = @function_handle6;
        
        %czasy poczatkowy i koncowy
        t0 = 0;
        tk = 20;
        
        figure;
        hold on;
        for i=-1:0.2:0
            for j=-0.5:0.2:1
             x0=[i,j];
             plot(i,j,'o');
             [TT,Y]=ode45(handle_orig, [t0, tk], x0);
             plot(Y(:,1),Y(:,2),'r');

             [TT,Y1]=ode45(handle_zeros, [t0, tk], x0);
             plot(Y1(:,1),Y1(:,2),'b');
            end
        end
        x0=[-2/3,0];
             plot(-2/3,0,'*k');
             [TT,Y]=ode45(handle_orig, [t0, tk], x0);
             plot(Y(:,1),Y(:,2),'c');

        hold off
        %plot3(TT,Y(:,1),Y(:,2),'r',TT,Y1(:,1),Y1(:,2),'b',TT,Y2(:,1),Y2(:,2),'k',TT,Y3(:,1),Y3(:,2),'c',TT,Y4(:,1),Y4(:,2),'b',TT,Y5(:,1),Y5(:,2),'k',TT,Y6(:,1),Y6(:,2),'c');
        axis([-1 0.5 -0.6 0.8]);
        zlabel('x_1(t)');
        ylabel('x_2(t)');
        xlabel('Czas t');
        legend('warto?ci pocz?tkowe','system nieliniowy','system liniowy');

        
        
end

