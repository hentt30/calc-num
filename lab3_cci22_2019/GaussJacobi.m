function [x,dr] = GaussJacobi(A,b,x0,epsilon,maxIteracoes)
  %%  
  %Método de Gauss Jacobi
  %Resolve o sistema Ax = b
  %parâmetros:
  %A: matriz
  %x:chute inicial
  %matriz coluna
  %maxIterações: número máximo de iterações  
  %epsilon valor limite para parada
  %%
  %Agora, vamos realizar as modificações necessárias para deixar o sistema na
  %forma x1 = Cx0 +g
  %Criar as matrize C e g
 
  ordem=length(A);
  for i = 1:ordem
      b(i,:)=b(i,:)/A(i,i);
      A(i,:)=A(i,:)/A(i,i);
      A(i,i)= 0;
  end
  A=-A;

%%
%relizar as iterações
%a variável 'e' representa o erro relativo e a variável cont o número de
%iterações
cont=0;
e=[5];
xn=[];

while cont ~= 100 & min(e) > epsilon
    xn= A*x0 + b;
    e=[e,max(abs(xn-x0))/max(abs(xn))];
    x0=xn;
    cont = cont+1;
end
num=length(e);
disp(cont)
x=xn;
dr=e(1,2:num);


end