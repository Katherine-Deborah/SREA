

clear;
clc;
% pic=imread('arena2.png');
% X=im2bw(pic);
X = importdata('TestImage.txt')
%  X = [0,0,0,0,0,0,0,0,0,0;
%         0,0,0,0,0,0,0,0,0,0;
%         0,0,0,0,0,0,1,0,0,0;
%         0,0,0,0,0,0,1,0,0,0;
%         0,0,0,0,0,0,1,0,0,0;
%         1,1,1,1,1,1,1,0,0,0;
%         0,0,0,0,0,0,0,0,0,0;
%         0,0,0,0,0,0,0,0,0,0;
%         0,0,0,0,0,0,0,0,0,0;
%         0,0,0,0,0,0,0,0,0,0;
%         0,0,1,1,1,1,1,0,0,0;
%         0,1,0,0,0,0,0,0,0,0;
%         0,1,0,0,0,0,0,0,0,0;
%         0,1,0,0,0,0,0,0,0,0];
%  previousOnes = X == 1;
%  X(X == 0) = 1;
%  X(previousOnes) = 0;
   %imshow(X);
[N1, N2]=size(X)

prompt = {'ENTER MESHGRID INTERVAL'};
dlgtitle = 'MESHGRID';
fieldsize = [1 45];
definput = {'1'};
interval=str2num(cell2mat(inputdlg(prompt,dlgtitle,fieldsize,definput)))

imshow(X,'InitialMagnification','fit');
hold on;
%plot(0.5:10.5,meshgrid(0.5:14.5, 1:11), 'black');
plot(0.5:interval:N2+0.5,meshgrid(0.5:interval:N1+0.5, 1:interval:N2+1), '.red');
hold on;
%plot(meshgrid(0.5:10.5, 1:15),0.5:14.5, 'black');
plot(meshgrid(0.5:interval:N2+0.5, 1:interval:N1+1),0.5:interval:N1+0.5, '.red');
hold on;%----------------Dialog-------------

 waitfor(msgbox("Double Click mouse on the point where you want to START","START POINT"));
%pause(2);
[S(2),S(1)] = getpts;
S=round(S)
if (X(S(1),S(2))==0)
    f = msgbox("This point is in prohibited area, re-enter ","INVALID ENTRY","error");
    pause(1);
    delete(f);
    return;
end
text(S(2),S(1),'S');
h=msgbox("START POINT selected");
pause(1);
delete(h);

 waitfor(msgbox("Double Click mouse on the DESTINATION point","DESTINATION POINT"));
%pause(2);
[D(2),D(1)] = getpts;
D=round(D)
if (X(D(1),D(2))==0)
    f = msgbox("This point is in prohibited area, re-enter ","INVALID ENTRY","error");
    pause(1);
    delete(f);
    return;
end
text(D(2),D(1),'D');
h=msgbox("DESTINATION POINT selected");
pause(1);
delete(h);
%[D(2),D(1)] = getpts;
%D=round(D)
% if (X(D(1),D(2))==0)
%     f = msgbox("This point is in prohibited area ","INVALID ENTRY","error");
%     return;
% end
%-------------------------------------

%S=[14,3]; % [13, 8][14,3] [8,4][10,5]
%D=[5, 1]; %[8,4][5, 1]
%-----------------------------------------------
S1=S(2);
S2=S(1);
%text(S1,S2,'S');
%text(D(2),D(1),'D');
%D=[11,8];
CBN1=S
X1=X;
CBN_VAL=[];
CBN_LOC=[];
branchleft=[];
branchleft1=[];
branchleft2=[];
left_CBN=[];
left_M=[];
% drawing rectangle--------------------------------------------------
for i=1:100
 rect = rect_gen1(X1,CBN1)%-----------------------1
 [InRect]=D_InRect(D, rect, CBN1);
 if InRect==1
     break;
 end
CBN_VAL1=CBN_VAL;%
%pause;
[open,open_e1,open_w1,open_n1,open_s1]= openList(X1,rect);
open;
pause;
%display('S');
[A,M]=open_branch(open);
M%----------------------------
%A
if (length(M)>2)
    left_CBN=[left_CBN;CBN1];
    %left_M=[left_M,M1];
end
    
branchleft=[branchleft;A];
%branchleft1%-----------------------
%branchleft2%-----------------------
left_CBN
%left_M
pause;
if isempty(open)
     %display(' D cannot be reached in this path');
     f = msgbox("D cannot be reached in this path ","INVALID PATH");
     pause(1);
     delete(f);
     if isempty(branchleft1)
      
         %display(' D CANNOT BE REACHED ');
         waitfor(msgbox("D CANNOT BE REACHED ","CANNOT REACH DESTINATION"));
         %pause(1);
        
         break;
     else
         CBN1=left_CBN(end,:)
         branchleft1
         branchleft2
         open= branchleft2
         open1= branchleft1
         %CBN2=CBN
         [CBN, CBN_VAL, fVal_ind]= octile_fVal(CBN1,D, open,CBN_VAL);
         CBN
          [CBN1, CBN_VAL, fVal_ind]= octile_fVal(CBN,D, open1,CBN_VAL);
          CBN1
         rect
         rect = rect_gen1(X1,CBN1) 
         [InRect]=D_InRect(D, rect, CBN1);
         if InRect==1
            break;
         end
         
         [open,open_e1,open_w1,open_n1,open_s1]= openList(X1,rect);
         [A,M]=open_branch(open);
         M%----------------------------
         %A
         if (length(M)>2)
             left_CBN=[left_CBN;CBN1];
             %left_M=[left_M,M1];
         end
         branchleft=[branchleft;A];                
     end
     %break;
 end

 pause;
[CBN, CBN_VAL, fVal_ind]= octile_fVal(CBN1,D, open,CBN_VAL);
%[B,M]=open_branch(open1);
%[B, M1 ]=left_branch(B,M,fVal_ind1 );%-------new
CBN_VAL2=CBN_VAL;%
CBN
pause;

[CBN1,fVal_ind1, open1, CBN_VAL]=nextRect_CBN(CBN1,D, CBN,open_e1,open_w1, open_s1, open_n1,open,CBN_VAL);
CBN1
open1;
pause;
[B,M]=open_branch(open1);%--------------
M
fVal_ind1
B;
[B, M1 ]=left_branch(B,M,fVal_ind1 );%-------new
M1
%----------------------------------
[C,Ma]=open_branch(open);%--------------
Ma;
fVal_ind1;
[C, M1a ]=left_branch(C,Ma,fVal_ind1 );%-------new
branchleft2=[branchleft2;C];
M1a;
%-----------------------------------
M1;%--------------------------------------
pause;
left_M=[left_M,M1]
branchleft1=[branchleft1;B];
pause;
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