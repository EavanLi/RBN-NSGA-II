%if_update:bool type
function if_update = update_judge(pop,m,n,var,problem,PV,eva,build)
global GRNN
global cureva
if_update = logical(0);
if (build*eva-150) < cureva && cureva < (build*eva+150)
    if_update = logical(1);
elseif ~isempty(GRNN)
    temp = randperm(size(pop,1));
    index = temp(1);
    for i = 1:10
        temp = value_objective(pop(index,:),m,n,var,problem);
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
    GRNN_value = pop(index,n+1:n+m); 
    if pdist2(value_mean, GRNN_value) > PV
        if_update = logical(1); 
    end
end

end
