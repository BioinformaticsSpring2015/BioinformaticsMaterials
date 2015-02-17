#Bioinformatics Week 5 Lab
##More R

Slides for the introduction to today's lab, as well as a PDF of this document, can be found on [Blackboard](http://blackboard.uttyler.edu).

###Learning Objectives
You should be able to:

1. create meaningful data visualizations in R using arguments in `plot` and `ggplot2`
2. save figures created in R to a file
3. 

###Readings:
* 

Additional materials for reference:
* 

###Activities

**Exporting figures from R**

```
pdf(file = "figure.pdf")
plot(XXX)
dev.off()
```

Other options, like ps.

**ggplot2**

The `plot` command has lots of options, but is limited to a few types of graphs. We're going to use another package, `ggplot2`, to try a few additional visualizations. This package has a [great website](http://docs.ggplot2.org/current/) with documentation for all commands. First, though, we need to install and load the package:

```
#install package
install.packages("ggplot2")
#load package
library(ggplot2)
```

**Raw**
http://app.raw.densitydesign.org

###Assignment
* Due Wednesday, Feb X at 5 pm
* Assessment criteria
	* Technical content X, appropriate syntax for written assessment answers
	* Critical thinking X, explanations for written assessment answers
	* Documentation: X, citations for resources used in questions embedded in answers
	* Professional behavior: X, class participation, assignment formatting using homework template (including code formatted in `monospace`)
* Written assessment: 
	* create new file in your homework repository, `LastnameHomework`, called `LastnameWk6Homework.md". Title (header) is "Visualizations".
	* Answer the following questions about the Unix tools you learned for this week's lab, including code comments where appropriate 				
	* Use appropriate Markdown formatting, including `monospace` when referencing commands you entered. 
	* If you choose to copy and paste the questions before answering, it might help to copy from the Raw view. 
	* Don't forget to preview your homework before committing! 
	* If you get stuck on a question, please consult the textbook (see readings above).

1. 

How long did it take you to complete these questions?
Type SUBMIT as the answer to this question when you are ready for this assignment to be graded.
