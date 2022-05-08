function [X, r] = xCrossOver(m,n,Px)

if m == 1 && n == 2
    Z = zeros(4,6);
    
    r1 = randi(4);  % tek noktadan çaprazlama
    A1 = Px(m, 1:r1);
    A2 = Px(n, r1+1:6);
    B1 = [A1 A2];    % Adult1 için çapraz
    
    A1 = Px(n, 1:r1);
    A2 = Px(m, r1+1:6);
    B2 = [A1 A2];    % Adult2 için çapraz
    r1;
    
    X = [B1; B2; Z(3,:); Z(4,:)];
    r = [r1 0];
    
elseif m == 3 && n == 4
    Z = zeros(4,6);
    
    r2 = randi(4);  % tek noktadan çaprazlama
    A1 = Px(m, 1:r2);
    A2 = Px(n, r2+1:6);
    B3 = [A1 A2];    % Adult1 için çapraz
    
    A1 = Px(n, 1:r2);
    A2 = Px(m, r2+1:6);
    B4 = [A1 A2];    % Adult2 için çapraz
    r2;
    
    X = [Z(1,:); Z(2,:); B3; B4];
    r = [0 r2];
end
end
