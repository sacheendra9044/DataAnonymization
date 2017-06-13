
% original_ds = Original Data Set without any Anonymization
% orig_data_set = K-Anonymous Data with Occupation
% orig_data_set1 = L-Diverse Data with Occupation
% orig_data_set2 = T-Close Data with Occupation

% ds = Original Data without Occupation
% data_set = K-Anonymous Data without Occupation
% data_set1 = L-Diverse Data without Occupation
% data_set2 = T-Close Data without Occupation



% For K-Anonymous Data
%First Cluster without Occupation
k_clustered = Cluster(data_set);

%Associate Cluster with Occupation
kanon_clustered = [];
for i = 1:5000
    kanon_clustered = cat(1,kanon_clustered,[orig_data_set(i,:),k_clustered(i,9)]);
end

% 7 Clusters Formed


%Find number of Tuples in each Cluster
k_c1 = 0;
k_c2 = 0;
k_c3 = 0;
k_c4 = 0;
k_c5 = 0;
k_c6 = 0;
k_c7 = 0;
for i=1:5000
    if isequal(k_clustered{i,9},1)
        k_c1 = k_c1+1;
        else if isequal(k_clustered{i,9},2)
            k_c2 = k_c2+1;
            else if isequal(k_clustered{i,9},3)
                k_c3 = k_c3+1;
                else if isequal(k_clustered{i,9},4)
                    k_c4 = k_c4+1;
                    else if isequal(k_clustered{i,9},5)
                        k_c5 = k_c5+1;
                        else if isequal(k_clustered{i,9},6)
                            k_c6 = k_c6+1;
                            else if isequal(k_clustered{i,9},7)
                                k_c7 = k_c7+1;
                                end
                            end
                        end
                    end
                end
            end
    end
end


%Occupation in each Cluster
t = 0;
k_Cluster1 = [];
for i=1:5000
    flag = 0;
    if isequal(kanon_clustered{i,10},1)
        occup = kanon_clustered{i,8};
      for j=1:t  
          if isequal(occup,k_Cluster1{j,1})
              flag = 1;
              break;
          end
      end
      if isequal(flag,0)
          k_Cluster1 = cat(1,k_Cluster1,[kanon_clustered(i,8)]);
          t = t+1;
      end
    end
end

t = 0;
k_Cluster2 = [];
for i=1:5000
    flag = 0;
    if isequal(kanon_clustered{i,10},2)
        occup = kanon_clustered{i,8};
      for j=1:t  
          if isequal(occup,k_Cluster2{j,1})
              flag = 1;
              break;
          end
      end
      if isequal(flag,0)
          k_Cluster2 = cat(1,k_Cluster2,[kanon_clustered(i,8)]);
          t = t+1;
      end
    end
end

t = 0;
k_Cluster3 = [];
for i=1:5000
    flag = 0;
    if isequal(kanon_clustered{i,10},3)
        occup = kanon_clustered{i,8};
      for j=1:t  
          if isequal(occup,k_Cluster3{j,1})
              flag = 1;
              break;
          end
      end
      if isequal(flag,0)
          k_Cluster3 = cat(1,k_Cluster3,[kanon_clustered(i,8)]);
          t = t+1;
      end
    end
end

t = 0;
k_Cluster4 = [];
for i=1:5000
    flag = 0;
    if isequal(kanon_clustered{i,10},4)
        occup = kanon_clustered{i,8};
      for j=1:t  
          if isequal(occup,k_Cluster4{j,1})
              flag = 1;
              break;
          end
      end
      if isequal(flag,0)
          k_Cluster4 = cat(1,k_Cluster4,[kanon_clustered(i,8)]);
          t = t+1;
      end
    end
end
              
t = 0;
k_Cluster5 = [];
for i=1:5000
    flag = 0;
    if isequal(kanon_clustered{i,10},5)
        occup = kanon_clustered{i,8};
      for j=1:t  
          if isequal(occup,k_Cluster5{j,1})
              flag = 1;
              break;
          end
      end
      if isequal(flag,0)
          k_Cluster5 = cat(1,k_Cluster5,[kanon_clustered(i,8)]);
          t = t+1;
      end
    end
end

t = 0;
k_Cluster6 = [];
for i=1:5000
    flag = 0;
    if isequal(kanon_clustered{i,10},6)
        occup = kanon_clustered{i,8};
      for j=1:t  
          if isequal(occup,k_Cluster6{j,1})
              flag = 1;
              break;
          end
      end
      if isequal(flag,0)
          k_Cluster6 = cat(1,k_Cluster6,[kanon_clustered(i,8)]);
          t = t+1;
      end
    end
