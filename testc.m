clc;
branchleft1 =[1 7;2 7;7 7; 8 7; 9 7;10 7]
cbn_used=[9 7]
M =[1 2 3  6]
fVal_ind = 5
for ind1=1:2:length(M)
    if (M(ind1)<= fVal_ind) && (M(ind1+1)>= fVal_ind)
       branchleft1([M(ind1):M(ind1+1)],:) = [];
    end
end
branchleft1
      
        
        
    