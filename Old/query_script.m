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