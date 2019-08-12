function [r, n] = PosicaoFalsa(f, a, b, epsilon, maxIteracoes)
% [r,n] = PosicaoFalsa(f,a,b,epsilon,maxIteracoes) determina uma aproximacao 
% para um zero contido no intervalo [a,b] da funcao f(x) utilizando o 
% Metodo da Posicao Falsa. O retorno da funcao eh a aproximacao r e o 
% numero de iteracoes n executadas. Considera-se para criterio de parada a 
% ocorrencia de uma das duas situacoes: |f(xi)| < epsilon ou 
% i > maxIteracoes, em que xi eh a aproximacao para a raiz na i-esima
% iteracao.

n = 0;
while n < maxIteracoes
    % Implementar Metodo da Posicao Falsa
    mod1 = abs(f(a)) ;
    mod2 = abs(f(b)) ; 
    r = (a*mod1 + b*mod2)/(mod1 + mod2);
    n = n + 1;
    yr = f(r);
    if abs(yr) < epsilon
        break;
    end
    if  f(a) * yr < 0
        b = r;
    else
        a = r;
    end
     
end

end
