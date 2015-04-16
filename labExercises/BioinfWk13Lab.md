#Bioinformatics Week 13 Lab
##Metagenomics hypothesis testing

Slides for the introduction to today's lab, as well as a PDF of this document, can be found on [Blackboard](http://blackboard.uttyler.edu).

###Learning Objectives
You should be able to:

1. Reformat and parse data files to the format needed for input to subsequent steps in analysis
2. Compare results from metagenomics analyses using hypothesis testing

###Readings:
* This lab was based largely on [Kosakovsky Pond, et al. 2009 and supplemental materials](http://genome.cshlp.org/content/19/11/2144.long)

Additional materials for reference:
* [Galaxy](https://usegalaxy.org)

###Activities

**Planning sample comparisons**

Last week, we performed a series of analysis to determine the taxonomic composition (richness and abundance) in a metagenomic sample. This week we will have two goals: first, we'll determine whether different filtering parameters substantially alter our taxonomic composition, and second, determine whether there are differences between the samples.

Take a look at the files you created as a part of our workflow last week. Which file(s) contains the data on taxonomic abundance? 

Now take a look at the "Poisson two sample test" under the "Metagenomics analyses" category. What type of data file is required to input?

Compare the necessary input data for the two-sample test to the data files you currently possess. What do you need to do to reformat these data? What tools in Galaxy should you use?

You should have some ideas about how you can reformat your data to input into the statistical test provided. Now we're ready to start working with data!

**Load data**

We learned last week that it takes a long time (generally overnight) for the megablast results to process, so we're going to start with the concatenated megablast results that have been joined with the sequence length field. 

Create a new history in Galaxy and name it something like "windshield hypothesis testing."

Go to the [class repository data folder](https://github.com/BioinformaticsSpring2015/BioinformaticsMaterials/tree/master/data). Download and unzip week13.zip. This folder contains four files: TripA and TripB, each with left and right side (of the fender). Upload each of the four data files individually (not as a zipped file). The TripALeftSide file should be identical or similar to the file you created last week, but it's included here to make file management easier. These files should be visible in the right-hand toolbar.

**Filter data**

The files you've uploaded have been processed in the same manner as [last week](https://github.com/BioinformaticsSpring2015/BioinformaticsMaterials/blob/master/labExercises/BioinfWk12Lab.md), up until the last step before "Metagenomic analysis." Here is a brief overview of the remaining steps, as we performed them last week:

1. "Filter and Sort" then "Filter" on your joined megablast results using the filter "c5/c15<0.5"
2. "Metagenomics analyses" then "Fetch taxonomic representation" on your filtered data file, with GIs in column 2 and name in column 1
3. "Metagenomics analyses" then "Find lowest diagnostic rank" on your fetched taxonomic representation file and require the lowest rank to be at least "Subkingdom"
4. "Metagenomics analyses" then "Summarize taxonomy" on your fetched taxonomc representation file
5. "Metagenomics analyses" then "Draw phylogeny" on your lowest diagnostic rank file

You should perform all of these steps on each of your four files. Your instructor may also assign you comparisons to perform. You may find it helpful to use the "pencil" button to rename each file to keep your samples straight.

Visually inspect the results of each of your four samples. Which taxon is the most abundant?

**Compare parameters**

Now that you have your initial results, we can prepare our data files for input into the Poisson two-sample test. First, join your taxonomic results files for your two samples of interest by going to the "Join, Subtract, and Group" category and selecting the "Join two datasets" command, specifying field 2 for both files (this column indicates taxonomic identification). Change each option to keep all lines of input, and fill empty columns with 0. Examine the resulting file for the structure of data and names of columns.

Perform the statistical test by returning to the "Metagenomics analyses" section and selecting "Poisson two sample test." Enter your joined dataset file and select 3 for first column and 6 for second column (these correspond to the read counts for the first and second samples, respectively). Leave the D-value at 1 and correction method as Bonferroni.

Your resulting file will add columns to your taxonomic reads table. These new data include several different statistical measures, including p-values. We're most interested in the last column, which contains the most conservative estimates for p-value. To make these data more interpretable, go to "Filter and Sort" and choose the "Filter" command for the Poisson two sample test results, specifying `c12<0.05`. What does this filter do?

Inspect the results. How many phyla are significantly differentiated? Compare the number of differentiated phyla with other statistical comparisons you perform, and with those obtained by your classmates. Do these results match your expectations?

###Assignment
* Due Wednesday, April 22 at 5 pm
* Assessment criteria
	* Technical content: 40, appropriate syntax for written assessment answers
	* Critical thinking: 40, explanations for written assessment answers
	* Documentation: 10, code comments, citations for resources used in questions embedded in answers
	* Professional behavior: 10, class participation, assignment formatting using homework template (including code formatted in `monospace`)
* Written assessment: 
	* create new file in your homework repository, `LastnameHomework`, called `LastnameWk10Homework.md". Title (header) is "Metagenomics hypothesis testing".
	* Answer the following questions about the tools you learned for this week's lab, including references to specific Galaxy tools where appropriate
	* Use appropriate Markdown formatting 
	* If you choose to copy and paste the questions before answering, it might help to copy from the Raw view. 
	* Don't forget to preview your homework before committing! 
	* If you get stuck on a question, please consult readings above.

You should conduct two poisson two-sample tests to compare different aspects of the windsheild splatter data. One test should compare different samples (i.e., TripALeft vs TripARight), while one test should be methodological (i.e., TripALeftFiltered vs TripALeftUnfiltered). You may also report on findings from your classmates to improve your ability to summarize these data.

1. What is the most common taxon for each of your analyzed samples? Use the following table to report your results, adding as many columns as you need to report your results. The results we obtained last week as a class have already been completed.

Sample  | Most common taxon
------------- | -------------
TripALeft (filtered)  | Gammaproteobacteria
YOUR SAMPLE  | TAXON

2. Write a few sentences to describe the steps we used to reformat the data files to input into the Poisson two sample test command. Why were these steps necessary? Refer to specific commands and options in Galaxy in your answer.
3. Why did we perform a filtering step following the Poisson two sample test?
4. What were the results from your Poisson two sample tests? Fill in the following table with the specific comparison you performed and some basic information about the number of significantly differentiated taxa. Also write a sentence describing what you can conclude from these results.

Comparison  | Total number of significant taxa | Number of significant phyla
------------- | ------------- | -------------
TripXLeft filtered vs TripXRight filtered  | 1500 | 14
COMPARISON 2 | NUMBER | NUMBER

4. Give one example of a data processing step we performed today that you could have also accomplished using R or Unix commands. You do not need to include complete syntax, but please include the name of the command from both Galaxy and its equivalent in R or Unix.
5. How long did it take you to complete these questions?
6. Type SUBMIT as the answer to this question when you are ready for this assignment to be graded.
