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
        figure;
        hold on;
        for x0=-4:0.5:4
            [TT,Y] = ode45(@(t, x) handle(t,x, epsilon), [t0,tk], x0);
            plot(TT, Y, 'r');
            ylabel('x(t)');
            xlabel('Czas t');
            title({'Wykres w dziedzinie czasu przyk?adu 1 dla wartosci epsilon = 0.5'});
            axis([0 tk -3 3]);
        end
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
        for i=-2:0.5:2
            for j=-2:0.5:2
                x0=[i,j];
                [TT,Y]=ode45(handle,[t0, tk], x0);
                plot(Y(:,1), Y(:,2), 'r');
            end
        end
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
        for i=-2:0.5:2
            for j=-2:0.5:2
                x0=[i,j];
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
        
        fig=0;

        for eps=0.5:0.5:4.5
            fig=fig+1;

            subplot(3,3,fig)
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
        
        
    case 4
        clear;
        %  Na podstawie przyk?adu 3 pokaza? dzia?anie Tw. Grobmana Hartmana - porównuj?c
        %  portret fazowy systemu nieliniowego i jego linearyzacji w obydwu punktach równowagi.

        
        
end

