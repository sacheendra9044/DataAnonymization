%Utility Measure

%Calculating Maximum no of distinct Values for each Attribute
%1st for Original Data Set
H_xy_orig = Entropy(original_ds); %H(X,Y)
H_orig = zeros(1,size(original_ds,2));
distinct_orig = [];
for i=1:size(original_ds,2)
    X = [];
    map = containers.Map;
    for j=1:size(original_ds,1)
        val = original_ds{j,i};
        if isnumeric(val)
            val = num2str(val);
        end
        if isKey(map,val)
            map(val) = map(val)+1;
        else
            map(val) = 1;
        end
        X = cat(1,X,original_ds(j,[1:i-1 i+1:size(original_ds,2)]));
    end
    distinct_orig(i) = length(map);
    H_orig(i) = H_xy_orig - Entropy(X);
end

Hmax_orig = [];
for i=1:size(distinct_orig,2)
    Hmax_orig(i) = log2(distinct_orig(i));
end

U_orig = zeros(1,size(original_ds,2));
for i=1:size(original_ds,2)
    U_orig(i) = Hmax_orig(i) - H_orig(i);
end

utility_orig = 0;
for i = 1:size(original_ds,2)
    utility_orig = utility_orig + (1/size(original_ds,2))*U_orig(i);
end

%2nd for K-Anonymous Data Set
H_xy_k = Entropy(orig_data_set); %H(X,Y)
H_k = zeros(1,size(orig_data_set,2));
distinct_k = [];
for i=1:size(orig_data_set,2)
    X = [];
    map = containers.Map;
    for j=1:size(orig_data_set,1)
        val = orig_data_set{j,i};
        if isnumeric(val)
            val = num2str(val);
        end
        if isKey(map,val)
            map(val) = map(val)+1;
        else
            map(val) = 1;
        end
        X = cat(1,X,orig_data_set(j,[1:i-1 i+1:size(orig_data_set,2)]));
    end
    distinct_k(i) = length(map);
    H_k(i) = H_xy_k - Entropy(X);
end

Hmax_k = [];
for i=1:size(distinct_k,2)
    Hmax_k(i) = log2(distinct_k(i));
end

U_k = zeros(1,size(orig_data_set,2));
for i=1:size(orig_data_set,2)
    U_k(i) = Hmax_k(i) - H_k(i);
end

utility_k = 0;
for i = 1:size(orig_data_set,2)
    utility_k = utility_k + (1/size(orig_data_set,2))*U_k(i);
end

%3rd for L Diverse Data Set
H_xy_l = Entropy(orig_data_set1); %H(X,Y)
H_l = zeros(1,size(orig_data_set1,2));
distinct_l = [];
for i=1:size(orig_data_set1,2)
    X = [];
    map = containers.Map;
    for j=1:size(orig_data_set1,1)
        val = orig_data_set1{j,i};
        if isnumeric(val)
            val = num2str(val);
        end
        if isKey(map,val)
            map(val) = map(val)+1;
        else
            map(val) = 1;
        end
        X = cat(1,X,orig_data_set1(j,[1:i-1 i+1:size(orig_data_set1,2)]));
    end
    distinct_l(i) = length(map);
    H_l(i) = H_xy_l - Entropy(X);
end

Hmax_l = [];
for i=1:size(distinct_l,2)
    Hmax_l(i) = log2(distinct_l(i));
end

U_l = zeros(1,size(orig_data_set1,2));
for i=1:size(orig_data_set1,2)
    U_l(i) = Hmax_l(i) - H_l(i);
end

utility_l = 0;
for i = 1:size(orig_data_set1,2)
    utility_l = utility_l + (1/size(orig_data_set1,2))*U_l(i);
end


%4th for T Close Data Set
%Utility Measure

%Calculating Maximum no of distinct Values for each Attribute
%1st for Original Data Set
H_xy_t = Entropy(orig_data_set2); %H(X,Y)
H_t = zeros(1,size(orig_data_set2,2));
distinct_t = [];
for i=1:size(orig_data_set2,2)
    X = [];
    map = containers.Map;
    for j=1:size(orig_data_set2,1)
        val = orig_data_set2{j,i};
        if isnumeric(val)
            val = num2str(val);
        end
        if isKey(map,val)
            map(val) = map(val)+1;
        else
            map(val) = 1;
        end
        X = cat(1,X,orig_data_set2(j,[1:i-1 i+1:size(orig_data_set2,2)]));
    end
    distinct_t(i) = length(map);
    H_t(i) = H_xy_t - Entropy(X);
end

Hmax_t = [];
for i=1:size(distinct_t,2)
    Hmax_t(i) = log2(distinct_t(i));
end

U_t = zeros(1,size(orig_data_set2,2));
for i=1:size(orig_data_set2,2)
    U_t(i) = Hmax_t(i) - H_t(i);
end

utility_t = 0;
for i = 1:size(orig_data_set2,2)
    utility_t = utility_t + (1/size(orig_data_set2,2))*U_t(i);
end

%5th for trivially-sanitized dataset, all quasi-identifiers are suppressed.
trivial_data_set = original_ds;

for i=1:9
    if isequal(i,8)
    else
        for j=1:size(original_ds,1)
            trivial_data_set{j,i} = '***';
        end
    end
end

H_xy_trivial = Entropy(trivial_data_set); %H(X,Y)
H_trivial = zeros(1,size(trivial_data_set,2));
distinct_trivial = [];
for i=1:size(trivial_data_set,2)
    X = [];
    map = containers.Map;
    for j=1:size(trivial_data_set,1)
        val = trivial_data_set{j,i};
        if isnumeric(val)
            val = num2str(val);
        end
        if isKey(map,val)
            map(val) = map(val)+1;
        else
            map(val) = 1;
        end
        X = cat(1,X,trivial_data_set(j,[1:i-1 i+1:size(trivial_data_set,2)]));
    end
    distinct_trivial(i) = length(map);
    H_trivial(i) = H_xy_trivial - Entropy(X);
end

Hmax_trivial = [];
for i=1:size(distinct_trivial,2)
    Hmax_trivial(i) = log2(distinct_trivial(i));
end

U_trivial = zeros(1,size(trivial_data_set,2));
for i=1:size(trivial_data_set,2)
    U_trivial(i) = Hmax_trivial(i) - H_trivial(i);
end

utility_trivial = 0;
for i = 1:size(trivial_data_set,2)
    utility_trivial = utility_trivial + (1/size(trivial_data_set,2))*U_trivial(i);
end
