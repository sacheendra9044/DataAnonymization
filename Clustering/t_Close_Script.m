% orig_data_set = K-Anonymous Data with Occupation
% orig_data_set1 = L-Diverse Data with Occupation
% orig_data_set2 = T-Close Data with Occupation


% data_set = K-Anonymous Data without Occupation
% data_set1 = L-Diverse Data without Occupation
% data_set2 = T-Close Data without Occupation



% For K-Anonymous Data
%First Cluster without Occupation
t_clustered = Cluster(data_set2);

%Associate Cluster with Occupation
tclose_clustered = [];
for i = 1:5000
    tclose_clustered = cat(1,tclose_clustered,[orig_data_set2(i,:),t_clustered(i,9)]);
end



% 6 Clusters Formed


%Find number of Tuples in each Cluster
t_c1 = 0;
t_c2 = 0;
t_c3 = 0;
t_c4 = 0;
t_c5 = 0;
t_c6 = 0;
for i=1:5000
    if isequal(t_clustered{i,9},1)
        t_c1 = t_c1+1;
        else if isequal(t_clustered{i,9},2)
            t_c2 = t_c2+1;
            else if isequal(t_clustered{i,9},3)
                t_c3 = t_c3+1;
                else if isequal(t_clustered{i,9},4)
                    t_c4 = t_c4+1;
                    else if isequal(t_clustered{i,9},5)
                        t_c5 = t_c5+1;
                        else if isequal(t_clustered{i,9},6)
                                t_c6 = t_c6+1;
                            end
                        end
                    end
                end
            end
    end
end

%Occupation in each Cluster
t = 0;
t_Cluster1 = [];
for i=1:5000
    flag = 0;
    if isequal(tclose_clustered{i,10},1)
        occup = tclose_clustered{i,8};
      for j=1:t  
          if isequal(occup,t_Cluster1{j,1})
              flag = 1;
              break;
          end
      end
      if isequal(flag,0)
          t_Cluster1 = cat(1,t_Cluster1,[tclose_clustered(i,8)]);
          t = t+1;
      end
    end
end

t = 0;
t_Cluster2 = [];
for i=1:5000
    flag = 0;
    if isequal(tclose_clustered{i,10},2)
        occup = tclose_clustered{i,8};
      for j=1:t  
          if isequal(occup,t_Cluster2{j,1})
              flag = 1;
              break;
          end
      end
      if isequal(flag,0)
          t_Cluster2 = cat(1,t_Cluster2,[tclose_clustered(i,8)]);
          t = t+1;
      end
    end
end

t = 0;
t_Cluster3 = [];
for i=1:5000
    flag = 0;
    if isequal(tclose_clustered{i,10},3)
        occup = tclose_clustered{i,8};
      for j=1:t  
          if isequal(occup,t_Cluster3{j,1})
              flag = 1;
              break;
          end
      end
      if isequal(flag,0)
          t_Cluster3 = cat(1,t_Cluster3,[tclose_clustered(i,8)]);
          t = t+1;
      end
    end
end

t = 0;
t_Cluster4 = [];
for i=1:5000
    flag = 0;
    if isequal(tclose_clustered{i,10},4)
        occup = tclose_clustered{i,8};
      for j=1:t  
          if isequal(occup,t_Cluster4{j,1})
              flag = 1;
              break;
          end
      end
      if isequal(flag,0)
          t_Cluster4 = cat(1,t_Cluster4,[tclose_clustered(i,8)]);
          t = t+1;
      end
    end
end
              
t = 0;
t_Cluster5 = [];
for i=1:5000
    flag = 0;
    if isequal(tclose_clustered{i,10},5)
        occup = tclose_clustered{i,8};
      for j=1:t  
          if isequal(occup,t_Cluster5{j,1})
              flag = 1;
              break;
          end
      end
      if isequal(flag,0)
          t_Cluster5 = cat(1,t_Cluster5,[tclose_clustered(i,8)]);
          t = t+1;
      end
    end
