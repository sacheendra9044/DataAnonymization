job = input('Want to enter Job? (1=Yes, 0=No) ');
if(job==1)
    job_input = input('Enter Job \n1.Singer\n2.Broker\n3.Lawyer\n4.Engineer\n5.Doctor\n6.Shopkeeper\n7.Teacher\n8.Dealer\n9.Dancer\n10.Writer\n) ');
    if job_input==1 | job_input==9 | job_input==10
        job_input = 'Artist';
    else if job_input==2
            job_input = 'Broker';
        else if job_input==3
                job_input = 'Lawyer';
            else if job_input==4
                    job_input = 'Engineer';
                else if job_input==5
                        job_input = 'Doctor';
                    else if job_input==6
                            job_input = 'Shopkeeper';
                        else if job_input==7
                                job_input = 'Teacher';
                            else if job_input==8
                                    job_input = 'Dealer';
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

sex = input('Want to enter Sex?(1=Yes, 0=No) ');
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
    marital_input = input('Enter marital status (Married, Single) ','s');
end

query=sprintf('SELECT * FROM anon_data_set WHERE SEX="Any"');
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
if job==1
    temp = sprintf(' AND JOB = "%s"',job_input);
    query = cat(2,query,temp);
end


query