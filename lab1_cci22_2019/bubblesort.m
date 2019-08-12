function x= bubblesort(y, n)
  tempo=n;
  for i=1:n
      for j=1:(tempo-1)
          if y(1,j)>y(1,j+1)
              aux=y(1,j);
              y(1,j)=y(1,j+1);
              y(1,j+1)=aux;
          end
      end
      
  end
  
x=y;              
    
end

