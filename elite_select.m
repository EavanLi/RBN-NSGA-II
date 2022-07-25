function f=elite_select(pop,m,n,popnum)
[xsize,ysize]=size(pop);
[temp,index]=sort(pop(:,m+n+1));
for i=1:xsize
    sorted_chromosome(i,:)=pop(index(i),:);
end
max_rank=max(pop(:,m+n+1));
previous_index=0;
for i=1:max_rank
    current_index=max(find(sorted_chromosome(:,m+n+1)==i));
    if current_index>popnum
        remaining=popnum-previous_index;
        temp_pop=sorted_chromosome(previous_index+1:current_index,:);
        [temp_sort,temp_sort_index]=sort(temp_pop(:,m+n+2),'descend');
        for j=1:remaining
            f(previous_index+j,:)=temp_pop(temp_sort_index(j),:);
        end
        return;
    elseif current_index<popnum
        f(previous_index+1:current_index,:)=sorted_chromosome(previous_index+1:current_index,:);
    else
        f(previous_index+1:current_index,:)=sorted_chromosome(previous_index+1:current_index,:);
        return;
    end
    previous_index=current_index;
end
end