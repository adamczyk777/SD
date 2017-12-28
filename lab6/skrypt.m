%Jakub Adamczyk

%Wybór konkretnego zadania ze sprawozdania:
choice = menu('Wybierz, zadanie:', 'Zadanie 1', 'Zadanie 2', 'Zadanie 3', 'Zadanie 4');

switch choice
    %zadanie 1
    case 1
        clear;
        epsilon = 1;
        
        handle = @vanderpol;
        
        initial_conditions = [linspace(-5,5,50);linspace(-5,5,50)];
        
        hold on;
        
        for i=1:length(initial_conditions)
            x = [initial_conditions(1,i);initial_conditions(2,i)];
            plot(handle(x, epsilon));
        end
        hold off;
        
        
    %zadanie 2
    case 2
        clear;
        
    %Zadanie 3
    case 3
        clear;
        
    %Zadanie 4
    case 4
        clear;
          
end