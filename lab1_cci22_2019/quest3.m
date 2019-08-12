%vetor que vai armazenar os tempos  para o bubble sort
f1=zeros(902);
%variável que armazena o tamanho do vetor
n=1000;
f2=zeros(902);

%vetor que vai armazenar os tempos para o mergesort
f3=zeros(902);





for i=1:902
    f2(i)=n;
    y=rand(1,n);
    c=rand(1,n);
    tic;
    y=bubblesort(y,n);
    f1(i)=toc;
    tic;
    c=merge_sort(c);
    f3(i)=toc;
    n=n+10;
end
plot(f2,f1,'r',f2,f3,'b')
xlabel('Número de elementos','Color','b')
ylabel('Tempo(s)','Color','b')
legend('usando o bubblesort','usando o mergesort','usando o sort')
print -depsc2 grafico.eps
    
