function selpop=tournament_select(pop,popnum,toursize,m,n)
[xsize,~]=size(pop);
selpop=[];
for i=1:popnum
     p=randperm(xsize);
     sel(1:toursize)=p(1:toursize);
     tourpop=pop(sel,:);
     minindex=find(tourpop(:,m+n+1)==min(tourpop(:,m+n+1)));
     if length(minindex)==1 
         selpop(i,:)=tourpop(minindex,:);
     else
         maxindex=find(tourpop(:,m+n+2)==max(tourpop(:,m+n+2)));
         if length(maxindex~=1)
             selpop(i,:)=tourpop(maxindex(1),:);
         else
             selpop(i,:)=tourpop(maxindex,:);
         end
     end
end
end