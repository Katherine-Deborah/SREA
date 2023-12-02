

clear;
clc;
X = [0,0,0,0,0,0,0,0,0,0;
       0,0,0,0,0,0,0,0,0,0;
       0,0,0,0,0,0,1,0,0,0;
       0,0,0,0,0,0,1,0,0,0;
       0,0,0,0,0,0,1,0,0,0;
       1,1,1,1,1,1,1,0,0,0;
       0,0,0,0,0,0,0,0,0,0;
       0,0,0,0,0,0,0,0,0,0;
       0,0,0,0,0,0,0,0,0,0;
       0,0,0,0,0,0,0,0,0,0;
       0,0,1,1,1,1,1,0,0,0;
       0,1,0,0,0,0,0,0,0,0;
       0,1,0,0,0,0,0,0,0,0;
       0,1,0,0,0,0,0,0,0,0];
previousOnes = X == 1;
X(X == 0) = 1;
X(previousOnes) = 0;
   %imshow(X);
imshow(X,'InitialMagnification','fit');
hold on;
plot(0.5:10.5,meshgrid(0.5:14.5, 1:11), 'black');
hold on;
plot(meshgrid(0.5:10.5, 1:15),0.5:14.5, 'black');
hold on;
%%----- 
[N1, N2]=size(X);

S=[14,3]; % [13, 8][14,3] [8,4][10,5]
D=[5, 1]; %[8,4][5, 1]


S1=S(2);
S2=S(1);
text(S1,S2,'S');
text(D(2),D(1),'D');
%D=[11,8];
CBN1=S;
X1=X;
CBN_VAL=[];
CBN_LOC=[];

% drawing rectangle--------------------------------------------------
for i=1:10
 rect = rect_gen1(X1,CBN1)%-----------------------1
 [InRect]=D_InRect(D, rect, CBN1)
 if InRect==1
     break;
 end
CBN_VAL1=CBN_VAL;
[open,open_e1,open_w1,open_n1,open_s1]= openList(X1,rect)
 if isempty(open)
     display(' D cannot be reached in this path');
     break;
 end
 pause;
 

[CBN, CBN_VAL]= octile_fVal(CBN1,D, open,CBN_VAL);
CBN_VAL2=CBN_VAL;
pause;

[CBN1, open1, CBN_VAL]=nextRect_CBN(CBN1,D, CBN,open_e1,open_w1, open_s1, open_n1,open,CBN_VAL);
%X1=X;
if ~isempty(open_e1) 
    X1(open_e1(:,1) ,open_e1(1,2))=0;
end
if ~isempty(open_w1)
    X1(open_w1(:,1) ,open_w1(1,2))=0;% correct
end
if ~isempty(open_n1)
    X1(open_n1(1,1) ,open_n1(:,2))=0;% correct
end
if ~isempty(open_s1)
    X1(open_s1(1,1) ,open_s1(:,2))=0;
end
%figure(2);
%imshow(X1,'InitialMagnification','fit');
CBN_VAL3=CBN_VAL;
pause ;
end