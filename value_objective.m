function func_val=value_objective(pop,m,n,var,problem)
global cureva
[xsize,~]=size(pop);
switch problem    
case 'F2' 
     for i=1:xsize
        f=[];
        f(1)=pop(i,1)+normrnd(0,var);
        sum=0;
        for j=2:n
        sum=sum+pop(i,j);
        end
        gx=1+sum/(n-1);
        f(2)=gx*(1-f(1)/gx)+normrnd(0,var);
        pop(i,n+1:n+m)=real(f);
    end   
case 'ZDT1' %ZDT1
    for i=1:xsize
        f=[];
        f(1)=pop(i,1)+normrnd(0,var);
        sum=0;
        for j=2:n
        sum=sum+pop(i,j);
        end
        gx=1+9*sum/(n-1);
        f(2)=gx*(1-sqrt(f(1)/gx))+normrnd(0,var);
        pop(i,n+1:n+m)=real(f);
    end
case 'ZDT2' %ZDT2
    for i=1:xsize
        f=[];
        f(1)=pop(i,1)+normrnd(0,var);
        sum=0;
        for j=2:n
            sum=sum+pop(i,j);
        end
        gx=1+9*sum/(n-1);
        f(2)=gx*(1-(f(1)/gx)^2)+normrnd(0,var);
        pop(i,n+1:n+m)=real(f);
    end
case 'ZDT3' %ZDT3
    for i=1:xsize
        f=[];
        f(1)=pop(i,1)+normrnd(0,var);
        sum=0;
        for j=m:n
            sum=sum+pop(i,j);
        end
        gx=1+9*sum/(n-1);
        f(2)=gx*(1-sqrt(f(1)/gx)-(f(1)/gx)*(sin(10*pi*f(1))))+normrnd(0,var);
        pop(i,n+1:n+m)=real(f);
    end
case 'ZDT4' %ZDT4
    for i=1:xsize        
        f=[];
        f(1)=pop(i,1)+normrnd(0,var);
        sum=0;
        for j=2:n
            sum=sum+pop(i,j)^2-10*cos(4*pi*pop(i,j));
        end
        gx=1+10*(n-1)+sum;
        f(2)=gx*(1-sqrt(f(1)/gx))+normrnd(0,var);
        pop(i,n+1:n+m)=real(f);
    end
case 'ZDT6' %ZDT6
    for i=1:xsize 
        f=[];
        f(1) = 1 - exp(-4*pop(i,1))*(sin(6*pi*pop(i,1)))^6+normrnd(0,var);
        sum = 0;
        for j = m : n
            sum = sum + pop(i,j)/(n-1);
        end
        gx = 1 + 9*(sum)^(0.25);
        f(2) = gx*(1 - ((f(1))/(gx))^2)+normrnd(0,var);
        pop(i,n+1:n+m)=real(f);
    end
case 'DTLZ1' %DTLZ1
    for i=1:xsize 
        f = [];
        sum = 0;
        for j = 2:n
            sum = sum+(pop(i,j)-0.5)^2-cos(20*pi*(pop(i,j)-0.5));
        end
        g = 100*(n-1+sum);
        f(1) = 0.5*pop(i,1)*(1+g)+normrnd(0,var);
        f(2) = 0.5*(1-pop(i,1))*(1+g)+normrnd(0,var);
        pop(i,n+1:n+m)=real(f);
    end
case 'DTLZ2' %DTLZ2
    for i=1:xsize 
        f = [];
        sum = 0;
        for j = 2:n
            sum = sum+(pop(i,j)-0.5)^2;
        end
        g = sum;
        f(1) = cos(pop(i,1)*pi/2)*(1+g)+normrnd(0,var);
        f(2) = sin(pop(i,1)*pi/2)*(1+g)+normrnd(0,var);
        pop(i,n+1:n+m)=real(f);
    end
case 'DTLZ3' %DTLZ3
    for i=1:xsize 
        f = [];
        sum = 0;
        for j = 2:n
            sum = sum+(pop(i,j)-0.5)^2-cos(20*pi*(pop(i,j)-0.5));
        end
        g = 100*(n-1+sum);
        f(1) = cos(pop(i,1)*pi/2)*(1+g)+normrnd(0,var);
        f(2) = sin(pop(i,1)*pi/2)*(1+g)+normrnd(0,var);
        pop(i,n+1:n+m)=real(f);
    end
case 'DTLZ4' %DTLZ4
    for i=1:xsize 
        f = [];
        sum = 0;
        for j = 2:n
            sum = sum+(pop(i,j)-0.5)^2;
        end
        g = sum;
        f(1) = cos((pop(i,1)^100)*pi/2)*(1+g)+normrnd(0,var);
        f(2) = sin((pop(i,1)^100)*pi/2)*(1+g)+normrnd(0,var);
        pop(i,n+1:n+m)=real(f);
    end
end
func_val=pop;
cureva = cureva + size(pop,1);
end