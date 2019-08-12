function c = MinimosQuadrados(Phi, x, y)
% c = MinimosQuadrados(Phi, x, y) realiza ajuste de curva usando o Metodo
% dos Minimos Quadrados (MMQ). Os vetores coluna x = [x_1,x_2,...,x_m]^T
% e y = [y_1,y_2,...,y_m]^T representam os m pontos {(x_1,y_1),(x_2,y_2),
% ...,(x_m,y_m)} para os quais se deseja ajustar uma funcao f*(x) com 
% modelo:
% f*(x) = c_0 * Phi_0(x) + c_1 * Phi_1(x) + ... + c_n * Phi_n(x) = 
% c^T * Phi(x)
% em que Phi(x) = [Phi_0(x),Phi_1(x),...,Phi_n(x)]^T e c = [c_0,c_1,...,
% c_n]^T. No MMQ, determina-se c de modo a minimizar a seguinte funcao de
% custo:
% R(c) = sum_{i=1}^m (f*(x_i) - y_i)^2 =
% sum_{i=1}^m (c^T * Phi(x_i) - y_i)^2
%%
%Dexlaração das variáveis
n = length(Phi) - 1;
A = zeros(n+1, n+1);
b = zeros(n+1, 1);
m = length(x);
%%
%Construção da matriz A
for i = 1:n+1
    for j = 1:n+1
        a=Phi{i};
        r=Phi{j};
        for k = 1:m
        A(i,j) = A(i,j) + a(x(k,1))*r(x(k,1));
        end
    end
end
%%
% Construção da matriz b
for j = 1:n+1
    a = Phi{j};
   
    for k = 1:m
        b(j,1) = b(j,1) + a(x(k,1))*y(k,1);
        
    end
end

%%
%Resolução do sistema
c = linsolve(A,b);

end