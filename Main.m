%% Açıklama:
% Belirlenen fonksiyon için maksimum değeri Genetik Arama metodu ile bulunacaktır.

%% Maximum Optimization with Genetic Algorithm (2022 Nisan)
% Hazırlayanlar:    Ahmet Yasir TEKSAR
%                   Ali Emre ŞENTÜRK
%                   Cafer Eren  ÖZTÜRK

% Emeği Geçenler:   Ali UZUN        

%%
clc; clear;
% Sabit:
e = 2.718281828;

% Fonksiyon:
f = @(x, y) (5*x - 3*y) + 200;

p = 4;                  % Üretilecek popülasyondaki birey sayısı.
optimal_Solution = 0;   % Başlangıçta maximum nokta 0 seçilir.

%% Adım 1: Popülasyon oluştur. (x, y) değişkenleri için 4x6, 2 tane matris
Px = population(p);         % x değişkeni için popülasyon
Py = population(p);         % y değişkeni için popülasyon
d_Px = bi2deci(Px);         % Binary to Decimal
d_Py = bi2deci(Py);         % Binary to Decimal

%% Fitness Function Değerleri
for i = 1:64    
    for j = 1:64 
        F_value(i,j) = round(f(i-1, j-1));
    end
end

% Verilen fonksiyonun f(x,y)  maksimum değeri bulunur ve saklanır.
Max_Fitness_Value = max(F_value(:));         % en büyük Fitness değerini  bul.

for iteration = 1:10000
    %% Adım 2: Selection: Rulet Tekeri
    % 4 Birey için 4 kez seçim yapılır.
    % 
    S1 = Selection(d_Px, d_Py, f);
    S2 = Selection(d_Px, d_Py, f);
    S3 = Selection(d_Px, d_Py, f);
    S4 = Selection(d_Px, d_Py, f);
    
    S = [S1, S2, S3, S4];       % Roulette Wheel Seçim sonuçları, S € [1,4]
%     Px;
    Px_S = [Px(S1,:); Px(S2,:); Px(S3,:); Px(S4,:)];    % Seçim sonrası Px_S
%     Py;
    Py_S = [Py(S1,:); Py(S2,:); Py(S3,:); Py(S4,:)];    % Seçim sonrası Py_S
    
    
    %% Adım 3: CrossOver yap.
    % -->   Birey 1 ve Birey 2
    %       Birey 3 ve Birey 4, kendi aralarında çaprazlanır. r_x veya
    % r_y değerlerine göre çaprazlama noktaları belirlenir.
    [X12, r1] = xCrossOver(1,2,Px_S);
    [X34, r2] = xCrossOver(3,4,Px_S);
    Cr_x = [X12(1:2,:); X34(3:4,:)];     % Selection sonrası Crossoverlı Kromozomlar
    r_x = [r1(1,1) r2(1,2)];             % çaprazlanacak noktanın konumu
    
    [Y12, r1] = yCrossOver(1,2,Py_S);
    [Y34, r2] = yCrossOver(3,4,Py_S);
    Cr_y = [Y12(1:2,:); Y34(3:4,:)];
    r_y = [r1(1,1) r2(1,2)];              % çaprazlanacak noktanın konumu
    
    %% Adım 4: Mutasyon yap.
    Mu_x = Mutation(Cr_x);
    Mu_y = Mutation(Cr_y);
        
    d_Px = bi2deci(Mu_x);
    d_Py = bi2deci(Mu_y);
    
    %% Adım 5: Fitness Values after Selection-Crossover-Mutation
    for i = 1:4    % x ekseni değerleri
        F_end(i) = round(f(d_Px(i), d_Py(i)));
    end
    
    F_Value = max(F_end(:));
    
    if F_Value >= Max_Fitness_Value-2
        optimal_Solution = F_Value;
         
        iteration;
        
        fprintf('The Max Point (Result of Optimization) : %i\n',optimal_Solution)
        fprintf('Iteration                              : %i\n',iteration)
        break;
    else 
    end    
end

if iteration == 10000
    fprintf('Iteration (%i) is not enough for finding max point\n',iteration)
end