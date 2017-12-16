%% Empty matrix:
A =zeros(m,n);
B = char(m,n);

%% if statement:
if A(i,j) == 0
	N(i,j) = A(i-1,j-1);
end
