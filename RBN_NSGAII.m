% The implementation of RBN-NSGA-II
%% Input the parameters
var = input('The variance of the noise£º');
problem = input('Problem£º'); % e.g.: 'ZDT1', 'ZDT2'
k_min = input('The minimum value of resampling£º');
k_max = input('The maximum value of resampling£º');
build = input('Creating the GRNN£º'); % e.g.: 0.3
popnum = input('The size of the population£º'); % e.g.: 100
m = input('The number of the objectives£º'); % e.g.: 2
n = input('The number of the independent variables£º'); % e.g.: 30
eva = input('The total number of evaluations£º'); % e.g.: 50000
PV = input('Whether to update the GRNN£º'); % e.g.: 0.3
spread = input('The spread of the GRNN£º'); % e.g.: 0.2

[xmin, xmax] = varrange(problem, n);          
global cureva 
cureva = 0;                                   
global GRNN
GRNN = [];
global errorNN                                
errorNN = [];
global errorRe                                
errorRe = [];
global error_noise                           
error_noise = [];
archive_pop = [];                             
GRNN_updatenum = 0;                           
%% Initialize population
ns_dc_pop = initpop(popnum,m,n,xmax,xmin,var,problem);
core = [];
core = mean(ns_dc_pop(:,n+1:n+m));
%% main loop
while cureva < eva
    if_update = update_judge(ns_dc_pop,m,n,var,problem,PV,eva,build);
    if if_update
        GRNN_updatenum = GRNN_updatenum+1;
        if isempty(GRNN)
            add_pop = ns_dc_pop;
        else
            add_pop = fill_blank(ns_dc_pop,archive_pop,n);
        end
        archive_pop = archive_handle(archive_pop,add_pop,m,n,var,problem,build,eva,k_max,k_min);
        GRNN = newgrnn(archive_pop(:,1:n)',archive_pop(:,n+1:n+m)',spread);
        GRNN_output = sim(GRNN, ns_dc_pop(:,1:n)')';
        ns_dc_pop(:,n+1:n+m) = GRNN_output;
    end 
    poolsize=round(popnum); 
    toursize=2;
    select_pop=tournament_select(ns_dc_pop,poolsize,toursize,m,n);
    hc=20;
    hm=20;
    offspring=reproduction(select_pop,m,n,hc,hm,xmax,xmin,var,problem);
    combine_pop(1:popnum,1:m+n+2)=ns_dc_pop;
    [xsize ysize]=size(offspring);
    combine_pop(popnum+1:popnum+xsize,1:m+n+2)=offspring;
    [gen_non_dominant_pop,rankinfo]=non_dominant_sort(combine_pop,m,n);
    nsdc_pop=crowding_distance(gen_non_dominant_pop,m,n,rankinfo);
    ns_dc_pop=elite_select(nsdc_pop,m,n,popnum);
    pop = ns_dc_pop(:,n+1:n+m);
    plot(pop(:,1),pop(:,2),'r*')
    xlabel('f1');
    ylabel('f2');
    grid on;
    pause(0.03)  
    core = [core;mean(ns_dc_pop(:,n+1:n+m))];
end
%% Stable Stage
for i = 1:100
    poolsize=round(popnum);
    toursize=2;
    select_pop=tournament_select(ns_dc_pop,poolsize,toursize,m,n);
    hc=20;                                    
    hm=20;
    offspring=reproduction(select_pop,m,n,hc,hm,xmax,xmin,var,problem);
    combine_pop(1:popnum,1:m+n+2)=ns_dc_pop;
    [xsize ysize]=size(offspring);
    combine_pop(popnum+1:popnum+xsize,1:m+n+2)=offspring;
    [gen_non_dominant_pop,rankinfo]=non_dominant_sort(combine_pop,m,n);
    nsdc_pop=crowding_distance(gen_non_dominant_pop,m,n,rankinfo);
    ns_dc_pop=elite_select(nsdc_pop,m,n,popnum);
    pop = ns_dc_pop(:,n+1:n+m);
    plot(pop(:,1),pop(:,2),'r*')
    xlabel('f1');
    ylabel('f2');
    grid on;
    text(0.3,1,0,['Stable Stage: ',int2str(i),' generation']);
    pause(0.1)
    core = [core;mean(ns_dc_pop(:,n+1:n+m))];
end
