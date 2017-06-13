counts = zeros(14,1);

extra = [];
extra_original = [];
finalResult = [];

for i = 1:5000
    for j=1:14
        if strmatch(original{i,8},occupations{1,j})
            counts(j,1) = counts(j,1) + 1;
        end
    end
end

f1 = [1;2;3;4;5;6;7;8;9;10;11;12;13;14];
w1 = counts/5000;

t = [];

i = 1;
while i<=5000
    j = i+1;
    while j<=5000
        if isequal(k_anonymous(i,[1 2 3 4 5 6 7 9]),k_anonymous(j,[1 2 3 4 5 6 7 9]))
        else
            break;
        end
        j = j+1;
    end
    counts = zeros(14,1);
    mark = zeros(14,1);
    for k=i:j-1
        for w=1:14
            if strmatch(k_anonymous{k,8},occupations{1,w})
                counts(w,1) = counts(w,1) + 1;
                mark(w,1) = 1;
            end
        end
    end
    f2 = [];
    w2 = [];
    for k = 1:14
        if mark(k,1)==1
            f2 = cat(1,f2,k);
            w2 = cat(1,w2,counts(k,1));
        end
    end
    
    f2;
    total = sum(w2);
    w2 = w2/total;
    
    [ans1 ans2] = emd(f1,f2,w1,w2,@gdf);
    
    ans2 = ans2/13;
    
    t = cat(1,t,ans2);
    
    if ans2>0.2
        for k=i:j-1
            extra = cat(1,extra,k_anonymous(k,:));
        end
    else
        for k=i:j-1
            finalResult = cat(1,finalResult,k_anonymous(k,:));
        end
    end
    
    i = j;
    
end     

% Age further generalization  4 = {1 or 2} = {0-60}

for i = 1:5
    extra{i,1} = 4;
end

for i = 12:17
    extra{i,1} = 4;
end

for i = 1:5
    extra{i,5} = 'Any';
end

for i = 12:17
    extra{i,5} = 'Any';
end

i=1;
ptr = 2;
while i<=31
    j=i+1;
    while j<=31
        if(isequal(extra(i,[1 2 3 4 5 6 7 9]),extra(j,[1 2 3 4 5 6 7 9])))
            temp2 = extra(j,:);
            extra(j,:) = extra(ptr,:);
            extra(ptr,:) = temp2;
            ptr = ptr+1;
        end
        j = j+1;
    end
    i = ptr;
    ptr = ptr+1;
end

for i=22:23
    extra{i,1} = 4;
    extra{i,5} = 'Any';
end

for i=24:27
    extra{i,4} = 'School/UG';
    extra{i,7} = 'Any';
    extra{i,9} = 'Any';
end

% Age further generalized : 5={Any}

for i=20:21
    extra{i,1} = 5;
    extra{i,4} = 'School/Grad';
    extra{i,5} = 'Any';
    extra{i,6} = 'Any';
    extra{i,9} = 'Any';
end

for i=28:31
    extra{i,1} = 5;
    extra{i,4} = 'School/Grad';
    extra{i,5} = 'Any';
    extra{i,6} = 'Any';
    extra{i,9} = 'Any';
end

% Noise added
extra{13,8} = 'Exec-managerial';
extra{19,8} = 'Prof-specialty';

for i = 12:19
    extra{i,1} = 4;
    extra{i,4} = 'School/Grad';
    extra{i,6} = 'Any';
    extra{i,9} = 'Any';
end

i=1;
ptr = 2;
while i<=31
    j=i+1;
    while j<=31
        if(isequal(extra(i,[1 2 3 4 5 6 7 9]),extra(j,[1 2 3 4 5 6 7 9])))
            temp2 = extra(j,:);
            extra(j,:) = extra(ptr,:);
            extra(ptr,:) = temp2;
            ptr = ptr+1;
        end
        j = j+1;
    end
    i = ptr;
    ptr = ptr+1;
end

for i = 1:31
    finalResult = cat(1,finalResult,extra(i,:));
end

t = [];

i = 1;
while i<=5000
    j = i+1;
    while j<=5000
        if isequal(finalResult(i,[1 2 3 4 5 6 7 9]),finalResult(j,[1 2 3 4 5 6 7 9]))
        else
            break;
        end
        j = j+1;
    end
    counts = zeros(14,1);
    mark = zeros(14,1);
    for k=i:j-1
        for w=1:14
            if strmatch(finalResult{k,8},occupations{1,w})
                counts(w,1) = counts(w,1) + 1;
                mark(w,1) = 1;
            end
        end
    end
    f2 = [];
    w2 = [];
    for k = 1:14
        if mark(k,1)==1
            f2 = cat(1,f2,k);
            w2 = cat(1,w2,counts(k,1));
        end
    end
    
    f2;
    total = sum(w2);
    w2 = w2/total;
    
    [ans1 ans2] = emd(f1,f2,w1,w2,@gdf);
    
    ans2 = ans2/13;
    
    t = cat(1,t,ans2);
    
    i = j;
    
end