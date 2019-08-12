function p = PolinomioInterpolador(x, y)
% p = PolinomioInterpolador(x, y) determina o polinomio interpolador 
% p_n(x) a partir de n + 1 pontos de interpolacao, definidos pelos vetores
% coluna x = [x_0,x_1,...,x_n]' e y = [f(x_0),f(x_1),...,f(x_n)]'. O vetor 
% linha p eh escrito na seguinte forma:
% p = [ a_n   a_{n-1}   a_{n-2}   ...   a_0 ]
% De modo a representar um polinomio interpolador p_n(x) na forma:
% p_n(x) = a_n * x^n + a_{n-1} * x^{n-1} + a_{n-2} * x^{n-2} + ... + a_0
% Note que este formato de p eh coerente com o esperado pela funcao 
% polyval.

n = length(x) - 1;
X = zeros(n+1);
% Montar matriz X
for i = 1:n+1 
    for j = 1:n+1
        X(i,j) = x(i,1)^(j-1);
    end
end

a = linsolve(X, y);

p = fliplr(a');

end
