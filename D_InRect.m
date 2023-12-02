function [InRect]=D_InRect(D, rect, CBN1)
if D(2)<=rect(1) && D(2)>=rect(2) && D(1)<=rect(4) && D(1)>=rect(3)
   %disp('DESTINATION REACHED');

   plot([CBN1(2),D(2)],[CBN1(1),D(1)],'blue','LineWidth',2);
   hold on;
   waitfor(msgbox("DESTINATION REACHED ","Congratulations !!!"));
   InRect=1;
else
    InRect=0;
end
