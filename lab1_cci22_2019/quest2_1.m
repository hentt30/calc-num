n=1000;
x=rand(n,n);
y=rand(n,n);
tic
z=x*y;
tempo=toc;
disp(tempo)