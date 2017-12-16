%while:
 A=ones(10,1);
 N='5';
 i=1;k=1;
 while size(N') < 6
    if A(i) == 1
        N(k) = 'T';
        k=k+1;
    end
    i=i+1;
end
