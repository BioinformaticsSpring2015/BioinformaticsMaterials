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
* [Introduction to `ggplot2`](http://blog.echen.me/2012/01/17/quick-introduction-to-ggplot2/)

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

Last week, we learned how to build

plot arguments

```
pdf(file = "figure.pdf")
plot(XXX)
dev.off()
```

Other options, like ps.


The `plot` command has lots of options, but is limited to a few types of graphs. We're going to use another package, `ggplot2`, to try a few additional visualizations. This package has a [great website](http://docs.ggplot2.org/current/) with documentation for all commands. First, though, we need to install and load the package:

```
#install package
install.packages("ggplot2")
#load package
library(ggplot2)
```

*Scatterplots*

```
#plot iris data in ggplot2
qplot(Sepal.Length, Petal.Length, data = iris, color = Species, size = Petal.Width, alpha = I(0.5), 
	xlab = "Sepal Length", ylab = "Petal Length", 
	main = "Sepal Length vs. Petal Length")
```

*Line charts*

```
qplot(age, height, data = Loblolly, geom = "line",
    colour = Seed,
    main = "Loblolly height and age")
```

*Histograms*

*Barcharts*




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

1. Raw (what put where?)
2. 

How long did it take you to complete these questions?
Type SUBMIT as the answer to this question when you are ready for this assignment to be graded.
