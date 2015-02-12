#Bioinformatics Week 5 Lab
##More R

Slides for the introduction to today's lab, as well as a PDF of this document, can be found on [Blackboard](http://blackboard.uttyler.edu).

###Learning Objectives
You should be able to:

1. manage more complicated data in R
2. create functions and loops in R

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

You may have noticed that the `mammals` dataset includes several variables for which `NA` is listed as a value, which indicates the data are missing for that observation. If you try to find the mean for a variable with `NA` values, you will get a mean of `NA`. One of the peculiarities of working with R is how it deals with missing data. Look at the documentation for your command to find out how R treats missing data. 

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

You can test these commands by applying them to one of our test datasets.

**Statistical inference**

The packages loaded in R by default include many common statistical tests. Although we don't have time to cover them all, we're going to explore a few common tests.

t-test

```
#unpaired
t.test(extra ~ group, data = sleep)
#paired
with(sleep,
     t.test(extra[group == 1],
            extra[group == 2], paired = TRUE))
```

ANOVA

chi-square

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

1. What is the mean and standard deviation for Gestation in `mammals`? Include your code and comments.
2. Write your own function called "convertPercent" to convert from a decimal to percentage. Include your code and comments.
3. 

How long did it take you to complete these questions?
Type SUBMIT as the answer to this question when you are ready for this assignment to be graded.
