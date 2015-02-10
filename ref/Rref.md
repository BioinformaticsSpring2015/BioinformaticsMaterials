#R commands: key points

* `# this is a comment in R`
* `setwd("../path/..")` change and set the working directory
* `dir()` shows files in directory (which may or not be loaded in R)
* R scripts end in `.R`
* You can perform basic arithmetic in R, including with objects

**Working with objects**
* `x <- 3` assignment operator, assigns values on right (3) to objects on left (x)
* `head(data)`
* `class(data)`
* `dim(data)`
* `ls()` list objects in current environment
* `rm(x)` remove objects in current environment
* `rm(list = ls())` remove all objects in current environment
* `c(value1, value2, value3)` creates a vector
* `data[X, Y]` extract variables from a dataset, where X is column and Y is a row (these can also be ranges of values separated by a colon, `:`)
* `data$variable` specifies a single variable (column) for a dataset 
* `apply(data, X, command)` apply command across either rows (X=1) or columns (X=2) for data
* `attach(data)` add dataset to path (so you don't have to type data$variable every time)

**Loading data**
* `read.csv(file = "filename.csv", header = TRUE)` read data from file with comma as delimiter when header is present
* `read.delim(file = "filename.csv", header = FALSE)` read data from file with tab as delimiter when header is absent
* `data(dataset)` to show pre-loaded data in environment

**Summary statistics**
* `max(data)` maximum value
* `min(data)` minimum value
* `mean(data)` mean 
* `median(data)` median 
* `sd(data)` standard deviation
* table(data$variable)` frequency table for categorical variable

**Plotting**
* `barplot(table(data$variable)` count frequencies and show bar plot for categorical variable
* `hist(data$variable)` histogram for numerical variable
* `plot(x, y)` scatterplot for two numerical variables
* `abline(lm(y~x))` linear best fit line

**Finding help**
* `?command` show documentation for specific command
* `args(command)`	show arguments available for specific command
* More options on finding help for R are on [Data Carpentry's materials](https://github.com/datacarpentry/datacarpentry/blob/master/lessons/R/00-before-we-start.Rmd)

**Using packages**
* `install.packages("package.name")` install packages if they are not already on computer
* `library("package.name")` load a package that is already installed on the computer
