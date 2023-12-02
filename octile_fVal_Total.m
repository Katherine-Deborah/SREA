clc;
r2=[1];
c2=[1];
open_branches=[];
a=diff(open(:,1));
if (any(a))   % gives 1 if any elementa is not zero
    a=[1;a] % column vector size = 6x1
    [r1]=find(abs(a)>1);  %gives the index where value is not equal to zero . Is a column vector
    r1=[1,r1', size(a,1)];
    for a1=2:numel(r1)-1
        r2=[r2,r1(a1)-1,r1(a1)];    
    end
    r2=[r2,size(a,1)]
end
b=diff(open(:,2));
if (any(b))
    b=[1;b];
    [c1]=find(abs(b)>1);
    c1=[1,c1', size(b,1)];
    for b1=2:numel(c1)-1
        c2=[c2,c1(b1)-1,c1(b1)];    
    end
    c2 = [c2,size(b,1)]
end
if(length(r2)>2)|| (length(c2)>2)
    open_branches=[];
else
    open_branches=open;
    