end
   

t = 0;
k_Cluster7 = [];
for i=1:5000
    flag = 0;
    if isequal(kanon_clustered{i,10},7)
        occup = kanon_clustered{i,8};
      for j=1:t  
          if isequal(occup,k_Cluster7{j,1})
              flag = 1;
              break;
          end
      end
      if isequal(flag,0)
          k_Cluster7 = cat(1,k_Cluster7,[kanon_clustered(i,8)]);
          t = t+1;
      end
    end
end


k_Cluster1_data = [];
for i=1:5000
    if isequal(kanon_clustered{i,10},1)
      k_Cluster1_data = cat(1,k_Cluster1_data,[kanon_clustered(i,:)]);
    end
end

k_Cluster2_data = [];
for i=1:5000
    if isequal(kanon_clustered{i,10},2)
        k_Cluster2_data = cat(1,k_Cluster2_data,[kanon_clustered(i,:)]);
    end
end

k_Cluster3_data = [];
for i=1:5000
    if isequal(kanon_clustered{i,10},3)
        k_Cluster3_data = cat(1,k_Cluster3_data,[kanon_clustered(i,:)]);
    end
end

k_Cluster4_data = [];
for i=1:5000
    if isequal(kanon_clustered{i,10},4)
        k_Cluster4_data = cat(1,k_Cluster4_data,[kanon_clustered(i,:)]);
    end
end

k_Cluster5_data = [];
for i=1:5000
    if isequal(kanon_clustered{i,10},5)
        k_Cluster5_data = cat(1,k_Cluster5_data,[kanon_clustered(i,:)]);
    end
end

k_Cluster6_data = [];
for i=1:5000
    if isequal(kanon_clustered{i,10},6)
        k_Cluster6_data = cat(1,k_Cluster6_data,[kanon_clustered(i,:)]);
    end
end

k_Cluster7_data = [];
for i=1:5000
    if isequal(kanon_clustered{i,10},7)
        k_Cluster7_data = cat(1,k_Cluster7_data,[kanon_clustered(i,:)]);
    end
end

for i = 1:size(k_Cluster1,1)
    occ = k_Cluster1{i,1};
    cnt = 0;
    for j=1:size(k_Cluster1_data,1)
        if isequal(occ,k_Cluster1_data{j,8})
            cnt = cnt+1;
        end
    end
    k_Cluster1{i,2} = cnt;
end

for i = 1:size(k_Cluster2,1)
    occ = k_Cluster2{i,1};
    cnt = 0;
    for j=1:size(k_Cluster2_data,1)
        if isequal(occ,k_Cluster2_data{j,8})
            cnt = cnt+1;
        end
    end
    k_Cluster2{i,2} = cnt;
end

for i = 1:size(k_Cluster3,1)
    occ = k_Cluster3{i,1};
    cnt = 0;
    for j=1:size(k_Cluster3_data,1)
        if isequal(occ,k_Cluster3_data{j,8})
            cnt = cnt+1;
        end
    end
    k_Cluster3{i,2} = cnt;
end

for i = 1:size(k_Cluster4,1)
    occ = k_Cluster4{i,1};
    cnt = 0;
    for j=1:size(k_Cluster4_data,1)
        if isequal(occ,k_Cluster4_data{j,8})
            cnt = cnt+1;
        end
    end
    k_Cluster4{i,2} = cnt;
end

for i = 1:size(k_Cluster5,1)
    occ = k_Cluster5{i,1};
    cnt = 0;
    for j=1:size(k_Cluster5_data,1)
        if isequal(occ,k_Cluster5_data{j,8})
            cnt = cnt+1;
        end
    end
    k_Cluster5{i,2} = cnt;
end

for i = 1:size(k_Cluster6,1)
    occ = k_Cluster6{i,1};
    cnt = 0;
    for j=1:size(k_Cluster6_data,1)
        if isequal(occ,k_Cluster6_data{j,8})
            cnt = cnt+1;
        end
    end
    k_Cluster6{i,2} = cnt;
end

for i = 1:size(k_Cluster7,1)
    occ = k_Cluster7{i,1};
    cnt = 0;
    for j=1:size(k_Cluster7_data,1)
        if isequal(occ,k_Cluster7_data{j,8})
            cnt = cnt+1;
        end
    end
    k_Cluster7{i,2} = cnt;
end
