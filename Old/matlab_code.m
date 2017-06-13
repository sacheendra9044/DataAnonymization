var = 'Any';
for i = 1:2000
    dataset{i,2}=var;
end

age_range = [21 30; 31 40; 41 50; 51 60; 61 70; 71 80];

for i=1:2000
    for j = 1:6
        if dataset{i,5}>=age_range(j,1) & dataset{i,5}<=age_range(j,2)
            dataset{i,5} = j;
        end
    end
end

row=[];
row = dataset(1,[2 3 4 5 7]);
for i=2:2000
    row = cat(1,row,dataset(i,[2 3 4 5 7]));
end

ptr=2;
i=1;
while i<=2000
   j=i+1;
   while j<=2000
        if isequal(row(i,[1 2 3 4 5]),row(j,[1 2 3 4 5]))
            temp1 = row(ptr,:);
            row(ptr,:)=row(j,:);
            row(j,:)=temp1;
            temp2 = dataset(ptr,:);
            dataset(ptr,:)=dataset(j,:);
            dataset(j,:)=temp2;
            ptr = ptr+1;
        end
        j=j+1;
    end
    i=ptr;
    ptr=ptr+1;
end

kanon = [];

K = 10009;
i = 1;
while i<=2000
    cnt = 1;
    j = i+1;
    while j<=2000
        if isequal(row(i,:),row(j,:))
            cnt = cnt+1;
            j = j+1;
        else
            break
        end
    end
    if cnt>=5
        for w=i:j-1
            kanon = cat(1,kanon,dataset(w,:));
        end
    end
    i = j;
end

dataset = kanon;

K = 10009;
i = 1;
while i<=1942
    cnt = 1;
    j = i+1;
    while j<=1942
        if isequal(kanon(i,[2 3 4 5 7]),kanon(j,[2 3 4 5 7]))
            cnt = cnt+1;
            j = j+1;
        else
            break
        end
    end
    K = min(K,cnt);
    i=j;
end



sex = input('Want to enter Sex (1=Yes, 0=No) ');
if(sex==1)
    sex_input = input('Enter sex (Male, Female) ','s');
    sex_input = 'Person';
end

edu = input('Want to enter Education (1=Yes, 0=No) ');
if(edu==1)
    edu_input = input('Enter education (University, High School, Graduate School) ','s');
end

age = input('Want to enter Age (1=Yes, 0=No)');
if age==1
    age_input = input('Enter age ');
    for i = 1:6
        if age_input>=age_range(i,1) & age_input<=age_range(i,2)
            age_input = i;
        end
    end
end

marital = input('Want to enter Marital Status (1=Yes, 0=No)');
if(marital==1)
    marital_input = input('Enter marital status (Married, Single, Widow) ','s');
end

due = input('Want to enter if bill is due (1=Yes, 0=No)');
if(due==1)
    due_input = input('Enter bill due (Yes,No) ','s');
end

query=sprintf('SELECT * FROM kanon WHERE SEX="Person"');
if edu==1
    temp = sprintf(' AND EDUCATION = "%s"',edu_input);
    query = cat(2,query,temp);
end
if age==1
    temp = sprintf(' AND AGE = %d',age_input);
    query = cat(2,query,temp);
end
if marital==1
    temp = sprintf(' AND MARRIAGE = "%s"',marital_input);
    query = cat(2,query,temp);
end
if due==1
    temp = sprintf(' AND PAY_DUE = "%s"',due_input);
    query = cat(2,query,temp);
end

query