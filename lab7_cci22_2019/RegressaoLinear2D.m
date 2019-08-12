function c = RegressaoLinear2D(x1, x2, y)
% c = RegressaoLinear2D(x1, x2, y) realiza Regressao Linear com duas 
% variaveis independentes x_1 e x_2. Os vetores coluna x_1 = [x_{11},
% x_{12},...,x_{1m}]^T, x_2 = [x_{21},x_{22},...,x_{2m}]^T e y = 
% [y_1,y_2,...,y_m]^T representam os m pontos {(x_{1i},x_{2i},y_i)},
% i=1,...,m para os quais se deseja ajustar uma funcao de duas variaveis
% f*(x_1,x_2) que define um plano no R^3:
% f*(x_1,x_2) = c_0 + c_1 x_1 + c_2 x_2
% Assim, a funcao determina c = [c_0,c_1,c_2]^T que minimiza a seguinte 
% funcao de custo:
% R(c_0,c_1) = sum_{i=1}^m (f*(x_i) - y_i)^2 = 
% sum_{i=1}^m (c_0 + c_1 * x_{1i} + c_2 * x_{2i} - y_i)^2
%%
%Declaração de variáveis
m = length(x1);
A = zeros(3,3);
b = zeros(3,1);
%%
%Montar a matriz A
A(1,1) = m;
A(2,2) = sum(x1.^2);
A(3,3) = sum(x2.^2);
A(1,2) = sum(x1);   
A(1,3) = sum(x2);
A(2,3) = sum(x1.*x2);
A(2,1) = A(1,2);
A(3,1) = A(1,3);
A(3,2) = A(2,3);

%%
%montar a matriz b
b(1,1) = sum(y);
b(2,1) = sum(x1.*y);
b(3,1) = sum(x2.*y);

%%
%Resolver o sistema
c = linsolve(A,b);
end