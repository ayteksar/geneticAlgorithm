function Y = Mutation(Cr_Kromozom)

for k = 1:10
    i = randi(4);        % Kromozom seçilir.
    j = 1 + randi(4);    % Kromozomun bit'i seçilir. (2,5)
    
    
    if Cr_Kromozom(i,j) == 1
        Cr_Kromozom(i,j) = 0;
    elseif Cr_Kromozom(i,j) == 0
        Cr_Kromozom(i,j) = 1;
    end
end

Y = Cr_Kromozom;
end
