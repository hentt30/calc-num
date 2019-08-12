function [I, x] = IntegracaoQuadraturaAdaptativa(f, a, b, epsilon)
% [I, x] = IntegracaoQuadraturaAdaptativa(f, a, b, epsilon): usando o 
% Metodo da Quadratura Adaptativa com Regra de Simpson, calcula uma 
% aproximacao para a integral:
%
% I = int_a^b f(x) dx
%
% As entradas sao a função f(x), os extremos do intervalo de integracao
% [a,b] e o erro total na integracao epsilon. As saidas sao o valor da 
% aproximacao da integral I e o vetor coluna x = [x_0,x_1,...,x_n]^T de 
% pontos que foram usados para calcular a integral.

[I, x] = QuadraturaRecursiva(f, a, b, epsilon, a, b);

end

function [I, x] = QuadraturaRecursiva(f, a, b, epsilon, c, d)
% [c, d] eh o subintervalo em que a quadratura adaptativa esta sendo 
% aplicada.
h = (d-c)/2;
x1 = [c:h:d]';
x2 = [c:h/2:d]';
y1 =[];
y2 = [];
for i  = c:h:d
    y1 =[y1;f(i)];
end
for j = c:h/2:d
    y2 = [y2;f(j)];
end
Pi = IntegracaoSimpson(h,y1);
Qi = IntegracaoSimpson(h/2,y2);

if abs(Qi - Pi) < 15*h*epsilon/(b-a)
    I = Qi;
    x = x2;
    
else
    [t,g] = QuadraturaRecursiva(f,a,b,epsilon,c+h,d);
    [j,k] = QuadraturaRecursiva(f,a,b,epsilon,c,c+h);
    I = t + j;
    x =[k;g(2:end,1)];
end
end