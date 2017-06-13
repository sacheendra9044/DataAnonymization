%Original Dataset = original
%Generalized Dataset = dataset
%Final Result = finalResult
%Swapped Data = swp

dataset = original;
swp = original;

table1 = [];

for i = 1 : 5000
    v1 = 0;
    v2 = 0;
    v3 = 0;
    v4 = 0;
    if strmatch(dataset{i,8},'Tech-support')
        v1 = 1;
    else if strmatch(dataset{i,8},'Craft-repair')
        v2 = 1;
        else if strmatch(dataset{i,8},'Prof-specialty')
                v3 = 1;
            else if strmatch(dataset{i,8},'Machine-op-inspct')
                    v4 = 1;
                end
            end
        end
    end
    if v1 || v2 || v3 || v4
         table1 = cat(1,table1,dataset(i,:));
    end
end

swp1 = table1;

table2 = [];
for i = 1 : 5000
    v1 = 0;
    v2 = 0;
    v3 = 0;
    if strmatch(dataset{i,8},'Sales')
        v1 = 1;
    else if strmatch(dataset{i,8},'Exec-managerial')
        v2 = 1;
        else if strmatch(dataset{i,8},'Handlers-cleaners')
                v3 = 1;
            end
        end
    end
    if v1 || v2 || v3
         table2 = cat(1,table2,dataset(i,:));
    end
end

swp2 = table2;

table3 = [];
for i = 1 : 5000
    v1 = 0;
    v2 = 0;
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    if strmatch(dataset{i,8},'Other-service')
        v1 = 1;
    else if strmatch(dataset{i,8},'Adm-clerical')
        v2 = 1;
        else if strmatch(dataset{i,8},'Farming-fishing')
                v3 = 1;
            else if strmatch(dataset{i,8},'Transport-moving')
                    v4 = 1;
                else if strmatch(dataset{i,8},'Priv-house-serv')
                    v5 = 1;
                    else if strmatch(dataset{i,8},'Protective-serv')
                        v6 = 1;
                            else if strmatch(dataset{i,8},'Armed-Forces')
                                    v7 = 1;
                                end
                        end
                    end
                end
            end
        end
    end
    if v1 || v2 || v3 || v4 || v5 || v6 || v7
         table3 = cat(1,table3,dataset(i,:));
    end
end

swp3 = table3;

t1 = table1;
%Age Generalization
age_range = [0 30; 31 60; 61 120];
for i=1:1795
    for j = 1:3
        if t1{i,1}>=age_range(j,1) & t1{i,1}<=age_range(j,2)
            t1{i,1} = j;
        end
    end
end

%Gender Generalization
var = 'Any';
for i = 1:1795
    t1{i,2} = var;
end

%Race Generalization
var = 'Person';
for i = 1:1795
    t1{i,3} = var;
end

%Education Generalization
education_general = {'Bachelors' 'Graduate';
            'Some-college' 'Graduate';
            '11th' 'School';
            'HS-grad' 'Graduate';
            'Prof-school' 'Graduate';
            'Assoc-acdm' 'Graduate';
            'Assoc-voc' 'Graduate';
            '9th' 'School';
            '7th-8th' 'School';
            '12th' 'School';
            'Masters' 'Graduate';
            '1st-4th' 'School';
            '10th' 'School';
            'Doctorate' 'Graduate';
            '5th-6th' 'School';
            'Preschool' 'School'};


for i=1:1795
    for j = 1:16
        if strmatch(t1{i,4},education_general{j,1})
            t1{i,4} = education_general{j,2};
        end
    end
end

%Marital Status Generalization
marital_general = {'Married-civ-spouse' 'spouse present';
            'Divorced' 'spouse not present';
            'Never-married' 'spouse not present';
            'Separated' 'spouse not present';
            'Widowed' 'spouse not present';
            'Married-spouse-absent' 'spouse not present';
            'Married-AF-spouse' 'spouse present'};


for i=1:1795
    for j = 1:7
        if strmatch(t1{i,5},marital_general{j,1})
            t1{i,5} = marital_general{j,2};
        end
    end
end

