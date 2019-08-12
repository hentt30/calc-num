function I = IntegracaoSimpson(h, y)
% I = IntegracaoSimpson(h, y): usando a Regra Composta de Simpson, calcula
% uma aproximacao para a integral:
%
% I = \int_a^b f(x) dx
%
% Considera-se n+1 pontos {x_0=a,x_1,...,x_n=b} igualmente espacados no
% intervalo de integracao [a,b]. No caso, o espacamento entre dois pontos
% consecutivos eh h = x_{i} - x_{i-1} = (b - a) / n. As entradas da funcao
% sao h e o vetor coluna y = [y_0,y_1,...,y_n]^T, em que y_i = f(x_i),
% i=0,1,...,n. Note que, na Regra Composta de Simpson, deve-se ter n par.
n = length(y);
I = y(1,1) + y(n,1);
I = I + 4*sum(y(2:2:n-1,1)) + 2*sum(y(3:2:n-2,1));
I = h*I/3;
end