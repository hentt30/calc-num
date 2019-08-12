function flag = CriterioLinhas(A)
  %Descobrir o número de colunas
  unum_colunas = length(A);
  %criando um vetor de booleanas
  bool = zeros(1,10); %Usando para evitar análises repetidas
  %Deixando todos os elementos de A positivos
  A=abs(A);
  for i = 1:unum_colunas
          if A(i,i) >  sum(A(i,:)) - A(i,i) & bool(1,i) == 0
              bool(1,i) = 1;
          
          end
  end
  if sum(bool) == unum_colunas
      flag=true
  else
      flag=false
  end
end
