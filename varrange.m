function [xmin, xmax] = varrange(problem, n)
switch problem
    case 'F2'
        xmin = 0*ones(1,n);                           
        xmax = 1*ones(1,n);
    case 'ZDT1'
        xmin = 0*ones(1,n);                           
        xmax = 1*ones(1,n);
    case 'ZDT2'
        xmin = 0*ones(1,n);                           
        xmax = 1*ones(1,n);
    case 'ZDT3'
        xmin = 0*ones(1,n);                           
        xmax = 1*ones(1,n);
    case 'ZDT4'
        xmin = [0,-5*ones(1,n-1)]; 
        xmax = [1,5*ones(1,n-1)]; 
    case 'ZDT6'
        xmin = 0*ones(1,n);                           
        xmax = 1*ones(1,n);
    case 'DTLZ1'
        xmin = 0*ones(1,n);                           
        xmax = 1*ones(1,n);
    case 'DTLZ2'
        xmin = 0*ones(1,n);                           
        xmax = 1*ones(1,n);
    case 'DTLZ3'
        xmin = 0*ones(1,n);                           
        xmax = 1*ones(1,n);
    case 'DTLZ4'
        xmin = 0*ones(1,n);                           
        xmax = 1*ones(1,n);
end
end