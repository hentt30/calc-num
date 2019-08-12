function [c, r] = RegressaoLinear(x, y)
% [c, r] = RegressaoLinear(x, y) realiza Regressao Linear de modo a obter 
% a melhor reta que aproxima os pontos m pontos {(x_1,y_1),(x_2,y_2),...,
% (x_m,y_m)} no sentido de minimos quadrados. Assim, tem-se um caso 
% particular de MMQ em que o modelo para f*(x) e: 
% f*(x) = c_0 + c_1 * x = c^T [1; x]
% em que c = [c_0,c_1]^T. Alem disso, a funcao calcula o coeficiente de 
% correlacao r como estimativa da qualidade do ajuste:
% r = sqrt((R_M-R)/R_M)
%em que:
% R = sum_{i=1}^m (f*(x_i) - y_i)^2 = sum_{i=1}^m (c_0+c_1*x_i-y_i)^2
% R_M = sum_{i=1}^m [((sum_{i=1}^m y_i)/m) - y_i]^2
%%
%Declarações
m = length(x);
c = zeros(2,1);
%%
%Cálculo da matriz c
c(1,1) = (sum(x.^2)*sum(y) -sum(x)*sum(x.*y))/(m*sum(x.^2)-(sum(x)^2));
c(2,1) =  ((sum(x.*y)-sum(x)*sum(y)/m))/(sum(x.^2)-(sum(x)^2)/m);
%%
%cálculo do r
xq = zeros(m,1);
for i = 1:m
xq(i,1) = c(2,1)*x(i,1) + c(1,1);
end
R = sum((xq-y).^2);
RM = sum((mean(y)-y).^2);
r=sqrt((RM-R)/RM);  
end