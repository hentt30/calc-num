function [a, b, c, d] = SistemaSplineCubica(x, y)
% [a, b, c, d] = SistemaSplineCubica(x, y) monta o sistema tridiagonal 
% associado ao metodo Spline Cubica.
% As entradas sao os vetores coluna x = [x0,x1,...,xn]^T e 
% y = [y0,y1,...,yn]^T, que representam os n + 1 nos de interpolacao. Ja as
% saidas sao os vetores coluna a = [a1,a2,...,an-1]^T, b = [b1,b2,...,bn-1]^T,
% c = [c1,c2,...,cn-1]^T e d = [d1,d2,...,dn-1]^T, que representam o sistema 
% tridiagonal que se deseja construir na notacao requerida pela funcao
% SolucaoTridiagonal.
%%
% montar a matriz h
h = diff(x);
n = length(h);
%%  
% montar a matriz b
b = zeros(n-1,1);
b = 2*(h(1:n-1,1) + h(2:n,1));
%%
% montar a matriz 'a' e a matriz 'c'
a = zeros(n-1,1);
c = zeros(n-1,1);
a(2:n-1,1) = h(2:n-1,1);
c(1:n-2,1) = h(2:n-1,1);
%%
%montar a matriz r e a matriz d
r = zeros(n,1);
for i = 1:n
    r(i,1) =6*(y(i+1,1) -y(i,1))/(h(i,1));

end
d = diff(r);
    
end