end

t = 0;
t_Cluster6 = [];
for i=1:5000
    flag = 0;
    if isequal(tclose_clustered{i,10},6)
        occup = tclose_clustered{i,8};
      for j=1:t  
          if isequal(occup,t_Cluster6{j,1})
              flag = 1;
              break;
          end
      end
      if isequal(flag,0)
          t_Cluster6 = cat(1,t_Cluster6,[tclose_clustered(i,8)]);
          t = t+1;
      end
    end
end

t_Cluster1_data = [];
for i=1:5000
    if isequal(tclose_clustered{i,10},1)
      t_Cluster1_data = cat(1,t_Cluster1_data,[tclose_clustered(i,:)]);
    end
end

t_Cluster2_data = [];
for i=1:5000
    if isequal(tclose_clustered{i,10},2)
        t_Cluster2_data = cat(1,t_Cluster2_data,[tclose_clustered(i,:)]);
    end
end

t_Cluster3_data = [];
for i=1:5000
    if isequal(tclose_clustered{i,10},3)
      t_Cluster3_data = cat(1,t_Cluster3_data,[tclose_clustered(i,:)]);
    end
end

t_Cluster4_data = [];
for i=1:5000
    if isequal(tclose_clustered{i,10},4)
        t_Cluster4_data = cat(1,t_Cluster4_data,[tclose_clustered(i,:)]);
    end
end

t_Cluster5_data = [];
for i=1:5000
    if isequal(tclose_clustered{i,10},5)
      t_Cluster5_data = cat(1,t_Cluster5_data,[tclose_clustered(i,:)]);
    end
end

t_Cluster6_data = [];
for i=1:5000
    if isequal(tclose_clustered{i,10},6)
      t_Cluster6_data = cat(1,t_Cluster6_data,[tclose_clustered(i,:)]);
    end
end

for i = 1:size(t_Cluster1,1)
    occ = t_Cluster1{i,1};
    cnt = 0;
    for j=1:size(t_Cluster1_data,1)
        if isequal(occ,t_Cluster1_data{j,8})
            cnt = cnt+1;
        end
    end
    t_Cluster1{i,2} = cnt;
end

for i = 1:size(t_Cluster2,1)
    occ = t_Cluster2{i,1};
    cnt = 0;
    for j=1:size(t_Cluster2_data,1)
        if isequal(occ,t_Cluster2_data{j,8})
            cnt = cnt+1;
        end
    end
    t_Cluster2{i,2} = cnt;
end

for i = 1:size(t_Cluster3,1)
    occ = t_Cluster3{i,1};
    cnt = 0;
    for j=1:size(t_Cluster3_data,1)
        if isequal(occ,t_Cluster3_data{j,8})
            cnt = cnt+1;
        end
    end
    t_Cluster3{i,2} = cnt;
end

for i = 1:size(t_Cluster4,1)
    occ = t_Cluster4{i,1};
    cnt = 0;
    for j=1:size(t_Cluster4_data,1)
        if isequal(occ,t_Cluster4_data{j,8})
            cnt = cnt+1;
        end
    end
    t_Cluster4{i,2} = cnt;
end

for i = 1:size(t_Cluster5,1)
    occ = t_Cluster5{i,1};
    cnt = 0;
    for j=1:size(t_Cluster5_data,1)
        if isequal(occ,t_Cluster5_data{j,8})
            cnt = cnt+1;
        end
    end
    t_Cluster5{i,2} = cnt;
end

for i = 1:size(t_Cluster6,1)
    occ = t_Cluster6{i,1};
    cnt = 0;
    for j=1:size(t_Cluster6_data,1)
        if isequal(occ,t_Cluster6_data{j,8})
            cnt = cnt+1;
        end
    end
    t_Cluster6{i,2} = cnt;
end