%Native Country Generalization
country_general = {'United-States' 'A*a';
            'Cambodia' 'A*a';
            'England' 'Europe';
            'Puerto-Rico' 'A*a';
            'Canada' 'A*a';
            'Germany' 'Europe';
            'Outlying-US(Guam-USVI-etc)' 'A*a';
            'India' 'A*a';
            'Japan' 'A*a';
            'Greece' 'Europe';
            'South' 'A*a';
            'China' 'A*a';
            'Cuba' 'A*a';
            'Iran' 'A*a';
            'Honduras' 'A*a';
            'Philippines' 'A*a';
            'Italy' 'Europe';
            'Poland' 'Europe';
            'Jamaica' 'A*a';
            'Vietnam' 'A*a';
            'Mexico' 'A*a';
            'Portugal' 'Europe';
            'Ireland' 'Europe';
            'France' 'Europe';
            'Dominican-Republic' 'A*a';
            'Laos' 'A*a';
            'Ecuador' 'A*a';
            'Taiwan' 'A*a';
            'Haiti' 'A*a';
            'Columbia' 'A*a';
            'Hungary' 'Europe';
            'Guatemala' 'A*a';
            'Nicaragua' 'A*a';
            'Scotland' 'Europe';
            'Thailand' 'A*a';
            'Yugoslavia' 'Europe';
            'El-Salvador' 'A*a';
            'Trinadad&Tobago' 'A*a';
            'Peru' 'A*a';
            'Hong' 'A*a';
            'Holand-Netherlands' 'Europe'};

for i=1:1795
    for j = 1:41
        if strmatch(t1{i,6},country_general{j,1})
            t1{i,6} = country_general{j,2};
        end
    end
end

%Work Class Generalization
work_general = {'Private' 'Employed';
            'Priv-house-serv' 'Employed';
            'Self-emp-not-inc' 'Employed';
            'Self-emp-inc' 'Employed';
            'Federal-gov' 'Employed';
            'Local-gov' 'Employed';
            'State-gov' 'Employed';
            'Without-pay' 'Unemployed';
            'Never-worked' 'Unemployed'};

for i=1:1795
    for j = 1:9
        if strmatch(t1{i,7},work_general{j,1})
            t1{i,7} = work_general{j,2};
        end
    end
end

%Salary Class Generalization - already Generalized

final1 = t1;
row=[];
row = final1(1,[1 2 3 4 5 6 7 9]);
for i=2:1795
    row = cat(1,row,final1(i,[1 2 3 4 5 6 7 9]));
end

ptr=2;
i=1;
while i<=1795
   j=i+1;
   while j<=1795
        if isequal(row(i,[1 2 3 4 5 6 7 8]),row(j,[1 2 3 4 5 6 7 8]))
            temp1 = row(ptr,:);
            row(ptr,:)=row(j,:);
            row(j,:)=temp1;
            temp2 = final1(ptr,:);
            final1(ptr,:)=final1(j,:);
            final1(j,:)=temp2;
            temp3 = swp1(ptr,:);
            swp1(ptr,:)=swp1(j,:);
            swp1(j,:)=temp3;
            ptr = ptr+1;
        end
        j=j+1;
    end
    i=ptr;
    ptr=ptr+1;
end



t2 = table2;
%Age Generalization
age_range = [0 30; 31 60; 61 120];
for i=1:1517
    for j = 1:3
        if t2{i,1}>=age_range(j,1) & t2{i,1}<=age_range(j,2)
            t2{i,1} = j;
        end
    end
end

%Gender Generalization
var = 'Any';
for i = 1:1517
    t2{i,2} = var;
end

%Race Generalization
var = 'Person';
for i = 1:1517
    t2{i,3} = var;
end

%Education Generalization


for i=1:1517
    for j = 1:16
        if strmatch(t2{i,4},education_general{j,1})
            t2{i,4} = education_general{j,2};
        end
    end
end

%Marital Status Generalization

for i=1:1517
    for j = 1:7
        if strmatch(t2{i,5},marital_general{j,1})
            t2{i,5} = marital_general{j,2};
        end
    end
end

%Native Country Generalization

for i=1:1517
    for j = 1:41
        if strmatch(t2{i,6},country_general{j,1})
            t2{i,6} = country_general{j,2};
        end
    end
end

%Work Class Generalization

for i=1:1517
    for j = 1:9
        if strmatch(t2{i,7},work_general{j,1})
            t2{i,7} = work_general{j,2};
        end
    end
end

%Salary Class Generalization - already Generalized

final2 = t2;
row=[];
row = final2(1,[1 2 3 4 5 6 7 9]);
for i=2:1517
    row = cat(1,row,final2(i,[1 2 3 4 5 6 7 9]));
