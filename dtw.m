function [Dist,D,k,w]=dtw(t,r)
%Dynamic Time Warping Algorithm
%Dist is unnormalized distance between t and r
%D is the accumulated distance matrix
%k is the normalizing factor
%w is the optimal path
%t is the vector you are testing against
%r is the vector you are testing
[t_rows,N]=size(t);
[r_rows,M]=size(r);
for n=1:t_rows
   for m=1:r_rows
       d(n,m)=sum((t(n,:)-r(m,:)).^2);
   end
end
% d=(repmat(t(:),1,M)-repmat(r(:)',N,1)).^2; %this replaces the nested for loops from above Thanks Georg Schmitz 

D=zeros(size(d));
D(1,1)=d(1,1);

for n=2:t_rows
    D(n,1)=d(n,1)+D(n-1,1);
end
for m=2:r_rows
    D(1,m)=d(1,m)+D(1,m-1);
end
for n=2:t_rows
    for m=2:r_rows
        D(n,m)=d(n,m)+min([D(n-1,m),D(n-1,m-1),D(n,m-1)]);
    end
end

Dist=D(t_rows,r_rows);

