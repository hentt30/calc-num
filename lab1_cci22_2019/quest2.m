n=10;
x=rand(n,n);
y=rand(n,n);
z=zeros(n,n);
tic
for i=1:n
    for j=1:n
        for k=1:n
            z(i,j)=z(i,j)+x(i,k)*y(k,j);
        end
    end
end
tempo=toc;
disp(tempo)
        