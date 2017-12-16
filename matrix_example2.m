%% for statement:
for i=1:n
    N(i) = A(i);
end

%% nested for:
for i=1:n
    for j=1:m
        N(i,j) = A(i,j);
    end
end