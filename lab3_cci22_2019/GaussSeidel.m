function [x,dr] = GaussSeidel(A,b,x0,epsilon,maxIteracoes)
    %%
    %Analogamente a Gauss Jacobi, vamos reduzir o sistema a forma: x1= Cx0
    %+g
    ordem = length(A);
    for i = 1:ordem
        b(i,:)=b(i,:)/A(i,i);
        A(i,:)=A(i,:)/A(i,i);
        A(i,i)=0;
    end
    A=-A;
    %%
    %Realizar as iterações usando elementos da mesma iteração
    %A variável 'e' representa o erro reltivo e a variável cont o número de
    %iterações
    cont=0;
    e=[5];
    while cont ~= 100 &  min(e) > epsilon
        aux=x0;
        for i = 1:ordem
            xn(i,:)= A(i, :)*x0 + b(i,:);
            x0(i,:)=xn(i,:);
        end
        e=[e,max(abs(xn-aux))/max(abs(xn))];
        x0=xn;
        cont=cont+1;
    end
    %%
    %Retornar os valores
    num=length(e);
    disp(cont)
    x=xn;
    dr=e(1,2:num);
end