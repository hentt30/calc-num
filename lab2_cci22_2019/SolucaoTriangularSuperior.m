function x = SolucaoTriangularSuperior(A, b)
% x = SolucaoTriangularSuperior(A, b) resolve um sistema linear de equacoes
% A * x = b em que a matriz A eh triangular superior e retorna a solucao x.

    %Descobrir a dimensão da matriz
    dimensao = size(A);
    linhas = dimensao(1);
    colunas = dimensao(2);
    %Variável útil para determinação da solução
    sol=0;
    %iniciar o vetor de soluções
    xp=[b(colunas,1)/A(linhas,colunas)]
    %Realizar o cálculo de soluções
    for i = (linhas-1) : -1 : 1
        
        for j = colunas : -1 : i +1
            aux = colunas-j+1;
        
            sol = sol-xp(aux)*A(i,j);
        end
        sol=(b(i,1)+sol)/A(i,i);
        xp=[xp;;sol] ;
        sol=0;
    end
    %Retornando a solução
    x=xp;
    
end