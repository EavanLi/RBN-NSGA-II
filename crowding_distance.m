function nsdcpop=crowding_distance(pop,m,n,rank_info)
[xsize,ysize]=size(pop);
index=0;
pop(:,m+n+2)=0;
for i=1:length(rank_info)
    for j=1:m
        [temp index_sort]=sort(pop(index+1:index+rank_info(i),n+j));
        index_sort=index_sort+index;
       for k=1:rank_info(i)
           newpos=find(index_sort==index+k);
           f_max=index_sort(rank_info(i));
           f_min=index_sort(1);
           if (newpos==1 || newpos==rank_info(i)||f_max==f_min)
                pop(index+k,m+n+2)=inf;
           else
               pre_person_index=index_sort(newpos+1);
               next_person_index=index_sort(newpos-1);
               pop(index+k,m+n+2)=pop(index+k,m+n+2)+(pop(pre_person_index,n+j)-pop(next_person_index,n+j))/(pop(f_max,n+j)-pop(f_min,n+j));
           end
       end
    end
    index =index+rank_info(i);
end
nsdcpop=pop;
end