%Original Database = original
%Final Result = final
%Generalized Database = dataset
%Swapped orginal = swp
dataset = original;
swp = original;
%Age Generalization
age_range = [0 30; 31 60; 61 120];
for i=1:5000
    for j = 1:3
        if dataset{i,1}>=age_range(j,1) & dataset{i,1}<=age_range(j,2)
            dataset{i,1} = j;
        end
    end
end
%Gender Generalization
var = 'Any';
for i = 1:5000
    dataset{i,2} = var;
end
%Race Generalization
var = 'Person';
for i = 1:5000
    dataset{i,3} = var;
end
%Education Generalization
education_general = {'Bachelors' 'Undergraduate';
    'Some-college' 'Undergraduate';
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
for i=1:5000
    for j = 1:16
        if strmatch(dataset{i,4},education_general{j,1})
            dataset{i,4} = education_general{j,2};
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
for i=1:5000
    for j = 1:7
        if strmatch(dataset{i,5},marital_general{j,1})
            dataset{i,5} = marital_general{j,2};
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
for i=1:5000
    for j = 1:41
        if strmatch(dataset{i,6},country_general{j,1})
            dataset{i,6} = country_general{j,2};
        end
    end
end
%Work Class Generalization
work_general = {'Private' 'Non-Government';
    'Priv-house-serv' 'Non-Government';
    'Self-emp-not-inc' 'Non-Government';
    'Self-emp-inc' 'Non-Government';
    'Federal-gov' 'Government';
    'Local-gov' 'Government';
    'State-gov' 'Government';
    'Without-pay' 'Unemployed';
    'Never-worked' 'Unemployed'};
for i=1:5000
    for j = 1:9
        if strmatch(dataset{i,7},work_general{j,1})
            dataset{i,7} = work_general{j,2};
        end
    end
end
%Salary Class Generalization - already Generalized
final = dataset;
row=[];
row = final(1,[1 2 3 4 5 6 7 9]);
for i=2:5000
    row = cat(1,row,final(i,[1 2 3 4 5 6 7 9]));
end
data = original;
ptr=2;
i=1;
while i<=5000
    j=i+1;
    while j<=5000
        if isequal(row(i,[1 2 3 4 5 6 7 8]),row(j,[1 2 3 4 5 6 7 8]))
            temp1 = row(ptr,:);
            temp2 = data(ptr,:);
            temp3 = swp(ptr,:);
            row(ptr,:)=row(j,:);
            data(ptr,:) = data(j,:);
            swp(ptr,:) = swp(j,:);
            row(j,:)=temp1;
            data(j,:) = temp2;
            swp(j,:) = temp3;
            temp4 = final(ptr,:);
            final(ptr,:)=final(j,:);
            final(j,:)=temp4;
            ptr = ptr+1;
        end
        j=j+1;
    end
    i=ptr;
    ptr=ptr+1;
end
%To check if k<=1
kanon1 = [];
kanon2 = [];
K = 10009;
i = 1;
while i<=5000
    cnt = 1;
    j = i+1;
    while j<=5000
        if isequal(row(i,:),row(j,:))
            cnt = cnt+1;
            j = j+1;
        else
            break
        end
    end
    if cnt<=1
        for w=i:j-1
            kanon1 = cat(1,kanon1,final(w,:));
            kanon2 = cat(1,kanon2,data(w,:));
        end
    else
    end
    i = j;
end