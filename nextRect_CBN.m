function [CBN1,fVal_ind, open1, CBN_VAL]=nextRect_CBN(S,D, CBN,open_e1,open_w1, open_s1, open_n1, open,CBN_VAL)
% finding the best node to start in the next rectangle
open;
open1=[];
I_e1=[];
I_w1=[];
I_n1=[];
I_s1=[];
if ~isempty(open_n1) 
I_n1=[open_n1(:,1)-1, open_n1(:,2)];
end
if ~isempty(open_e1) 
I_e1=[open_e1(:,1), open_e1(:,2)+1];
end
if ~isempty(open_w1)
I_w1=[open_w1(:,1), open_w1(:,2)-1];
end
if ~isempty(open_s1)
I_s1=[open_s1(:,1)+1, open_s1(:,2)];
end

open1=[I_e1; I_w1;I_n1;I_s1];% make the aadaptive
S1=CBN ;%---------------------------------
open1; %--------------------------------
Int=abs(S1-open1);  %  made mistake here
G = 14*min(Int,[],2)+ 10*abs((Int(:,1)-Int(:,2)));
Int=abs(D-open1);   % made mistake here
H = 14*min(Int,[],2)+ 10*abs((Int(:,1)-Int(:,2)));
fVal=G+H;
[fVal_min, fVal_ind]= min(fVal,[],1);
fVal_ind ; %----------------------
CBN1= open1(fVal_ind,:);%-------------------
CBN_VAL=[CBN_VAL;CBN1];%-----------------
%text(open1(:,2)',open1(:,1)',string(fVal));% for placing fval
plot([S1(2),CBN1(2)],[S1(1),CBN1(1)],'blue','LineWidth',2 )
hold on;

