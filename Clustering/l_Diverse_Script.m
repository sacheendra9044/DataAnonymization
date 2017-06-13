% orig_data_set = K-Anonymous Data with Occupation
% orig_data_set1 = L-Diverse Data with Occupation
% orig_data_set2 = T-Close Data with Occupation


% data_set = K-Anonymous Data without Occupation
% data_set1 = L-Diverse Data without Occupation
% data_set2 = T-Close Data without Occupation



% For K-Anonymous Data
%First Cluster without Occupation
l_clustered = Cluster(data_set1);

%Associate Cluster with Occupation
ldiv_clustered = [];
for i = 1:5000
    ldiv_clustered = cat(1,ldiv_clustered,[orig_data_set1(i,:),l_clustered(i,9)]);
end

% 5 Clusters Formed


%Find number of Tuples in each Cluster
l_c1 = 0;
l_c2 = 0;
l_c3 = 0;
l_c4 = 0;
l_c5 = 0;
for i=1:5000
    if isequal(l_clustered{i,9},1)
        l_c1 = l_c1+1;
        else if isequal(l_clustered{i,9},2)
            l_c2 = l_c2+1;
            else if isequal(l_clustered{i,9},3)
                l_c3 = l_c3+1;
                else if isequal(l_clustered{i,9},4)
                    l_c4 = l_c4+1;
                    else if isequal(l_clustered{i,9},5)
                        l_c5 = l_c5+1;
                        end
                    end
                end
            end
    end
end

%Occupation in each Cluster
t = 0;
l_Cluster1 = [];
for i=1:5000
    flag = 0;
    if isequal(ldiv_clustered{i,10},1)
        occup = ldiv_clustered{i,8};
      for j=1:t  
          if isequal(occup,l_Cluster1{j,1})
              flag = 1;
              break;
          end
      end
      if isequal(flag,0)
          l_Cluster1 = cat(1,l_Cluster1,[ldiv_clustered(i,8)]);
          t = t+1;
      end
    end
end

t = 0;
l_Cluster2 = [];
for i=1:5000
    flag = 0;
    if isequal(ldiv_clustered{i,10},2)
        occup = ldiv_clustered{i,8};
      for j=1:t  
          if isequal(occup,l_Cluster2{j,1})
              flag = 1;
              break;
          end
      end
      if isequal(flag,0)
          l_Cluster2 = cat(1,l_Cluster2,[ldiv_clustered(i,8)]);
          t = t+1;
      end
    end
end

t = 0;
l_Cluster3 = [];
for i=1:5000
    flag = 0;
    if isequal(ldiv_clustered{i,10},3)
        occup = ldiv_clustered{i,8};
      for j=1:t  
          if isequal(occup,l_Cluster3{j,1})
              flag = 1;
              break;
          end
      end
      if isequal(flag,0)
          l_Cluster3 = cat(1,l_Cluster3,[ldiv_clustered(i,8)]);
          t = t+1;
      end
    end
end

t = 0;
l_Cluster4 = [];
for i=1:5000
    flag = 0;
    if isequal(ldiv_clustered{i,10},4)
        occup = ldiv_clustered{i,8};
      for j=1:t  
          if isequal(occup,l_Cluster4{j,1})
              flag = 1;
              break;
          end
      end
      if isequal(flag,0)
          l_Cluster4 = cat(1,l_Cluster4,[ldiv_clustered(i,8)]);
          t = t+1;
      end
    end
end
              
t = 0;
l_Cluster5 = [];
for i=1:5000
    flag = 0;
    if isequal(ldiv_clustered{i,10},5)
        occup = ldiv_clustered{i,8};
      for j=1:t  
          if isequal(occup,l_Cluster5{j,1})
              flag = 1;
              break;
          end
      end
      if isequal(flag,0)
          l_Cluster5 = cat(1,l_Cluster5,[ldiv_clustered(i,8)]);
          t = t+1;
      end
    end
end

l_Cluster1_data = [];
for i=1:5000
    if isequal(ldiv_clustered{i,10},1)
      l_Cluster1_data = cat(1,l_Cluster1_data,[ldiv_clustered(i,:)]);
    end
end

l_Cluster2_data = [];
for i=1:5000
    if isequal(ldiv_clustered{i,10},2)
        l_Cluster2_data = cat(1,l_Cluster2_data,[ldiv_clustered(i,:)]);
    end
end

l_Cluster3_data = [];
for i=1:5000
    if isequal(ldiv_clustered{i,10},3)
      l_Cluster3_data = cat(1,l_Cluster3_data,[ldiv_clustered(i,:)]);
    end
end

l_Cluster4_data = [];
for i=1:5000
    if isequal(ldiv_clustered{i,10},4)
        l_Cluster4_data = cat(1,l_Cluster4_data,[ldiv_clustered(i,:)]);
    end
end

l_Cluster5_data = [];
for i=1:5000
    if isequal(ldiv_clustered{i,10},5)
      l_Cluster5_data = cat(1,l_Cluster5_data,[ldiv_clustered(i,:)]);
    end
end

for i = 1:size(l_Cluster1,1)
    occ = l_Cluster1{i,1};
    cnt = 0;
    for j=1:size(l_Cluster1_data,1)
        if isequal(occ,l_Cluster1_data{j,8})
            cnt = cnt+1;
        end
    end
    l_Cluster1{i,2} = cnt;
end

for i = 1:size(l_Cluster2,1)
    occ = l_Cluster2{i,1};
    cnt = 0;
    for j=1:size(l_Cluster2_data,1)
        if isequal(occ,l_Cluster2_data{j,8})
            cnt = cnt+1;
        end
    end
    l_Cluster2{i,2} = cnt;
end

for i = 1:size(l_Cluster3,1)
    occ = l_Cluster3{i,1};
    cnt = 0;
    for j=1:size(l_Cluster3_data,1)
        if isequal(occ,l_Cluster3_data{j,8})
            cnt = cnt+1;
        end
    end
    l_Cluster3{i,2} = cnt;
end

for i = 1:size(l_Cluster4,1)
    occ = l_Cluster4{i,1};
    cnt = 0;
    for j=1:size(l_Cluster4_data,1)
        if isequal(occ,l_Cluster4_data{j,8})
            cnt = cnt+1;
        end
    end
    l_Cluster4{i,2} = cnt;
end

for i = 1:size(l_Cluster5,1)
    occ = l_Cluster5{i,1};
    cnt = 0;
    for j=1:size(l_Cluster5_data,1)
        if isequal(occ,l_Cluster5_data{j,8})
            cnt = cnt+1;
        end
    end
    l_Cluster5{i,2} = cnt;
end