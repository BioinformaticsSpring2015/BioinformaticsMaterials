#Bioinformatics Week 5 Lab
##Visualization

Slides for the introduction to today's lab, as well as a PDF of this document, can be found on [Blackboard](http://blackboard.uttyler.edu).

###Learning Objectives
You should be able to:

1. test data visualizations using the RAW interactive web interface
2. create meaningful data visualizations in R using arguments in `plot` and `ggplot2`

###Readings:
* PCB Chapter 17: Graphical Concepts

Additional materials for reference:
* [Introduction to `ggplot2`](http://blog.echen.me/2012/01/17/quick-introduction-to-ggplot2/)
* [Graphical parameters in R](http://www.statmethods.net/advgraphs/parameters.html)
* [RAW website](http://app.raw.densitydesign.org)
* [ggplot2 website](http://docs.ggplot2.org/current/)
* [Gallery of `ggplot2` graphics](http://shinyapps.stat.ubc.ca/r-graph-catalog/#)

###Activities

**RAW**

Most of lab this semester has been focused on creating reproducible results using code. On occassion, though, it can be useful to have an interactive environment to explore data analysis. Today we're going to use a web interface, [RAW](http://app.raw.densitydesign.org), to explore data visualization. As the [program's creators note](http://www.densitydesign.org/2013/10/raw-the-missing-link-between-spreadsheets-and-vector-graphics/)
"...as the name suggests it is a sketch tool, useful for quick and preliminary data explorations as well as for generating editable visualizations."

*Movies*

Navigate to the [RAW website](http://app.raw.densitydesign.org) in a browser (on lab computers, Chrome works best). We're going to use one of the pre-loaded example datasets, so click on the drop-down menu and select "Movies (dispersions)." The data will appear in the field below. Click on the table button in the upper right corner to see the fields formatted for humans to read. What do these data appear to show?

If you scroll down further on the screen, you'll see a number of available options for chart types. Clicking on any of these types will show a description to the left, including what data and relationships the chart represents. 

Select "Scatter Plot". Scroll down to "Map your dimensions". You may notice that each column of data now has a green box, and also a label defining it as string or number. Drag and drop each variable to the following boxes to the right:
* X AXIS: Production Budget
* Y AXIS: Rating IMDB
* SIZE: Total Domestic Box Office
* COLOR: Genre
* LABEL: Movie

Each white box tells you what type of data can be entered there. If you enter the wrong type of data in a box, it will turn yellow to warn you (although sometimes you can still see the resulting visualization!). 

Scroll down a bit further and you'll see your resulting visualization. You can modify this default visualization by changing the dimensions, colors, etc. in the provided fields. You can export your visualization by selecting your desired file type, entering a file name, and clicking "download." If you forget how to use this interface, there's a [short video tutorial](http://raw.densitydesign.org/how-it-works/) for the example listed above to remind you. 

*Cocktails*

Let's try another example. Scroll back up to the top and select the pre-loaded data "Cocktails (correlations)." Select "Circle Packing" for the chart type and enter the following data in the appropriate boxes:
* HIERARCHY: Cocktail, ingredient
* SIZE: Parts
* COLOR: Cocktail

There are a few ways this example differs from the "Movies" visualization. First, the manner in which data are related is different (because of the different chart types). Second, one variable (Cocktail) is used in two different fields (Hierarchy and Color). Finally, one field (Hierarchy) has two variables listed. The order they appear is also important! What happens if you change this order? 

*Music*

In our last example with RAW, we'll be working with "Music (flows)." Select "Streamgraph" as the data type. You should be able to enter the variables in the appropriate fields by process of elimination. What does this visualization show?

Can you visualize any of these datasets using other chart types? This is a great tool for working with data in different ways to easily see how different methods of display will affect the message you are communicating. 

**Refining figures in R**

In week 4, we learned how to build basic figures in R using the commands `plot`, `hist`, and `barplot`. Let's explore the arguments for these commands.

Recall our old code for creating a scatterplot comparing sepal and petal lengths in R:

```
#scatterplot of sepal and petal lengths from iris
plot(iris$Sepal.Length, iris$Petal.Length, main = "Sepal vs Petal Lengths")
#add best fit line
abline(lm(iris$Petal.Length ~ iris$Sepal.Length))
```

There are other options we can add to make this visualization more effective, including commands that print the specified graphics to file (rather than just visualizing in the RStudio window):

```
#begin plotting graphics to file (pdf)
pdf(file = "figure.pdf")
#scatterplot of sepal and petal lengths from iris
plot(iris$Sepal.Length, iris$Petal.Length, pch = 19,
	main = "Sepal vs Petal Lengths",
	xlab = "Sepal Length", ylab = "Petal Length")
#end plotting graphics to file
dev.off()
```

The first and last lines of this code (`pdf()` and `dev.off()`) are the commands that save your plot to the file. Note that these commands save graphics created by other commands. You can also save graphics in additional file formats, like PostScript (`ps()`). The additional options for `plot` above create solid points on the plot (`pch`) and label the axes (`xlab` and `ylab`). You can read more about graphical parameters in R [here](http://www.statmethods.net/advgraphs/parameters.html).

*Loading ggplot2*

Although `plot` additional options, it is limited to a few types of graphs and it takes a lot of coding to create some effects (like color coding plot points for particular categorical factors). We're going to use another package, `ggplot2`, to try a few additional visualizations. This package has a [great website](http://docs.ggplot2.org/current/) with documentation for all commands. First, though, we need to install and load the package:

```
#install package
install.packages("ggplot2")
#load package
library(ggplot2)
```

*Scatterplots*

`ggplot2` includes options to create the same types of diagrams we've already created, but with expanded options that make data manipulation much easier. First, we can create the same type of scatterplot, but with improved default formatting:

```
#scatterplot of iris data in ggplot2
qplot(Sepal.Length, Petal.Length, data = iris, color = Species, size = Petal.Width, alpha = I(0.5), 
	xlab = "Sepal Length", ylab = "Petal Length", 
	main = "Sepal Length vs. Petal Length")
```

`qplot` (quick plot) references the scatterplot command from `ggplot2`. The x and y variables are designated (`Sepal.Length` and `Petal.Length`, respectively), followed by the dataset from which they are derived (`iris`). The `color` option specifies that points are color coded by the categorical variable `Species`; `size` is an option that changes the relative size of each point according to `Petal.Width`. Finally, `alpha` is an option that makes points transparent (by half, or 0.5 as specified here) so that overlapping points are more apparent.

You can also add best fit lines with confidence intervals for each of the categorical variables:

```
#scatterplot of iris data in ggplot2
qplot(Sepal.Length, Petal.Length, data = iris, color = Species, size = Petal.Width, alpha = I(0.5), 
	geom = c("point", "smooth"), method = "lm", formula = y~x, 
	xlab = "Sepal Length", ylab = "Petal Length", 
	main = "Sepal Length vs. Petal Length")
```

The default value for the `geom` argument is to show points. Because we want both points and lines, we need to specify both values in a vector (using `c( )`). The options `method` and `formula` both describe how we want the line to be drawn (and should be intuitive give your understanding of the `abline` options for `plot` we've already discussed).


*Line charts*

We're going to use a new dataset to display additional options for line charts in `ggplot2`. The command is the same as a scatterplot, but you need to specify a different option (`geom = "line"`) to plot lines:

```
#view data from Loblolly
head(Loblolly)
#line chart of Loblolly data in ggplot2
qplot(age, height, data = Loblolly, geom = "line",
    color = Seed,
    main = "Loblolly height by age") + theme_bw()
```

The addition command at the end (`+ theme_bw()`) changes the background from the default gray to white; there are other options to change parts of this display (documentation can be found under ggtheme).

*Barcharts*

We've worked with the dataset `chickwts` already, but `ggplot2` makes it even easier to visualize the variation among categorical variables:

```
#barchart for number of chickens per feed type in ggplot2
qplot(feed, data = chickwts, geom = "bar")

#barchart for weight of chickens per feed type in ggplot2
qplot(feed, data = chickwts, weight = weight, geom = "bar")
```

The option `geom = "bar"` shows the number of chickens for each feed type, because the default bar chart for this command is to report the frequency of counts for the specified variable. The second command shows a different chart, the total weight of chickens for each feed type (`weight = weight`).

*Histograms and comparing distributions*

Plotting histograms is straightforward, with syntax following the commands described above:

```
#plot histogram for sepal lengths in iris
qplot(Sepal.Length, data = iris)
```

We may be interested in comparing distributions between datasets. There are multiple ways to compare distributions:

```
#boxplots to compare sepqal length in different iris species 
qplot(Species, Sepal.Length, data = iris, geom = "boxplot", fill = Species)
#kernel density plot for iris sepal length by species
qplot(Sepal.Length, data = iris, geom = "density", fill = Species, alpha=I(0.5))
```

Today we've only used a single command from `ggplot2`. There are many other commands in this package that allow data parsing and visualization, but require quite a bit more manipulation. The command we've used here, `qplot`, is a shortcut for making nice visualizations when data are appropriately structured.

###Assignment
* Due Wednesday, Feb 25 at 5 pm
* Assessment criteria
	* Technical content: 60, appropriate syntax for written assessment answers
	* Critical thinking: 20, explanations for written assessment answers
	* Documentation: 10, code comments, citations for resources used in questions embedded in answers
	* Professional behavior: 10, class participation, assignment formatting using homework template (including code formatted in `monospace`)
* Written assessment: 
	* create new file in your homework repository, `LastnameHomework`, called `LastnameWk6Homework.md". Title (header) is "Visualization".
	* Answer the following questions about the Unix tools you learned for this week's lab, including code comments where appropriate 				
	* Use appropriate Markdown formatting, including `monospace` when referencing commands you entered. 
	* If you choose to copy and paste the questions before answering, it might help to copy from the Raw view. 
	* Don't forget to preview your homework before committing! 
	* If you get stuck on a question, please consult the textbook (see readings above).

1. Raw (what put where?)
2. scatterplot with points in green, relative sizes
3. `Orange` dataset to plot a line chart of circumference by age, color coding each line by the tree number
4. histogram
5. bar chart
6. choose appropriate visualization for given dataset

How long did it take you to complete these questions?
Type SUBMIT as the answer to this question when you are ready for this assignment to be graded.
