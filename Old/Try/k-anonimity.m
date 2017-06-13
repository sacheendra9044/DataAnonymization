dataset = original;

%Gender Generalization
var = 'Any';
for i = 1:2000
    dataset{i,4}=var;
end

%Age generalization
age_range = [21 30; 31 40; 41 50; 51 60; 61 70; 71 80];
for i=1:2000
    for j = 1:6
        if dataset{i,7}>=age_range(j,1) & dataset{i,7}<=age_range(j,2)
            dataset{i,7} = j;
        end
    end
end

newdata1=dataset;
%Subtree_1 Generalization ---> {Dancer, Singer, Writer} = {Artist}
general = 'Artist';

string = 'Dancer';
for i=1:2000
    if strmatch(newdata1{i,3},string)
           newdata1{i,3}=general;
    end
end
string = 'Singer';
for i=1:2000
    if strmatch(newdata1{i,3},string)
           newdata1{i,3}=general;
    end
end
string = 'Writer';
for i=1:2000
    if strmatch(newdata1{i,3},string)
           newdata1{i,3}=general;
    end
end

%Subtree_2 Generalization ---> {Teacher, Lawyer, Engineer, Doctor} = {Professional}
% general = 'Professional';

% string = 'Teacher';
% for i=1:2000
%     if strmatch(newdata1{i,3},string)
%            newdata1{i,3}=general;
%     end
% end
% string = 'Lawyer';
% for i=1:2000
%     if strmatch(newdata1{i,3},string)
%            newdata1{i,3}=general;
%     end
% end
% string = 'Engineer';
% for i=1:2000
%     if strmatch(newdata1{i,3},string)
%            newdata1{i,3}=general;
%     end
% end
% string = 'Doctor';
% for i=1:2000
%     if strmatch(newdata1{i,3},string)
%            newdata1{i,3}=general;
%     end
% end


% %Subtree_3 Generalization ---> {Broker, Shopkeeper, Dealer} = {Business}
% general = 'Business';

% string = 'Broker';
% for i=1:2000
%     if strmatch(newdata1{i,3},string)
%            newdata1{i,3}=general;
%     end
% end
% string = 'Shopkeeper';
% for i=1:2000
%     if strmatch(newdata1{i,3},string)
%            newdata1{i,3}=general;
%     end
% end
% string = 'Dealer';
% for i=1:2000
%     if strmatch(newdata1{i,3},string)
%            newdata1{i,3}=general;
%     end
% end


final = newdata1;
row=[];
row = final(1,[3 4 5 6 7]);
for i=2:2000
    row = cat(1,row,final(i,[3 4 5 6 7]));
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
            temp2 = final(ptr,:);
            final(ptr,:)=final(j,:);
            final(j,:)=temp2;
            ptr = ptr+1;
        end
        j=j+1;
    end
    i=ptr;
    ptr=ptr+1;
end

%insert(conn,'anon_data_set',{'LIMIT_BAL','BILL_AMOUNT','JOB','SEX','EDUCATION','MARRIAGE','AGE','PAY_DUE'},final)

% To check if any tuple is not unique
kanon = [];
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
            kanon = cat(1,kanon,final(w,:));
        end
    end
    i = j;
end
