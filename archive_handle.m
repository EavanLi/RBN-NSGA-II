function archive_pop = archive_handle(archive_pop,add_pop,m,n,var,problem,build,eva,k_max,k_min)
% Archive population processing. Resample newly added individuals and update the archive
global cureva
Rate_k = (k_max-k_min)/(eva-build*eva);
b = k_max - Rate_k*eva;
k = round(Rate_k*cureva+b);
%% Resampling for the add_pop
for i = 1:k
    temp = value_objective(add_pop,m,n,var,problem);
    value1(:,i) = temp(:,n+1);
    value2(:,i) = temp(:,n+2);
    if m == 3
        value3(:,i) = temp(:,n+3);
    end
end
value1_mean = mean(value1,2);
value2_mean = mean(value2,2);
value_mean = [value1_mean,value2_mean];
if m == 3
    value3_mean = mean(value3,2);
    value_mean = [value1_mean,value2_mean,value3_mean];
end
add_pop(:,n+1:n+m) = value_mean; 
archive_pop = [archive_pop;add_pop];
end