%criando os vetores que vão ser usados para o produto escalar
x=rand(1,10000000);
y=rand(1,10000000);
%criando os vetores que vão armazenar o tempo de cada operação
t1=zeros(1,1000);
t2=zeros(1,1000);
%criando os vetores que armazenarão as médias para diminuir o ruído
 n2=zeros(1,1000);
 n1=zeros(1,1000);
for n=1:1000
    tic;
    x*y';
    t1(n)=toc;
end
for n=1:1000
    % criando a variável que vai armazenar o valor do produto escalar
    soma=0
    tic
    for w=1:10000000
        soma=soma+x(w)*y(w);
    end
    t2(n)=toc
end

for n=1:1000    
    n1(n)=mean(t1(1:n));
    n2(n)=mean(t2(1:n));
end
plot(1:1000,n1,'r',1:1000,n2,'b')
xlabel('interações','Color','b')
ylabel('tempo(s)','Color','b')
legend('usando operações nativas','sem operações nativas')
print -depsc2 grafico.eps

