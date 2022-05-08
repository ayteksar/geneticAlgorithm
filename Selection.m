function Y = Selection(d_Px, d_Py, f)
total_Fitness=0;

for i = 1:4
    total_Fitness = total_Fitness + f(d_Px(i), d_Py(i));
end

i = randi(round(total_Fitness));
total_Fitness;

limit1 = f(d_Px(1), d_Py(1));
limit2 = f(d_Px(1), d_Py(1)) + f(d_Px(2), d_Py(2));
limit3 = limit2 + f(d_Px(3), d_Py(3));
limit4 = limit3 + f(d_Px(4), d_Py(4));


if 0 <= i && i <= limit1
    Y = 1;
    
elseif limit1 <= i && i <= limit2
    Y = 2;
    
elseif limit2 <= i && i <= limit3
    Y = 3;
    
elseif limit3 <= i && i <= limit4
    Y = 4;
    
end
end