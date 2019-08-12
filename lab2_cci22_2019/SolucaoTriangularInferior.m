function x = SolucaoTriangularInferior(A, b)
% x = SolucaoTriangularInferior(A, b) resolve um sistema linear de equacoes 
% A * x = b em que a matriz A eh triangular inferior e retorna a solucao x.

%Descobrir a dimensão da matriz
ordem=size(A);
tamanho=ordem(1);
%Váriavel útil para a determinação da solução
sol = 0;
%iniciando o vetor de soluções
xp = [b(1,1)/A(1,1)];
for k = 2 : tamanho
    
    for i = 1 : k-1
        sol= sol -xp(i)*A(k,i); 
    end
    valor = (b(k,1)+sol)/A(k,k);
    xp=[xp;valor];
    sol=0;
end
%Retornando a solução
x=xp;
end