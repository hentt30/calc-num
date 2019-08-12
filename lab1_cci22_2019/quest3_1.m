
%variável que armazena o tamanho do vetor
n=1000;
f2=zeros(902);
%vetor que vai armazenar os tempos para a função sort
f4=zeros(902);



for i=1:902
    f2(i)=n;
  
    g=rand(1,n);
    tic;
    g=sort(g);
    f4(i)=toc;
    n=n+10;
end
plot(f2,f4,'b')
xlabel('Número de elementos','Color','b')
ylabel('Tempo(s)','Color','b')
print -depsc2 grafico.eps
    
