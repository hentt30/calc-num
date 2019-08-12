function yq = InterpolacaoLinear(x, y, xq)
% yq = InterpolacaoLinear(x, y, xq) realiza interpolacao linear. Os 
% vetores coluna x = [x0,x1,...,xn]^T e y = [y0,y1,...,yn]^T sao os
% n + 1 nós de interpolacao. O vetor coluna xq contem os valores para os 
% quais se deseja calcular a interpolacao. A saida da funcao eh o vetor 
% coluna yq tal que yq(j) = p(xq(j)), em que p eh a funcao gerada pelas 
% funcoes afins construidas para cada segmento a partir dos n + 1 nos de 
% interpolacao.
%%
%Declarações
n = length(x);
m = length(xq);
yq = zeros(m,1);
%%
% Interpolação linear
for i = 1:m
    for j= 1:n-1
        if (xq(i,1) >= x(j,1) && xq(i,1) <= x(j+1,1) )
            m=((y(j+1,1) - y(j,1))/(x(j+1,1) - x(j,1)));
            yq(i,1) = xq(i,1)*m + y(j,1) -x(j,1)*m;
            break;
        end
    end
end

end