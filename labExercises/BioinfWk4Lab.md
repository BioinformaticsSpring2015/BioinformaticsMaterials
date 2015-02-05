#Bioinformatics Week 4 Lab
##Variation in Data using R

Slides for the introduction to today's lab, as well as a PDF of this document, can be found on [Blackboard](http://blackboard.uttyler.edu).

###Learning Objectives
You should be able to:

1. Perform basic data manipulation tasks in R
2. Produce general summary statistics in R

###Readings:
* OIS Chapter 1: Introduction to data
* OIS Chapter 2: Probability
* OIS Chapter 3: Distributions of random variables
* [R for data science](http://www.sharpsightlabs.com/learn-r-data-science/)
* [R for bioinformatics](http://www.nature.com/news/programming-tools-adventures-with-r-1.16609)

Additional materials for reference:
* Software Carpentry, [Analyzing patient data](http://software-carpentry.org/v5/novice/r/01-starting-with-data.html)
* Data Carpentry also has [several lessons in R](https://github.com/datacarpentry/datacarpentry/tree/master/lessons/R)

###Activities

**Orientation to RStudio and setting up a project**

This lab uses RStudio to write scripts, manage files, and run commands. There is an additional R application on the lab computers, but it is a bare-bones version and a bit more difficult to manage, so make sure you're in the correct program!

Open up RStudio. The window you see to the left is your console, where you enter commands to run. You can perform basic arithmetic in R. The spaces before and after the plus sign represent appropriate formatting for scripts, as it makes commands more readable:

`5 + 5`

The answer should be printed to your screen:

`[1] 10`

R adds numbers in brackets to indicate the position of values in a vector or matrix (we can ignore them for now). Try a few more simple math problems on your own.

You can move to different directories similarly to the Unix `cd` command:

`setwd("../")`

You should have moved up one level in the computer's file hierarchy. You might've noticed that RStudio automatically adds the closing quotation mark required to specify the path, as well as the closing parentheses.

The command prompt in R is `>`, which should appear at the beginning of every line that is ready to accept a new command. If you see a plus sign `+`, R is expecting you to complete a command. It's probably because you forgot to close your parentheses. If entering `)` doesn't work, you can try hitting `esc` on your keyboard (although sometimes RStudio crashes).

One of the benefits of working in RStudio is that you can create projects that will help keep your files and preferences organized and consistent between work sessions. To create a project got to File->New Project, choose New directory, then Empty Project. Name your new directory `BoinformaticsR` and select the Desktop for its placement. This is your working directory today with path `~/BioinformaticsR`). Click Create Project and you'll see `BioinformaticsR.Rproj` listed in the lower right window. By default, RStudio will automatically create a file named `.Rhistory` to save all commands you enter (think of this as a backup).

Go to the upper left of the screen and select File->New File->R script; you'll see it appear in a new window in the upper left side of the program. Save it and name it `myscript.R`. R scripts end in `.R`, just like Unix scripts end in `.sh`.

RStudio has different windows to allow quick movement between different tasks. This integrated interface is set up to help streamline the process of creating managing, and documenting scripts. The top left window is the script file you just created; it is a text editor for you to save commands and comments. The window in the lower left is the console, which is where commands are actually run. The upper right screen includes Environments, which represents both commands and data objects you've entered in the console. The lower right hand window includes several functions, including file management, visualizing plots, installing packages, and help documentation.

**Working with data**

So far, we've been working in the Console to execute commands directly. The really cool part of RStudio is that you can easily save all of the commands you enter in scripts (top left window). We're going to practice entering commands in the source file with comments that explain what the command does.

The simplest way to add data to R is by assigning a value to an object. Enter the following command in the source window (upper left):

```
#assign value to object
mass <- 50.5
```

After entering the command, hit `Ctrl+Enter` and you'll see the command execute in the Console below. If you try to execute the commented line (starting with `#`), the line will appear in the Console but nothing will happen. Remember to regularly save the source file as you're working.

In this case, `mass` is a variable for which you've specified a particular number. `<-` is called an assignment operator. It assigns values on the right to objects on the left. Think of it as an arrow pointing from the value to the object. You can confirm the value has been assigned by typing `mass`.

You can perform arithmetic with these variables. For example, if the original value was in grams, you can convert to kilograms:

```
#arithmetic with variables
kg <- mass * 1000
```

This retains the value associated with `mass` while specifying a new variable, `kg`. Type `kg` to ensure the value has been saved.

You can change the initial assignment of a variable:

```
#replacing value for variable
mass <- 25.5
```

But if you recheck `kg`, you'll see it's not been automatically updated. You can recall old commands in R by using the up arrow and re-run the conversion from grams to kilograms.

You may have noticed that `mass` and `kg` have also appeared in the Environment window. This is because R is now storing them as variables for you to recall. You can also view these variables in the Console window:

```
#show objects in environment
ls()
```

Because this is a command that acts on the entire environment, there is nothing in the parentheses (but they still have to be there!).

While it is possibly to enter data manually, there are several datasets pre-loaded in R. We're going to use one of them to learn about working with larger data structures. You can view the data in the console by entering and executing the following command in the source file:

```
#view data for preloaded dataset
trees
```

You can see this dataset includes three columns. If you want to know more about these pre-loaded data, or about any other command in R:

```
#display documentation for "trees"
?trees
```

In RStudio, the documentation will appear in the lower right screen. You can also search in this window instead of in the console.

View the first few lines of the data file:

```
#display a few lines of "trees"
head(trees)
```

View the data structure:

```
#show data structure for "trees"
class(trees)
```

The result, `data.frame`, is a fundamental data structure used by R. It defines relationships between variables. In this case, rows are individual trees sampled and each column is a piece of data about that tree. 

View the shape of these data (dimension). The output is given in rows and columns:

```
#show number of rows and columns in "trees"
dim(trees)
```

Extract a single variable from this dataset, corresponding to the cell in the first row and first column:

```
#show value from first row and first column
trees[1, 1]
```

Extract a range of values (referred to as a "slice"):

```
#extract slice of "trees"; rows 2-6 and columns 1-2
trees[2:6, 1:2]
```

Combine values that are non-contiguous:

```
#extract rows 2, 7, 10, 21 for columns 1 and 3
trees[c(2, 7, 10, 21), c(1, 3)]
```

Leave row or column value blank to indicate the entire row or column:

```
#extract row 5
trees[5, ]
```

Extract one column and assign to new object:

```
#assign column one to "girth"
girth<-trees[ ,1]
```

Go ahead and save your source file. You now have your own file that includes all commands and comments that indicate what they do. This method of saving your commands in the source file and executing them using `Ctrl+Enter` is a great way to keep track of your work. The alternative is testing commands in the Console and then copying and pasting them to the source file, which can introduce error (and is even more tedious). There are additional [keyboard shortcuts for working in RStudio](https://support.rstudio.com/hc/en-us/articles/200711853-Keyboard-Shortcuts) that may be of interest to you as your skills develop.

**Summary statistics**

Now that you know how to extract parts of a dataset, we're ready to start summarizing these data.

The commands to find general summary statistics for data are fairly intuitive:

```
#show maximum value for object
max(girth)
#show minimum value for object
min(girth)
#show mean value for object
mean(girth)
#show median value for object
median(girth)
#show standard devation of object
sd(girth)
```

If you wanted to apply these same statistics to another column of your data, like Height, you don't actually need to assign it to an object first. There are a few ways to accomplish this task:

```
#find mean for subset of "trees"
mean(trees[ ,2])
```

In this case, we're doing two things at once: extracting a portion of the dataset and then calculating the mean. However, we have headers for these data, so we can use those:

```
#find mean for subset of "trees"
mean(trees$Height)
```

Here, we've used a special type of notation in R that refers to particular columns in a data frame (`$`). Remember that R is case sensitive! 

If we were interested in obtaining the means for each column in the dataset, we can execute the same command across multiple parts of the data:

```
#find mean for each column
averageColumns <- apply(trees, 2, mean)
#dislay averageColumns
averageColumns
```

The command here, `apply`, is a bit more complicated that previous commands. There are three things specified in parentheses. The first is the dataset we're targeting. The second references which margin of the dataset we're targeting (1 means row, 2 means column). Finally, `mean` is the function, or what action we want applied to the specified data. Finally, the answer is being assigned to the variable `averageColumns`. Please note that this will not work if you have categorical values or missing data in your data frame.

Note that we could also apply the same function to rows using `apply(trees, 2, mean)`, but it doesn't make much sense given the data in this frame.

So far, we've been working with numerical data. Data frames in R can include multiple types of data, however:

```
#print the first few lines of "iris"
head(iris)
#count the instances of each species
table(iris$Species)
```

The pre-loaded dataset `iris` contains both continuous and categorical variables. The `table` command counts the number of rows for the each category of the continuous variable. Are these results accurate? Use `?iris` to view the metadata for this dataset.

You should now have a number of values listed in the environment window (upper right side). You might be interested in removing one of these variables (for example, if you accidentally misspell something):

```
#remove variable from environment
rm(averageColumns)
```

Note that this doesn't delete a file, it simple removes it as an identified object (and you still have the code saved in your source file to recreate it!). You can also remove all variables in the environment at once:

```
#remove all objects from current environment
rm(list = ls())
```

Now the environment is clear and you're ready to begin working on a new problem.

**Entering and analyzing data from a file**

So far, we've manually entered data in R and used some pre-loaded datasets. These options are quite limited, though, so now we're going to load some of our own data from a file. Go to the [OpenIntroStats website](https://www.openintro.org/stat/textbook.php), click on "Data sets + R packages" and download the zip file (first in the list). Unzip the file and move it to your `BioinformaticsR` folder. It's generally good practice to leave your original data files in a folder, separate from scripts and saved output. For our purposes, the `openintroData` folder you've just added will serve as our data folder. 

You can use R to view files in a directory, in a similar style to Unix. Again, this is a command referencing the environment, so you don't need to add anything inside the parentheses:

```
#show files in directory
dir()
```

This is different than the `ls()` command we learned earlier, in the sense that `ls()` shows variables *entered into R* while `dir()` shows *files in a folder.*

Let's practice loading one of these files into R. First, we need to find out the character delimiter and whether there is a header. You can use the "Files" tab in the lower left window to navigate to the openintroData folder. Double click on `maleHeights.txt` and it will open in the upper left window. Indeed, there is a header, and only one column of data (no delimiters).

```
#read data from file and save to variable
heights <- read.csv(file = "openintroData/maleHeights.txt", header = TRUE)
#print the first few lines of heights
head(heights)
```

This command, `read.csv`, is used to load comma-delimited files. There are two arguments inside the parentheses, and `=` is used to to specify options. Note that the name of the file is in quotation marks, and includes the directory in which it resides (because our working directory is `BioinformaticsR`). 

Go back to the file window (lower right side) and click on `possum.txt`. These data are a bit more complicated, because there are multiple rows, so a different command is required to open it:

```
#read data from tab-delimited file and save to variable
possumDat <- read.delim(file = "openintroData/possum.txt", header = TRUE)
#print the first few lines of possum
head(possumDat)
```

This command is used because the file is tab-delimited. If you enter `?read.delim` or `?read.csv`, you'll see several options for commands to load various types of data tables. You can also use the command `args(read.csv)` to print a short list of specifications for this command.

You may wonder why we've named the variable `possumDat`. This is to more clearly differentiate it from the original file, `possum.txt`. It's also because the authors of OIS have developed a package in R that contains many of their example datasets (including `possum`) pre-loaded. To access the pre-loaded data, however, we need to install the package:

```
#install a package
install.packages("openintro")
#load package
library(openintro)
```

Installing the package downloads the program to your computer, and `library` loads it into your environment. We'll be installing a number of other packages throughout the semester using this method. Remember that you'll have to re-install required packages at the beginning of each lab session because the computers are wiped clean each time you log off.

The `openintro` package includes a copy of the same possum data pre-loaded. You can compare the pre-loaded data with the data you just loaded from a text file to confirm your `read.delim` command worked appropriately:

```
#show a few lines of manually loaded "possumDat"
head(possumDat)
#load "possum"
data(possum)
#show a few lines of pre-loaded "possum"
head(possum)
```

It's very important to recognize how data in files relate to variables in R! RStudio has several tools in place to help you with this task, including the Environment window (upper right). If you click on a data file in this window, you can view data about it and even preview it in the source window (upper left). You may also notice that there are buttons you can click on to enter data. We're interested in reproducibility and scripting all our commands, so we're avoiding point-and-click methods.

**Visualizing data and distributions**

We're going to use some additional pre-loaded datasets to visualize summary statistics. First, we can make a bar plot for the categorical variables in the `iris` dataset:

```
#bar plot showing number of data points for each species
barplot(table(iris$Species))
```

The plot will show up in the lower left window of RStudio. You should see the data displayed as summarized by the `table(iris$Species)` results we obtained earlier.

We can also view histograms for continuous variables:

```
#checking data structure for "rivers"
head(rivers)
#histogram for lengths of rivers
hist(rivers)
```

Why did we not have to specify a variable for the `hist` command, like we did for `barplot` above?

We can also compare variables to each other using scatterplots:

```
#compare sepal length and petal length
plot(iris$Sepal.Length, iris$Petal.Length, main = "Sepal vs Petal Lengths")
#add linear best fit line
abline(lm(iris$Petal.Length~iris$Sepal.Length))
```

For `plot`, the first two options after the command are required: the x-axis (independent) variable (`iris$Sepal.Length`) and the y-axis (dependent) variable (`iris$Petal.Length`). For such plots, you can say y is a function of x; remember that switching these variables changes how you interpret the relationship! Other options for the command (like `main`, which describes the title of the plot) are optional. 

The second command is also fairly complicated. The first part of it, `abline`, simply adds a straight line to the plot. The second part, `lm`, is a command to fit a linear model in the form of `y~x`. By adding our variables in place of x and y, and locating the model as an argument to `abline`, R knows to fit the line to the data we already have displayed.

You can modify the plot in other ways, such as by changing display colors:

```
#add dataset to R search path
attach(iris)
#compare sepal length and petal length
plot(Sepal.Length, Petal.Length, main = "Sepal vs Petal Lengths")
#add red linear best fit line
abline(lm(Petal.Length~Sepal.Length), col = "red")
```

You should see the best fit line change to red. Use `?plot` to find the documentation for this command. The other difference between this visualization and the previous is that we've used `attach` as a shortcut. If you'll be working with the same dataset for awhile, this command can save you time by not making you specify the dataset each time you reference a variable.

If you make a mistake want to clear the display, you can use the "Clear all" button in the plot window, or simply run another `plot` command.

**Saving your work**

When you are done working for the day, do not forget to save `myscript.R` and back up your entire `BioinformaticsR` directory on your flash drive before logging off the computer! If you would like to come back later and start working, you should open RStudio, go to Open Project, and select `BioinformaticsR.Rproj`. This will reset everything in RStudio, including your working directory, to where you were last time you saved it.

###Practice exercises (not part of your assignment, just for practice)

1. What are the means and standard deviations for each of the numerical variables in `possum`?
2. Make a bar plot showing the number of samples of each sex (male and female) for `possum`.
3. Compare the histograms for each numerical variable in `possum`. Which appears the most skewed?
4. What output do you obtain from `plot(possum)`? Why does the output look like this?
5. Plot the tail length (independent variable) of `possum` to the total length with plot points shown in red. How would you describe the relationship between these variables? Where does the best fit line intersect the y axis?

###Assignment
* Due Wednesday, Feb 11 at 5 pm
* Assessment criteria
	* Technical content 40, appropriate syntax for written assessment answers
	* Critical thinking 30, explanations for written assessment answers
	* Documentation: 20, citations for resources used in questions embedded in answers, code comments included
	* Professional behavior: 10, class participation, assignment formatting using homework template (including code formatted in `monospace`)
* Written assessment: 
	* create new file in your homework repository, `LastnameHomework`, called `LastnameWk4Homework.md`. Title (header) is "Variation in data using R." 
	* Answer the following questions about the R tools you learned for the lab this week, including code comments where appropriate 				
	* Use appropriate Markdown formatting, including `monospace` when referencing commands you entered. 
	* If you choose to copy and paste the questions before answering, it might help to copy from the Raw view. 
	* Do not forget to preview your homework before committing! 
	* If you get stuck on a question, please consult the textbook (see readings above).

**Most data referenced below are available pre-loaded in the `openintro` package. Make sure you have this package installed and loaded.**

1. List three commands that perform similar functions in R and Unix. Describe the syntax and functionality in both R and Unix.
2. How many columns and rows are in `mammals`? Include the code and comments you used to determine your answer.
3. Assuming the weights in `chickwts` are in grams, how would you convert them to kilograms? Include your code with comments.
4. Compare the data structures for `rivers` and `trees`. What is the difference, and why? Include the code and comments you used to determine your answer.
5. Which species in `iris` has the widest petals on average? Include the code and comments you used to determine your answer.
6. Make a bar plot displaying the number of chickens for each feed type in `chickwts`. The x-axis doesn't display properly with default options (we'll learn how to fix this in a few weeks). How can you find out what the feed types are supposed to be? Include the code and comments you used to determine your answer.
7. Make a histogram showing weights in `chickwts`. How would you describe this distribution? Include the code and comments you used to determine your answer.
8. Examine the histograms for each of the three variables in `trees`. Which appears the most normally distributed? Include the code and comments you used to determine your answer.
9. Plot `Volume` as a function of `Girth` for the dataset `trees`. Fit a linear best fit model and display the line in blue. Where does the best fit line cross the x-axis? Include the code and comments you used to determine your answer.
10. Plot `LifeSpan` as a function of `BodyWt` for the dataset `mammals`. Fit a linear best fit line. Explain why this model may not be the optimal way of characterizing these data. Include the code and comments you used to determine your answer.
11. How long did it take you to complete these questions?
12. Type SUBMIT as the answer to this question when you are ready for this assignment to be graded.