end

ptr=2;
i=1;
while i<=1517
   j=i+1;
   while j<=1517
        if isequal(row(i,[1 2 3 4 5 6 7 8]),row(j,[1 2 3 4 5 6 7 8]))
            temp1 = row(ptr,:);
            row(ptr,:)=row(j,:);
            row(j,:)=temp1;
            temp2 = final2(ptr,:);
            final2(ptr,:)=final2(j,:);
            final2(j,:)=temp2;
            temp3 = swp2(ptr,:);
            swp2(ptr,:)=swp2(j,:);
            swp2(j,:)=temp3;
            ptr = ptr+1;
        end
        j=j+1;
    end
    i=ptr;
    ptr=ptr+1;
end

t3 = table3;
%Age Generalization
age_range = [0 30; 31 60; 61 120];
for i=1:1688
    for j = 1:3
        if t3{i,1}>=age_range(j,1) & t3{i,1}<=age_range(j,2)
            t3{i,1} = j;
        end
    end
end

%Gender Generalization
var = 'Any';
for i = 1:1688
    t3{i,2} = var;
end

%Race Generalization
var = 'Person';
for i = 1:1688
    t3{i,3} = var;
end

%Education Generalization


for i=1:1688
    for j = 1:16
        if strmatch(t3{i,4},education_general{j,1})
            t3{i,4} = education_general{j,2};
        end
    end
end

%Marital Status Generalization

for i=1:1688
    for j = 1:7
        if strmatch(t3{i,5},marital_general{j,1})
            t3{i,5} = marital_general{j,2};
        end
    end
end

%Native Country Generalization

for i=1:1688
    for j = 1:41
        if strmatch(t3{i,6},country_general{j,1})
            t3{i,6} = country_general{j,2};
        end
    end
end

%Work Class Generalization

for i=1:1688
    for j = 1:9
        if strmatch(t3{i,7},work_general{j,1})
            t3{i,7} = work_general{j,2};
        end
    end
end

%Salary Class Generalization - already Generalized

final3 = t3;
row=[];
row = final3(1,[1 2 3 4 5 6 7 9]);
for i=2:1688
    row = cat(1,row,final3(i,[1 2 3 4 5 6 7 9]));
end

ptr=2;
i=1;
while i<=1688
   j=i+1;
   while j<=1688
        if isequal(row(i,[1 2 3 4 5 6 7 8]),row(j,[1 2 3 4 5 6 7 8]))
            temp1 = row(ptr,:);
            row(ptr,:)=row(j,:);
            row(j,:)=temp1;
            temp2 = final3(ptr,:);
            final3(ptr,:)=final3(j,:);
            final3(j,:)=temp2;
            temp3 = swp3(ptr,:);
            swp3(ptr,:)=swp3(j,:);
            swp3(j,:)=temp3;
            ptr = ptr+1;
        end
        j=j+1;
    end
    i=ptr;
    ptr=ptr+1;
end

final = final1;
for i = 1 : 1517
    final = cat(1,final,final2(i,:));
end
for i = 1 : 1688
    final = cat(1,final,final3(i,:));
end

% final1, final2, final3 contain 3 large equivalence classes.

finalResult = [];
i=1;
undiverse = [];
swp = [];
uswp = [];

while i<=1795
    j = i+1;
    mo = containers.Map;
    mo(final1{i,8}) = 1;
    while j<=1795
        if(isequal(final1(i,[1 2 3 4 5 6 7 9]),final1(j,[1 2 3 4 5 6 7 9])))
            mo(final1{j,8}) = 1;
            j = j+1;
        else
            break
        end
    end
    if(mo.Count <= 2) 
        for k=i:j-1
            undiverse = cat(1,undiverse,final1(k,:));
            uswp = cat(1,uswp,swp1(k,:));
        end
    else
        for k=i:j-1
            finalResult = cat(1,finalResult,final1(k,:));
            swp = cat(1,swp,swp1(k,:));
        end
    end
    i=j;
end

