#R commands: key points

* `# this is a comment in R`
* `setwd("../path/..")` change and set the working directory

**Working with objects**
* `x <- 3` assignment operator, assigns values on right (3) to objects on left (x)
* `head(data)`
* `class(data)`
* `dim(data)`
* `ls()` list objects in current environment
* `rm(x)` remove objects in current environment
* `rm(list = ls())` remove all objects in current environment
* `c(value1, value2, value3)` creates a vector

**Loading data**

**Summary statistics**

**Finding help**
* `?command` show documentation for specific command
* `args(command)`	show arguments available for specific command
* More options on finding help for R are on [Data Carpentry's materials](https://github.com/datacarpentry/datacarpentry/blob/master/lessons/R/00-before-we-start.Rmd)

**Using packages**
* `install.packages("package.name")` install packages if they are not already on computer
* `library("package.name")` load a package that is already installed on the computer
