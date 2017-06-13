data = k_data;
first = [];
last = [];
i = 1;
while i<=5000
    cnt = 1;
    j = i+1;
    while j<=5000
        if isequal(data(i,[1 2 3 4 5 6 7 9]),data(j,[1 2 3 4 5 6 7 9]))
            cnt = cnt+1;
            j = j+1;
        else
            break
        end
    end
    first = cat(1,first,i);
    last = cat(1,last,j-1);
    i = j;
end

for i = 1:76
    x = first(i);
    y = last(i);
    flag = 1;
    for j=x:y
        if(strmatch(k_data{j,8},k_data{x,8}))
        else
            flag = 0;
        end
    end
    if flag==1
        x
        y
    end
end
            