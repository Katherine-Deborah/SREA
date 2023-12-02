function [rect]= rect_gen1( X, S)
[N1, N2]=size(X);
S1=S(2);
S2=S(1);
% Finding and mapping the rectangle 
for n=(S2-1):-1:0
    if n<1
        north=n+1;
        n=n+1;
        break;
    end
    if X(n,S1)==0
        north=n+1;
        break;
    end
end
for s=S2:1:N1+1
    if s > N1        
        south = N1;
        s=s-1;
        break;
    end
    if X(s,S1)==0
        south = s-1;
        break;
    end
end
%n
%s
for w=S1:-1:1
    if w==1
        west=w;
        break;
    end
    for ns= n+1:s-1
        %ns
        %w
        if X(ns,w)==0
            %w
            %ns
            west=w+1;
        break;   
        end
    end
    if X(ns,w)==0
        break;
    end
    
end
for e=S1:1:N2+1
    if e > N2        
        east = N2;
        break;
    end
    for ns= n+1:s-1
      if X(ns,e)==0
         east=e-1;
      break;
      end
    end
    if X(ns,e)==0
        break;
    end
end

rect= [ east, west, north, south];    
plot( [rect(2)-0.5:rect(1)+0.5]', meshgrid([rect(3)-0.5,rect(4)+0.5],1:rect(1)-rect(2)+2), 'red','LineWidth',2);
hold on;
plot( meshgrid([rect(2)-0.5,rect(1)+0.5],1:rect(4)-rect(3)+2), [rect(3)-0.5:rect(4)+0.5]', 'red','LineWidth',2);
hold on;
