#James Curtis Addy 
#J00812469

#   Q1. Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100")
# Hint: use the `paste()` function and vector recycling to add a number to the word
# "Employee"
employees = paste("Employee ", 1:100)


#  Q2.  Create a vector of 100 random salaries for the year 2017
# Use the `runif()` function to pick random numbers between 40000 and 50000
salaries_2017 = runif(100, 40000, 50000)


#   Q3.  Create a vector of 100 annual salary adjustments between -5000 and 10000.
# (A negative number represents a salary decrease due to corporate greed)
# Again use the `runif()` function to pick 100 random numbers in that range.
salary_adjustments = runif(100, -5000, 10000)


#    Q4.  Create a data frame `salaries` by combining the 3 vectors you just made
# Remember to set `stringsAsFactors=FALSE`!
salaries = data.frame(employees, salaries_2017, salary_adjustments, stringsAsFactors = FALSE)


#   Q5.  Add a column to the `salaries` data frame that represents each person's
# salary in 2018 (e.g., with the salary adjustment added in).
salaries$adjusted_salaries_2018 = salaries$salaries_2017 + salaries$salary_adjustments


#  Q6.  Add a column to the `salaries` data frame that has a value of `TRUE` if the
# person got a raise (their salary went up)
salaries$salary_raised = salaries$adjusted_salaries_2018 > salaries$salaries_2017



###   Q7  Retrieve values from your data frame to answer the following questions
### Note that you should get the value as specific as possible (e.g., a single
### cell rather than the whole row!)



#   Q8  What was the 2018 salary of Employee 57
salaries$adjusted_salaries_2018[57]



#   Q9 How many employees got a raise?
number_of_raises = sum(salaries$salary_raised == TRUE, rm.NA = TRUE)


  
#   Q10 What was the dollar value of the highest raise?
highest_raise = max(salaries$salary_adjustments)



#   Q11 What was the "name" of the employee who received the highest raise?
employee_highest_raise = salaries$employees[which(salaries$salary_adjustments == highest_raise)]



#   Q12 What was the largest decrease in salaries between the two years?
largest_salary_decrease = min(salaries$salary_adjustments)


#   Q13  What was the name of the employee who recieved largest decrease in salary?
employee_highest_decrease = salaries$employees[which(salaries$salary_adjustments == largest_salary_decrease)]


#   Q14 What was the average salary change?
avg_salary_adjustment = mean(salaries$salary_adjustments)


#   Q15 For people who did not get a raise, how much money did they lose on average?
avg_loss = mean(salaries$salary_adjustments[which(salaries$salary_adjustments < 0)])


#   Q16# Consider: do the above averages match what you expected them to be based on
## how you generated the salaries?
Yes


#   Q17 Write a .csv file of your salary data to your working directory
write.csv(salaries, file = "Salary_Data.csv")



#####################################

#  Load R's "USPersonalExpenditure" dataset using the `data()` function
# This will produce a data frame called `USPersonalExpenditure`
data("USPersonalExpenditure")



#   Q18  The variable `USPersonalExpenditure` is now accessible to you. Unfortunately,
# it's not a data frame (it's actually what is called a matrix)
# Test this using the `is.data.frame()` function
is.data.frame(USPersonalExpenditure)




#   Q19 Luckily, you can pass the USPersonalExpenditure variable as an argument to the
# `data.frame()` function to convert it a data farm. Do this, storing the
# result in a new variable
USPersonalExpenditure_DF = data.frame(USPersonalExpenditure)



#   Q20 What are the column names of your dataframe?
colnames(USPersonalExpenditure_DF)



##    Q21 Consider: why are they so strange? Think about whether you could use a number
## like 1940 with dollar notation!



#   Q22 What are the row names of your dataframe?
rownames(USPersonalExpenditure_DF)



#   Q23 Add a column "category" to your data frame that contains the rownames
USPersonalExpenditure_DF$category = rownames(USPersonalExpenditure_DF)




#   Q24 How much money was spent on personal care in 1940?
USPersonalExpenditure_DF$X1940[which(USPersonalExpenditure_DF$category == "Personal Care")]




#   Q25 How much money was spent on Food and Tobacco in 1960?
USPersonalExpenditure_DF$X1960[which(USPersonalExpenditure_DF$category == "Food and Tobacco")]




#   Q26 What was the highest expenditure category in 1960?
max(USPersonalExpenditure_DF$X1960)


#   Q27 Define a function `lowest_category` that takes in a year as a parameter, and
# returns the lowest spending category of that year
lowest_category = function(year){return(USPersonalExpenditure_DF$category[which(year == min(year))])}



#  Q 28 Using your function, determine the lowest spending category of each year
# Hint: use the `sapply()` function to apply your function to a vector of years
sapply(USPersonalExpenditure_DF[1:5], lowest_category)



#############################
#   Q29 Use the `read.csv()` functoin to read the data from the `data/gates_money.csv`
# file into a variable called `grants` using the `read.csv()`
# Be sure to set your working directory in RStudio, and do NOT treat strings as
# factors!
gates = read.csv("gates_money.csv")


#   Q30 Use the View function to look at the loaded data
View(gates, "Gates")



#   Q31 Create a variable `organization` that contains the `organization` column of
# the dataset
organization = as.vector(gates$organization)



#   Q32 Confirm that the "organization" column is a vector using the `is.vector()`
# function.
# This is a useful debugging tip if you hit errors later!
is.vector(organization)



##    Q33  Now you can ask some interesting questions about the dataset



#   Q34 What was the mean grant value?
mean_grant_value = mean(gates$total_amount)



#   Q35 What was the dollar amount of the largest grant?
max_grant = max(gates$total_amount)



#   Q36 What was the dollar amount of the smallest grant?
min_grant = min(gates$total_amount)



#  Q37 Which organization received the largest grant?
max_grant_organization = organization[which(gates$total_amount == max_grant)]



#  Q38 Which organization received the smallest grant?
min_grant_organization = organization[which(gates$total_amount == min_grant)]



#   Q39 How many grants were awarded in 2010?
grants_2010 = sum(gates$start_year == 2010)
