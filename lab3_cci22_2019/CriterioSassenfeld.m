function [B,flag] = CriterioSassenfeld(A)
    %%
    %para facilitar os cálculos, vamos deixar todos os valores de A
    %positivos
    %vamos criar o vetor b para armazenar os betas
    A = abs(A);
    ordem = length(A);
    b = zeros(1,ordem);
    %%
    %Cálculo dos Betas
    %Cálculo do Beta 1
    b(1,1)=sum(A(1,2:ordem))/A(1,1);
    %Cálculo dos demais betas
    for i = 2:ordem
        b(1,i)=(  A(i,1:i-1)*b(1,1:i-1)' + sum(A(i,i+1:ordem)))/A(i,i);
    end
    %%
    %Verificação do critério de Sassenfeld
    B=b;
    if max(b) < 1
        flag=true
    else
        flag=false
    end
end