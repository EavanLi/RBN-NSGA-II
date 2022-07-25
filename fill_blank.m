function add_pop = fill_blank(ns_dc_pop,archive_pop,n)
% Select the top 50% individuals farthest from archive_pop from ns_dc_pop
distance = [];
for i = 1:size(ns_dc_pop,1)
    for j = 1:size(archive_pop,1)
        distance(i,j) = norm(ns_dc_pop(i,1:n)-archive_pop(j,1:n));
    end
end
mindistance = min(distance')';
[~,index] = sort(mindistance);
select_index = index(1:0.5*length(index),:);
add_pop = ns_dc_pop(select_index,:);
end

        
