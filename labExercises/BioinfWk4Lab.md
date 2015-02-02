#Bioinformatics Week 4 Lab
##Variation in Data

Slides for the introduction to today's lab, as well as a PDF of this document, can be found on [Blackboard](http://blackboard.uttyler.edu).

###Learning Objectives
You should be able to:

1. Perform basic data manipulation tasks in R
2. Produce general summary statistics in R

###Readings:
* IOS Chapter 1: Introduction to data
* IOS Chapter 2: Probability
* IOS Chapter 3: Distributions of random variables
* [R for data science](http://www.sharpsightlabs.com/learn-r-data-science/)
* [R for bioinformatics](http://www.nature.com/news/programming-tools-adventures-with-r-1.16609)

Additional materials for reference:
* Software Carpentry, [Analyzing patient data](http://software-carpentry.org/v5/novice/r/01-starting-with-data.html)
* Data Carpentry also has [several lessons in R](https://github.com/datacarpentry/datacarpentry/tree/master/lessons/R)

###Activities

**Orientation to RStudio and setting up files**

RStudio has different windows to allow quick movement between different tasks

R scripts end in `.R`, just like Unix scripts end in `.sh`.

Comments in R are indicated using `#`, just like with Unix commands.

Command prompt

File->New project->New directory->Empty project (name project, store on Desktop)

Create project

Files->New folder, name data

File->New file->R script

**Loading data**

`setwd("XXX")`

basic arithmetic

creating new variables using `<-`

arithmetic with variables

assigning new value to variable

Read data from file and save to variable:

`dat<-read.csv(file = "XXX", header = FALSE)`

Viewing `dat`: (also, viewing in different windows in RStudio)

head(dat)

What is dat:

class(dat)

Shape of dat in (rows, columns):

dim(dat)

Obtaining single value from dat:

dat[1,1]

Obtaining range of values from dat (with slices). Do not need to start with 1:

dat[1:X, 1:X]

combining values that are non-contiguous:

dat[c(X, X, X, X), c(X, X, X)]

Can leave row or column blank to indicate all:

dat[5, ]

Extract one row:

first<-dat[1, ]

**Summary statistics**

Max for that row:

max(first)

You can also just call piece of dat:

max(dat[X, ])

Min for one column:

min(dat[, X])

Mean for one column:

mean(dat[, X])

Median:

median(dat[, X])

Standard deviation:

sd(dat{, X])

Use `apply` as a way to summarize across entire rows or columns.

averageRows <- apply(dat, 1, mean)
rowMeans

averageColumns <- apply(dat, 2, mean)
colMeans

**Making figures**

plot(averageColumns)

What other options are there for adding more information to this plot?

Use `?plot` to find the documentation for this command. You can also use the command `args(plot)` to find out what else you can 


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
