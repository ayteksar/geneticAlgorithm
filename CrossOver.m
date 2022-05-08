function Y = CrossOver(P, n);
% n = çaprazlanacak kromozomdaki bit sayısı
[x1 y1] = size(P);
Z = zeros(2*n, y1); % Kromozomların kopyasını üretir

for i = 1:n
    % 1x2 büyüklüğünde 1-4 arası sayı üretelim
    r1 = randi(x1, 1, 2);
    while r1(1) == r1(2)
        % Eşit olma durumunda tekrar sayı üret
        r1 = randi(x1, 1, 2);
    end
    A1 = P(r1(1), :);   % Yetişkin 1
    A2 = P(r1(2), :);   % Yetişkin 2
    
    % kesme noktasını belirle.
    r2 = 1 + randi(y1-1);
    
    B1 = A1(1, r2:y1);
    A1(1, r2:y1) = A2(1, r2:y1); % 6 bit olduğu için r2:6
    A2(1, r2:6) = B1;           % 6 bit olduğu için r2:6
    Z(2*i-1, :) = A1;   % Yeni Kromozom 
    Z(2*i, :) = A2;     % Yeni Kromozom 
end
Y=Z;

