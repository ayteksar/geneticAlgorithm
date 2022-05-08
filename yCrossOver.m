function [Y, r] = yCrossOver(m,n,Py)

if m == 1 && n == 2
    Z = zeros(4,6);
    
    r3 = randi(4);  % tek noktadan çaprazlama
    A1 = Py(m, 1:r3);
    A2 = Py(n, r3+1:6);
    B1 = [A1 A2];    % Adult1 için çapraz
    
    A1 = Py(n, 1:r3);
    A2 = Py(m, r3+1:6);
    B2 = [A1 A2];    % Adult2 için çapraz
    r3;
    
    Y = [B1; B2; Z(3,:); Z(4,:)];
    r = [r3 0];
    
elseif m == 3 && n == 4
    Z = zeros(4,6);
    
    r4 = randi(4);  % tek noktadan çaprazlama
    A1 = Py(m, 1:r4);
    A2 = Py(n, r4+1:6);
    B3 = [A1 A2];    % Adult1 için çapraz
    
    A1 = Py(n, 1:r4);
    A2 = Py(m, r4+1:6);
    B4 = [A1 A2];    % Adult2 için çapraz
    r4;
    
    Y = [Z(1,:); Z(2,:); B3; B4];
    r = [0 r4];
end
end
