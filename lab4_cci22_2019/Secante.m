function [r, n] = Secante(f, x0, x1, epsilon, maxIteracoes)
% [r,n] = Secante(f,x0,x1,epsilon,maxIteracoes) determina um zero da 
% funcao f(x) a partir dos chutes iniciais x0 e x1 utilizando o Metodo 
% da Secante. O retorno da funcao eh a aproximacao r e o numero de 
% iteracoes n executadas. Considera-se para criterio de parada a 
% ocorrencia de uma das duas situacoes: |f(xi)| < epsilon ou 
% i > maxIteracoes, em que xi eh a aproximacao para a raiz na i-esima
% iteracao.

n = 0;
r1 = x0;
r = x1;
while n < maxIteracoes
    % Implementar Metodo da Secante
    aux = r;
    r = r - (r-r1)*f(r)/(f(r)-f(r1));
    n = n + 1;
    if abs(f(r)) < epsilon 
        break;
    end
end

end
