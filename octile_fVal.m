function [CBN, CBN_VAL, fVal_ind]= octile_fVal(S,D, open,CBN_VAL)
S;
open;
CBN_VAL;
Int=abs(S-open);
G = 14*min(Int,[],2)+ 10*abs((Int(:,1)-Int(:,2)));
Int=abs(D-open);
H = 14*min(Int,[],2)+ 10*abs((Int(:,1)-Int(:,2)));
fVal=G+H;
[fVal_min, fVal_ind]= min(fVal,[],1);
CBN= open(fVal_ind,:);%------------------
CBN_VAL=[CBN_VAL;CBN];%-----------------
%text(open(:,2)',open(:,1)',string(fVal));% for placing fval
plot([S(2),CBN(2)],[S(1),CBN(1)],'blue','LineWidth',2 );
hold on;
