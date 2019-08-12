function ComparacaoPVC()
% Compara solucao numerica de PVC utilizando o PVC 
% y'' + 2 * y' + y = 0, y(0) = 0, y(1) = -1, x em [0,1]

h = 0.02;
x = 0:h:1;
y0 = 0;
yn = -1;

g1 = @(x) 2;
g2 = @(x) 1;
r = @(x) x;

yNum = ProblemaValorContorno(g1, g2, r, x, y0, yn);
y = 2 .* exp(-x) .* (1-x) + x - 2;

plot(x,y, 'o-');
hold on;
plot(x,yNum, '*-r');
legend('Analitica', 'Numerica');
xlabel('x');
ylabel('y');
grid on;
title('Solucao de Problema de Valor de Contorno');

end