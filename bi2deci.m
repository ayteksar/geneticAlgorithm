function d = bi2deci(a)
for i = 1:4    
    d(i) = 32*a(i,1) + 16*a(i,2) + 8*a(i,3) + 4*a(i,4) + 2*a(i,5) + 1*a(i,6);
end
end