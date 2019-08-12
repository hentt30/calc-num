function [L, U, P] = DecomposicaoLU(A)
% [L, U, P] = DecomposicaoLU(A) realiza Decomposicao LU com pivoteamento 
% parcial da matriz A e retorna as matrizes resultantes, em que L eh 
% triangular inferior, U eh triangular superior e P eh a matriz de 
% permutacoes devido ao pivoteamento parcial.

ordem = size(A);
tamanho = ordem(1);
p = eye(tamanho);
booleana=0;
for j= 1:tamanho-1
    coluna = A(:,j);
    maxi=max(coluna);
    teste=find(coluna==maxi);
    valor=mod(teste(1),tamanho);
    if teste(1)==0
        valor=1;
    elseif valor==0
        valor=3;
    end
    aux=A(1,:);
    A(1,:)=A(valor,:);
    %trocar as linhas em P
    aux=p(1,:);
    p(1,:)=p(valor,:);
    p(valor, :)=aux;
    A(valor, :)=aux;
        if maxi == 0
        %a matriz é singular
        boolena=1;
        break;
    else
        r=1/maxi;
        for i = j+1 : tamanho
            m=A(i,j)*r;
            A(i,j)=m;
            A(i, :)= A(i, :) - m*A(j,:);
        end
    end
end
if booleana == 0
l=eye(tamanho);
%Separar as matrizes em L e U
for i = 1: tamanho
    for j = 1: i-1
        l(i,j)=A(i,j);
        A(i,j)=0;
    end

end
%retornar valores pedidos
L=l;
P=p;
U=A;
elseif booleana == 1
    disp('a amtriz eh singular');
end

end