i=1;
while i<=1517
    j = i+1;
    mo = containers.Map;
    mo(final2{i,8}) = 1;
    while j<=1517
        if(isequal(final2(i,[1 2 3 4 5 6 7 9]),final2(j,[1 2 3 4 5 6 7 9])))
            mo(final2{j,8}) = 1;
            j = j+1;
        else
            break
        end
    end
    if(mo.Count <= 2) 
        for k=i:j-1
            undiverse = cat(1,undiverse,final2(k,:));
            uswp = cat(1,uswp,swp2(k,:));
        end
    else
        for k=i:j-1
            finalResult = cat(1,finalResult,final2(k,:));
            swp = cat(1,swp,swp2(k,:));
        end
    end
    i=j;
end


i=1;
while i<=1688
    j = i+1;
    mo = containers.Map;
    mo(final3{i,8}) = 1;
    while j<=1688
        if(isequal(final3(i,[1 2 3 4 5 6 7 9]),final3(j,[1 2 3 4 5 6 7 9])))
            mo(final3{j,8}) = 1;
            j = j+1;
        else
            break
        end
    end
    if(mo.Count <= 2) 
        for k=i:j-1
            undiverse = cat(1,undiverse,final3(k,:));
            uswp = cat(1,uswp,swp3(k,:));
        end
    else
        for k=i:j-1
            finalResult = cat(1,finalResult,final3(k,:));
            swp = cat(1,swp,swp3(k,:));
        end
    end
    i=j;
end

row = undiverse;
ptr = 2;
i=1;
while i<=140
   j=i+1;
   while j<=140
        if isequal(row(i,[1 2 3 4 5 6 7 9]),row(j,[1 2 3 4 5 6 7 9]))
            temp1 = row(ptr,:);
            row(ptr,:)=row(j,:);
            row(j,:)=temp1;
            temp2 = uswp(ptr,:);
            uswp(ptr,:)=uswp(j,:);
            uswp(j,:)=temp2;
            ptr = ptr+1;
        end
        j=j+1;
    end
    i=ptr;
    ptr=ptr+1;
end

undiverse = row;
i=1;
undiverse2 = [];
uswp2 = [];
while i<=140
    j = i+1;
    mo = containers.Map;
    mo(undiverse{i,8}) = 1;
    while j<=140
        if(isequal(undiverse(i,[1 2 3 4 5 6 7 9]),undiverse(j,[1 2 3 4 5 6 7 9])))
            mo(undiverse{j,8}) = 1;
            j = j+1;
        else
            break
        end
    end
    if(mo.Count <= 2) 
        for k=i:j-1
            undiverse2 = cat(1,undiverse2,undiverse(k,:));
            uswp2 = cat(1,uswp2,uswp(k,:));
        end
    else
        for k = i:j-1
            finalResult = cat(1,finalResult,undiverse(k,:));
            swp = cat(1,swp,uswp(k,:));
        end
    end
    i=j;
end

copy1 = undiverse2;

for i = 88:92
    copy1{i,4} = '***';  %Education generalized for last 5 records
end

for i = 1:72  
    copy1{i,1} = 4;         % For Age, 4 -> (2 or 3) for some records
    copy1{i,5} = 'Any';     % Marital Status generalized for some records
end

copy1{73,9} = '<=50K';      %  Noise added
uswp2{73,9} = '<=50K';
copy1{74,9} = '<=50K';
uswp2{74,9} = '<=50K';
copy1{73,1} = 5;            % For Age, 5 -> (1 or 3)
copy1{74,1} = 5;

for i = 81:85
    copy1{i,1} = 5;
end

for i = 78:80
    copy1{i,1} = 2;         % Noise again added
    uswp2{i,1} = 35;
end

for i = 75:80
    copy1{i,4} = 'Any';
    copy1{i,5} = 'Any';
end

for i = 86:87
    copy1{i,4} = 'Any';
    copy1{i,5} = 'Any';
end

ptr = 2;
i=1;
while i<=92
   j=i+1;
   while j<=92
        if isequal(copy1(i,[1 2 3 4 5 6 7 9]),copy1(j,[1 2 3 4 5 6 7 9]))
            temp1 = copy1(ptr,:);
            copy1(ptr,:)=copy1(j,:);
            copy1(j,:)=temp1;
            temp2 = uswp2(ptr,:);
            uswp2(ptr,:)=uswp2(j,:);
            uswp2(j,:)=temp2;
            ptr = ptr+1;
        end
        j=j+1;
    end
    i=ptr;
    ptr=ptr+1;
end

for i = 1:92
    finalResult = cat(1,finalResult,copy1(i,:));
    swp = cat(1,swp,uswp2(i,:));
end
