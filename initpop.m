function ns_dc_pop = initpop(popnum, m, n, xmax, xmin, var, problem)
initpop=[];
for j=1:n
    for i=1:popnum
        initpop(i,j)=rand*(xmax(j)-xmin(j))+xmin(j);
    end
end
init_value_pop=value_objective(initpop,m,n,var,problem);
initpop1=[];
for j=1:n
    for i=1:popnum
        initpop1(i,j)=xmin(j)+xmax(j)-initpop(i,j);
    end
end
init_value_pop1=value_objective(initpop1,m,n,var,problem);
combinepop(1:popnum,:)=init_value_pop;
[xsize ysize]=size(init_value_pop1);
combinepop(popnum+1:popnum+xsize,:)=init_value_pop1;
[non_dominant_sortpop, rankinfo]=non_dominant_sort(combinepop,m,n);
nsdcpop=crowding_distance(non_dominant_sortpop,m,n,rankinfo);
ns_dc_pop=elite_select(nsdcpop,m,n,popnum);
end




