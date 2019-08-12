function yq = InterpolacaoSplineCubica(x, y, xq)
% yq = InterpolacaoSplineCubica(x, y, xq) realiza interpolacao usando o 
% metodo Spline Cubica. Os vetores coluna x = [x0,x1,...,xn]^T e 
% y = [y0,y1,...,yn]^T são os n + 1 nós de interpolacao. O vetor coluna 
% xq contem os valores para os quais se deseja calcular a interpolacao. 
% A saida da funcao eh o vetor coluna yq tal que yq(j) = p(xq(j)), em que 
% p eh a funcao gerada pelas funcoes splines construidas para cada segmento
% a partir dos n + 1 nos de interpolacao.
%%
% montar a matriz h
h = diff(x);
%%
%Declarações e chamadas de função
n = length(x);
m = length(xq);
[a,b,c,d] = SistemaSplineCubica(x,y);
w = SolucaoTridiagonal(a,b,c,d);
w=[0;w;0];
yq = zeros(m, 1);
%%
%Interpolação Spiline Cúbica
for i = 1:m
   for j = 1:n-1
       if (xq(i,1) >= x(j,1) && xq(i,1) <= x(j+1,1) )
           yq(i,1) = w(j,1)*(x(j+1,1) - xq(i,1))^3/(6*h(j,1)) + w(j+1,1)*(xq(i,1)-x(j,1))^3/(6*h(j,1)) + (y(j+1,1)/h(j,1) -h(j,1)*w(j+1,1)/6)*(xq(i,1)-x(j,1)) + (y(j,1)/h(j,1) -h(j,1)*w(j,1)/6)*(x(j+1,1) - xq(i,1));
           break;
       end
   end
end
    
end