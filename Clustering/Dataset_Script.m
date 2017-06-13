% original_ds = Original Data Set with occupation (without any Anonymization)
% orig_data_set = K-Anonymous Data with Occupation
% orig_data_set1 = L-Diverse Data with Occupation
% orig_data_set2 = T-Close Data with Occupation

% ds = Original Data without Occupation
% data_set = K-Anonymous Data without Occupation
% data_set1 = L-Diverse Data without Occupation
% data_set2 = T-Close Data without Occupation



% For DataSet
%First Cluster without Occupation
ds_clustered = Cluster(ds);

%Associate Cluster with Occupation
dataset_clustered = [];
for i = 1:5000
    dataset_clustered = cat(1,dataset_clustered,[original_ds(i,:),ds_clustered(i,9)]);
end

% 6 Clusters Formed


%Find number of Tuples in each Cluster
ds_c1 = 0;
ds_c2 = 0;
ds_c3 = 0;
ds_c4 = 0;
ds_c5 = 0;
ds_c6 = 0;
for i=1:5000
    if isequal(ds_clustered{i,9},1)
        ds_c1 = ds_c1+1;
        else if isequal(ds_clustered{i,9},2)
            ds_c2 = ds_c2+1;
            else if isequal(ds_clustered{i,9},3)
                ds_c3 = ds_c3+1;
                else if isequal(ds_clustered{i,9},4)
                    ds_c4 = ds_c4+1;
                    else if isequal(ds_clustered{i,9},5)
                        ds_c5 = ds_c5+1;
                        else if isequal(ds_clustered{i,9},6)
                            ds_c6 = ds_c6+1;
                            end
                        end
                    end
                end
            end
    end
end


%Occupation in each Cluster
t = 0;
ds_Cluster1 = [];
for i=1:5000
    flag = 0;
    if isequal(dataset_clustered{i,10},1)
        occup = dataset_clustered{i,8};
      for j=1:t  
          if isequal(occup,ds_Cluster1{j,1})
              flag = 1;
              break;
          end
      end
      if isequal(flag,0)
          ds_Cluster1 = cat(1,ds_Cluster1,[dataset_clustered(i,8)]);
          t = t+1;
      end
    end
end

t = 0;
ds_Cluster2 = [];
for i=1:5000
    flag = 0;
    if isequal(dataset_clustered{i,10},2)
        occup = dataset_clustered{i,8};
      for j=1:t  
          if isequal(occup,ds_Cluster2{j,1})
              flag = 1;
              break;
          end
      end
      if isequal(flag,0)
          ds_Cluster2 = cat(1,ds_Cluster2,[dataset_clustered(i,8)]);
          t = t+1;
      end
    end
end

t = 0;
ds_Cluster3 = [];
for i=1:5000
    flag = 0;
    if isequal(dataset_clustered{i,10},3)
        occup = dataset_clustered{i,8};
      for j=1:t  
          if isequal(occup,ds_Cluster3{j,1})
              flag = 1;
              break;
          end
      end
      if isequal(flag,0)
          ds_Cluster3 = cat(1,ds_Cluster3,[dataset_clustered(i,8)]);
          t = t+1;
      end
    end
end

t = 0;
ds_Cluster4 = [];
for i=1:5000
    flag = 0;
    if isequal(dataset_clustered{i,10},4)
        occup = dataset_clustered{i,8};
      for j=1:t  
          if isequal(occup,ds_Cluster4{j,1})
              flag = 1;
              break;
          end
      end
      if isequal(flag,0)
          ds_Cluster4 = cat(1,ds_Cluster4,[dataset_clustered(i,8)]);
          t = t+1;
      end
    end
end
              
t = 0;
ds_Cluster5 = [];
for i=1:5000
    flag = 0;
    if isequal(dataset_clustered{i,10},5)
        occup = dataset_clustered{i,8};
      for j=1:t  
          if isequal(occup,ds_Cluster5{j,1})
              flag = 1;
              break;
          end
      end
      if isequal(flag,0)
          ds_Cluster5 = cat(1,ds_Cluster5,[dataset_clustered(i,8)]);
          t = t+1;
      end
    end
