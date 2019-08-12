function y = PassoAdamsMoulton4(f, h, y)
% y = PassoAdamsMoulton4(fv, h, y) realiza um avanco com Metodo de 
% Adams-Moulton de ordem 4 a partir do ponto y com passo h. A matriz fv
% contem os valores da funcao derivada necessarios para o calculo:
% fv(4,:) = f(x(i+1), y(i+1,:))
% fv(3,:) = f(x(i), y(i,:))
% fv(2,:) = f(x(i-1), y(i-1,:))
% fv(1,:) = f(x(i-2), y(i-2,:))

y = y + h * (9 * f(4,:) + 19 * f(3,:) - 5 * f(2,:) + f(1,:)) / 24;

end