function T = TabelaDiferencasDivididas(x, y)
% T = TabelaDiferencasDivididas(x, y) calcula a Tabela de Diferencas 
% Divididas T a partir de n + 1 pontos de interpolacao, definidos pelos 
% vetores coluna x = [x_0,x_1,...,x_n]' e y = [f(x_0),f(x_1),...,f(x_n)]'. 
% Adota-se o seguinte formato para T:
% T =
% [ f[x_0]   f[x_0,x_1]   f[x_0,x_1,x_2]   ...   f[x_0,x_1,...,x_n] ]
% [ f[x_1]   f[x_1,x_2]   f[x_1,x_2,x_3]   ...   0                  ]
% [ f[x_2]   f[x_2,x_3]   f[x_2,x_3,x_4]   ...   0                  ]
% [ ...      ...          ...              ...   ...                ]
% [ f[x_n]   0            0                ...   0                  ]
% Note ainda que T tem dimensao (n+1)x(n+1).

n = length(x) - 1;

T = zeros(n+1);

T(:,1) = y;

% Montar Tabela de Diferencas Divididas
for i = 2 : n+1
    for j = 1 : n + 2 - i
            T(j,i) = (T(j,i-1) - T(j+1,i-1))/(x(j,1)-x(j+i-1,1));    
    end
end

end