end

t = 0;
ds_Cluster6 = [];
for i=1:5000
    flag = 0;
    if isequal(dataset_clustered{i,10},6)
        occup = dataset_clustered{i,8};
      for j=1:t  
          if isequal(occup,ds_Cluster6{j,1})
              flag = 1;
              break;
          end
      end
      if isequal(flag,0)
          ds_Cluster6 = cat(1,ds_Cluster6,[dataset_clustered(i,8)]);
          t = t+1;
      end
    end
end
   


ds_Cluster1_data = [];
for i=1:5000
    if isequal(dataset_clustered{i,10},1)
      ds_Cluster1_data = cat(1,ds_Cluster1_data,[dataset_clustered(i,:)]);
    end
end

ds_Cluster2_data = [];
for i=1:5000
    if isequal(dataset_clustered{i,10},2)
      ds_Cluster2_data = cat(1,ds_Cluster2_data,[dataset_clustered(i,:)]);
    end
end

ds_Cluster3_data = [];
for i=1:5000
    if isequal(dataset_clustered{i,10},3)
      ds_Cluster3_data = cat(1,ds_Cluster3_data,[dataset_clustered(i,:)]);
    end
end

ds_Cluster4_data = [];
for i=1:5000
    if isequal(dataset_clustered{i,10},4)
      ds_Cluster4_data = cat(1,ds_Cluster4_data,[dataset_clustered(i,:)]);
    end
end

ds_Cluster5_data = [];
for i=1:5000
    if isequal(dataset_clustered{i,10},5)
      ds_Cluster5_data = cat(1,ds_Cluster5_data,[dataset_clustered(i,:)]);
    end
end

ds_Cluster6_data = [];
for i=1:5000
    if isequal(dataset_clustered{i,10},6)
      ds_Cluster6_data = cat(1,ds_Cluster6_data,[dataset_clustered(i,:)]);
    end
end

for i = 1:size(ds_Cluster1,1)
    occ = ds_Cluster1{i,1};
    cnt = 0;
    for j=1:size(ds_Cluster1_data,1)
        if isequal(occ,ds_Cluster1_data{j,8})
            cnt = cnt+1;
        end
    end
    ds_Cluster1{i,2} = cnt;
end


for i = 1:size(ds_Cluster2,1)
    occ = ds_Cluster2{i,1};
    cnt = 0;
    for j=1:size(ds_Cluster2_data,1)
        if isequal(occ,ds_Cluster2_data{j,8})
            cnt = cnt+1;
        end
    end
    ds_Cluster2{i,2} = cnt;
end

for i = 1:size(ds_Cluster3,1)
    occ = ds_Cluster3{i,1};
    cnt = 0;
    for j=1:size(ds_Cluster3_data,1)
        if isequal(occ,ds_Cluster3_data{j,8})
            cnt = cnt+1;
        end
    end
    ds_Cluster3{i,2} = cnt;
end

for i = 1:size(ds_Cluster4,1)
    occ = ds_Cluster4{i,1};
    cnt = 0;
    for j=1:size(ds_Cluster4_data,1)
        if isequal(occ,ds_Cluster4_data{j,8})
            cnt = cnt+1;
        end
    end
    ds_Cluster4{i,2} = cnt;
end

for i = 1:size(ds_Cluster5,1)
    occ = ds_Cluster5{i,1};
    cnt = 0;
    for j=1:size(ds_Cluster5_data,1)
        if isequal(occ,ds_Cluster5_data{j,8})
            cnt = cnt+1;
        end
    end
    ds_Cluster5{i,2} = cnt;
end

for i = 1:size(ds_Cluster6,1)
    occ = ds_Cluster6{i,1};
    cnt = 0;
    for j=1:size(ds_Cluster6_data,1)
        if isequal(occ,ds_Cluster6_data{j,8})
            cnt = cnt+1;
        end
    end
    ds_Cluster6{i,2} = cnt;
end

