function yq = InterpolacaoFormaNewton(dd, x, xq)
% yq = InterpolacaoFormaNewton(dd, x, xq) calcula os valores interpolados 
% y_q = p_n(x_q) utilizando polinomio interpolador p_n(x) na Forma de 
% Newton. O vetor dd = [f[x_0],f[x_0,x_1],...,f[x_0,x_1,...,x_n]] 
% contem os operadores diferencas divididas necessarios para o calculo e 
% x = [x_0,x_1,...,x_n]' sao os n + 1 pontos de interpolacao. No caso de 
% x_q ser um vetor, y_q é um vetor tal que y_q(i) = p_n(x_q(i)). Neste
% caso, x_q e y_q sao vetores coluna.

n = length(x) - 1;
n2 = length(xq) -1;
yq = zeros(n2+1,1);
% Calcular interpolacao usando Forma de Newton
% Calcular o polinômio
for i = 1 : n2+1
    %calcular o p_n(x_q(i))
    aux = xq(i,1) - x;
    p_n = dd(1,1);
    for j = 2 : n+1
        p_n = p_n +dd(1,j)*prod(aux(1:j-1,1)) ; 
    end
    yq(i,1) = p_n;
    
end



end
