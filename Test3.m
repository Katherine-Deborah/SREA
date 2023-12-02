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

D=[5,1]; % [11, 8][14,3] [8,4]
S=[14, 4];% [13, 4];

S1=S(2);
S2=S(1);
text(S1,S2,'S');
text(D(2),D(1),'D');
%D=[11,8];
CBN1=S;
X1=X;

% open=[];
% open_e1=[];
% open_w1=[];
% open_n1=[];
% open_s1=[];

% drawing rectangle--------------------------------------------------
for i=1:5
 rect = rect_gen1(X1,CBN1);%-----------------------1
 [InRect]=D_InRect(D, rect, CBN1);
 if InRect==1
     break;
 end
[open,open_e1,open_w1,open_n1,open_s1]= openList(X1,rect);
 if isempty(open)
     display(' D cannot be reached in this path');
     break;
 end
[CBN]= octile_fVal(CBN1,D, open);
[CBN1, open1]=nextRect_CBN(CBN1,D, CBN,open_e1,open_w1, open_s1, open_n1,open);
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
end