#Bioinformatics Week 5 Lab
##More R

Slides for the introduction to today's lab, as well as a PDF of this document, can be found on [Blackboard](http://blackboard.uttyler.edu).

###Learning Objectives
You should be able to:

1. manage more complicated data in R
2. create new functions in R
3. apply statistical tests in R using relevant documentation

###Readings:
* OIS Section 4 (Foundations for inference)
* OIS Section 5 (Inference for Numerical Data)
* OIS Section 6 (Inference for Categorical Data)
* OIS Chapter 7 (Intro to linear regression)
* OIS Chapter 8 (Multiple, logistic regression)

Additional materials for reference:
* [Tutorials](http://ww2.coastal.edu/kingw/statistics/R-tutorials/index.html) for many common statistical tests in R

###Activities

Since today's lab will run a bit short, we're going to focus on adding a few more skills to the basic R foundation we started to build last week.

**Dealing with more complicated data**

Let's load the same set of datasets that we learned about last week:

```
#install openintro (may be required if you're on a lab machine that deleted it after you logged out)
install.packages("openintro")
#load package
library(openintro)
```

Some data frames include several types of data. What commands did we learn last week to tell us about the content of files?. We can also view more in-depth details about data structure:

```
#view internal structure of object
str(mammals)
```

The result printed to the console describes the dataset, including each of the variables and whether they are numerical, integer, or factor. This can be useful when trying to select particular statistical tests.

You may have noticed that the `mammals` dataset includes several variables for which `NA` is listed as a value, which indicates the data are missing for that observation. If you try to find the mean for a variable with `NA` values, you will get a mean of `NA`. One of the peculiarities of working with R is how it deals with missing data. Not all commands work with missing data in the same way! Look at the documentation for your command to find out how R treats missing data. 

Most commands have an argument to allow you to ignore missing data:

```
#find mean of value with missing data
mean(mammals$LifeSpan, na.rm = TRUE)
```

**Building functions**

One of the strengths in R is our ability, as users, to build our own functions to perform tasks. For example, we learned to calculate standard deviation in R last week. However, we R doesn't include a built-in function to calculate standard error. Here's how we'll build our own:

```
#build function to calculate standard error from data x
se <- function(x) sd(x)/sqrt(length(x))
#another method for calculating standard error from data x
se2 <- function (x) sqrt(var(x)/length(x))
```

You can test these commands by applying them to one of our test datasets. Note that 

**Statistical inference**

*t-test*

The packages loaded in R by default include many common statistical tests. Although we don't have time to cover them all, we're going to explore a few common tests. Please note that several of these tests have multiple implementations in R and may have different syntax, assumptions, and output, so check the documentation of the test if you are unsure!

We use t-tests to determine whether the means of two groups of numerical data are different. Today we'll use the pre-loaded `sleep` dataset to learn how to apply t-tests. First we need to explore how the data in sleep are arranged:

```
#identify data in sleep
str(sleep)
?sleep
```

The `extra` column indicates how much more sleep (compared to a control) each recipient receieved on nights with each drug. There are also two groups corresponding to two drugs being tested.  These will be the categories we will compare in the t-test:

```
#unpaired t-test
t.test(extra ~ group, data = sleep)
```

Similar to the `lm` function we discussed last week, `t.test` requires you to specify the relationship between variables. The tilde (`~`) lets you know this option is a "formula," which relates the variables to each other. In this case, `numeric ~ categorical` is the formula for unpaired t-tests.

So far, we've been ignoring the last column of this dataset, which lists the patient ID. That means that the values listed for `extra` are actually assigned to specific patients. Because the data for group 1 and 2 are paired, we should implement a paired t-test:

```
#paired t-test
with(sleep,
     t.test(extra[group == 1],   extra[group == 2], paired = TRUE))
```

This code introduces two new things. First, the `with` command allows you to specify a more complex data structure from pre-existing data. In this case, we are specifying that `extra` values correpsonding to group 1 are paired with `extra` values from group 2. The double equal sign (`==`) indicates that the values from the column referenced (extra) must match exactly to the specified value (1 or 2). The second difference here is that the syntax for `t.test` is different. Because our data are paired, we indicate that with a separate argument. We also don't need to specify a formula because the associations between data are described by the `with` command.

What were the results for each of the two t-tests? How would you interpret them?

*chi-square*

Chi-square tests require the data formatted in contingency tables showing number of counts for each outcome. The test can then be easily applied to the table:

```
#format contingency table
tbl <- table(smoking$gender, smoking$smoke)
#perform chi-square test
chisq.test(tbl)
```

When we made tables last week, we were only interested in two columns. Here we need to specify both columns relating to the categorical data we are testing. 

What are the results for this chi-square test? How would you interpret it?

*ANOVA* 

Last week, I asked you to compare the means of the three species in the `iris` dataset. Now we're going to apply ANOVA to test whether these means are actually different. We'll need to apply two steps to obtain the results:

```
#fitting model to one-way ANOVA
fit <- aov(Sepal.Length ~ Species, data = iris)
#summarize results
summary(fit)
```

The first command calculates the test statistic and a few other population parameters. You can evaluate the output by plotting it (this will be interactive, you'll hit enter to move through the plots) or simply printing it to the screen. The second command is used to produce the result of model-fitting functions, and will print the same test statistic (F value) and p-value. 

###Assignment
* Due Wednesday, Feb 18 at 5 pm
* Assessment criteria
	* Technical content 20, appropriate syntax for written assessment answers
	* Critical thinking 20, explanations for written assessment answers
	* Documentation: 5, citations for resources used in questions embedded in answers
	* Professional behavior: 5, class participation, assignment formatting using homework template (including code formatted in `monospace`)
* Written assessment: 
	* create new file in your homework repository, `LastnameHomework`, called `LastnameWk5Homework.md". Title (header) is "More R." 
	* Answer the following questions about the Unix tools you learned for this week's lab, including code comments where appropriate 				
	* Use appropriate Markdown formatting, including `monospace` when referencing commands you entered. 
	* If you choose to copy and paste the questions before answering, it might help to copy from the Raw view. 
	* Don't forget to preview your homework before committing! 
	* If you get stuck on a question, please consult the textbook (see readings above).

**Don't forget to load the `openintro` package to access the pre-loaded datasets!**

1. What is the mean and standard deviation for Gestation in `mammals`? Include your code and comments.
2. Write your own function called "convertPercent" to convert from a decimal to percentage. Include your code and comments.
3. Use a t-test to determine if male and female possums differ in total length using the dataset `possum`. Include your code, comments, and conclusion for the test.
4. Use a chi-square test to determine whether mature mothers are more likely to have premie babies using the dataset `ncbirths`. Include your code, comments, and conclusion for the test.
5. Use ANOVA to determine whether weights of chicks differ by feed type using the dataset `chickwts`. Include your code, comments, and conclusion for the test.
6. How long did it take you to complete these questions?
7. Extra credit (10 points): TBA
8. Type SUBMIT as the answer to this question when you are ready for this assignment to be graded.
