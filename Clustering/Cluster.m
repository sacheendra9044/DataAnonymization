function y = Cluster(m)
    k = 2;
    [a,b] = kMeansCluster(m,k);
    avgDist = b;
    prev = a;
    a
    b
    while 1,
        k = k+1;
        [a,b] = kMeansCluster(m,k);
        a
        b
        if avgDist-b < 0.01
            y = prev;
            k
            break;
        end
        avgDist = b;
        prev = a;
        if isequal(k,10)
            y = a;
            k
            break;
        end
    end
end

