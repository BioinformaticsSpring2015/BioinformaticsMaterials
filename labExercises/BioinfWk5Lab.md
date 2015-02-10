#Bioinformatics Week 5 Lab
##Title

Slides for the introduction to today's lab, as well as a PDF of this document, can be found on [Blackboard](http://blackboard.uttyler.edu).

###Learning Objectives
You should be able to:

1. XXX

###Readings:
* OIS Section 4 (Foundations for inference)
* OIS Section 5 (Inference for Numerical Data)
* OIS Section 6 (Inference for Categorical Data)
* OIS Chapter 7 (Intro to linear regression)
* OIS Chapter 8 (Multiple, logistic regression)

Additional materials for reference:
* XXX

###Activities

Since today's lab will run a bit short, we're going to use the foundation we started last week to learn a few more skills in R. 

**Building functions**

One of the strengths in R is our ability, as users, to build our own functions to perform tasks. For example, we learned to calculate standard deviation in R last week. However, we R doesn't include a built-in function to calculate standard error. Here's how we'll build our own:

```
#build function to calculate standard error from data x
se <- function(x) sd(x)/sqrt(length(x))
#another method for calculating standard error from data x
se2 <- function (x) sqrt(var(x)/length(x))
```

**For loops**

R can build loops that function the same as those in Unix. However, the syntax is slightly different and the ease of referencing particular parts of a data file make them useful for different purposes:

Let's say we wanted to build a loop to convert 

```
#convert miles to kilometers
for (i in rivers) {print (i * XXX)}
```

**Missing data**

One of the peculiarities of working with R is how it deals with missing data. 

###Practice exercises (not part of your assignment, just for practice)

1. 

###Assignment
* Due XX, XX X at XX
* Assessment criteria
	* Technical content X, appropriate syntax for written assessment answers
	* Critical thinking X, explanations for written assessment answers
	* Documentation: 5, citations for resources used in questions embedded in answers
	* Professional behavior: 10, class participation, assignment formatting using homework template (including code formatted in `monospace`)
* Written assessment: 
	* create new file in your homework repository, `LastnameHomework`, called `LastnameWk3Homework.md". Title (header) is "Unix scripting and pipelines." 
	* Answer the following questions about the Unix tools you learned for this week's lab, including code comments where appropriate 				
	* Use appropriate Markdown formatting, including `monospace` when referencing commands you entered. 
	* If you choose to copy and paste the questions before answering, it might help to copy from the Raw view. 
	* Don't forget to preview your homework before committing! 
	* If you get stuck on a question, please consult the textbook (see readings above).

1.  
