function y = Entropy(d)
    distinct_data = [];
    distinct_count = [];
    mark = [];
    for i=1:size(d,1)
        mark(i) = 0;
    end
    t = 0;
    for i=1:size(d,1)
        if isequal(mark(i),0)
            t = t+1;
            distinct_count(t) = 0;
            distinct_data = cat(1,distinct_data,d(i,:));
            for  j=i:size(d,1)
                if isequal(mark(j),0)
                    if isequal(d(i,:),d(j,:))
                        distinct_count(t) = distinct_count(t) + 1;
                        mark(j) = 1;
                    end
                end
            end
        end
    end
    sum = 0;
    for i=1:t
        sum = sum + distinct_count(i);
    end
    distinct_count
    sum
    entr = 0.0;
    for i=1:t
        entr = entr + (distinct_count(i)/sum)*log2(sum/distinct_count(i));
    end
    y = entr;
end