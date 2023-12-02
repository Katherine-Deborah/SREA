function [open, open_e1, open_w1,open_n1,open_s1]=openList(X,rect)
%OPEN=[];
open=[];
open_e1=[];
open_w1=[];
open_n1=[];
open_s1=[];
for e1=rect(3):rect(4)
    if ( rect(1) < size(X,2) )&&( X(e1,rect(1)+1)==1 )
        open_e=[e1,rect(1)];
        open=[open;open_e];
        open_e1=[open_e1;open_e];
    end
end
for w1=rect(3):rect(4)
    if (rect(2) >1 )&&( X(w1,rect(2)-1)==1 )
        open_w=[w1,rect(2)];
        open=[open;open_w];
        open_w1=[open_w1;open_w];
    end
end
for n1=rect(2):rect(1)
    %n1
    %rect(3)
    if ( rect(3) > 1 )&&( X(rect(3)-1,n1)==1 )
        open_n=[rect(3),n1];
        open=[open;open_n];
        open_n1=[open_n1;open_n];
    end
end
for s1=rect(2):rect(1)
    if (rect(4) <  size(X,1) )&&( X(rect(4)+1,s1)==1 )
        open_s=[rect(4), s1];
        open=[open;open_s];
        open_s1=[open_s1;open_s];
    end
end
