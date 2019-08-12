function x= merge_sort(y)
if  length(y)== 1
    x=y;
    return;
end

    u1=[];
    u2=[];
    for i= 1:floor(length(y)/2)
        u1=[u1,y(i)];
    end
    for i= floor(1+(length(y)/2)):length(y)
        u2=[u2,y(i)];
    end

     u1=merge_sort(u1);
     u2=merge_sort(u2);
    u1=[u1,10];
    u2=[u2,10];
 
    ini1=1;
    ini2=1;
    
    for m=1:length(y)
        if u1(ini1)< u2(ini2)
            y(m)=u1(ini1);
            ini1=ini1+1;
            
        else 
            y(m)=u2(ini2);
            ini2=ini2+1;
        end
        
    end
    x=y;
    return
    
end