function [Ap, bp] = EliminacaoGauss(A, b)
% [Ap, bp] = EliminacaoGauss(A, b) executa Eliminacao de Gauss com 
% pivoteamento parcial no sistema linear de equacoes A * x = b e retorna o 
% sistema resultante Ap * x = bp, em que Ap eh triangular superior.
%Descobrir a ordem da matriz
ordem=size(A);
tamanho=ordem(1);
%Incluir a matriz coluna b na matriz A
A=[A,b];
%Realização da eliminação de Gauss
for k = 1 : tamanho - 1
    coluna = A(:,k);
    maxi = max(coluna);
    teste = find(coluna==maxi);
    valor = mod(teste(1),tamanho);
    if teste(1) == 0
        valor=1;
    elseif valor==0
        valor=3;
    end
   
    aux=A(1,:);
    A(1,:) = A(valor ,:);
    A(valor, :) =aux;
    
    for i = k+1 : tamanho
        m= A(i,k)/A(k,k);
        A(i,:) = A(i,:) - m*A(k,:);
    end   
end
%Vamos separar as matrizes novamente
C=A(: , 1:tamanho);
n=A(: , tamanho+1 );
%Atribuindo valores as variáveis a serem retornadas
Ap=C;
bp=n;
end