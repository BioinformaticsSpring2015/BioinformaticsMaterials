#Bioinformatics Week 12 Lab
##Metagenomics

Slides for the introduction to today's lab, as well as a PDF of this document, can be found on [Blackboard](http://blackboard.uttyler.edu).

###Learning Objectives
You should be able to:

1. Apply a metagenomics pipeline to existing DNA sequence data
2. Interpret results from a metagenomic analysis

###Readings:
* This lab was based largely on [Kosakovsky Pond, et al. 2009 and supplemental materials](http://genome.cshlp.org/content/19/11/2144.long)

Additional materials for reference:
* [Galaxy](https://usegalaxy.org)

###Activities

**Load and filter data**

*Create new history* Navigate to the [Galaxy website](https://usegalaxy.org). Log in and click on the button that looks like an open book in the top right hand corner of the screen to view your histories. Create a new history called "metagenomics" and make sure it's your current history before navigating back to your work page (click "Analyze Data" at the top of the screen).

*Load data* Select "Data Libraries" in the "Shared Data" drop down menu at the top of the screen. Search for "windshield" and click on the result to view the data files. Click on the boxes next to "Trip A Left Side Reads" and "Trip A Left Side QV" and then hit Go to import these data to your current history. If you look back at your work space, the "reads" is the file containing the fasta sequences, while "QV" is a separate file containing quality scores. 

*Subsample data* These data files are too large for us to process during the lab period, so we're going to extract a portion to analyze. Under "Text manipulation," click the "Select first" tool. Enter "50000" to extract the first 50000 lines, and enter the read file as the dataset. Repeat this step for the quality file. You should end up with two new files; you may choose to rename them "Trip A 454 subsample reads" and "Trip A 454 subsample QV."

*Quality filter reads* Under "NGS: QC and manipulation," choose "Select high quality segments." Galaxy should autodetect and enter "454 reads" in the "Reads" field and "454 qualities" in the "Quality scores" field for you. Select a minimal quality score of 20 and minimal length of contiguous segment as 50. 454 should be pre-selected for you under "Select technology," and leave the default option for "DO NO trigger splitting." While this doesn't report exactly how many sequences were filtered out, the file size does decrease.

*Add sample label* Now we are going to perform some file manipulations to add the sample label, indicating Trip A, to our data file. Go to "FASTA to Tabular" under "Convert formats" to convert to a tab-delimited file format, leaving the number of columns as 1. Then, under "Text Manipulation," select "Add column". Enter "TripA" as the value and "YES" to iterate (the filtered dataset should be autodetected). Now that this information is added, we need to convert back to FASTA. Under "Convert Formats" select "Tabular-to-FASTA". The tab-delimited file should auto-detect as the column added file, and select title column as 3 and sequence column as 2.

**Sequence searching**

*Megablast* Under "NGS: Mapping" select "Megablast." Galaxy should autodetect the dataset output from tabular-to-FASTA conversion. Select "wgs" for "against target database," 28 as word size, 80 as report hit threshold, and 0.0001 as e-value cutoff. Perform another "Megablast" with the same parameters, except select "nt" as the target database.

*Manually upload Megablast results, if jobs take too long* Running megablast is a big job, so we're going to take a shortcut and upload example results files (which should be identical to the results your jobs will get after they run). Download megablast.zip from the [GitHub BioinformaticsSpring2015/data folder](https://github.com/BioinformaticsSpring2015/BioinformaticsMaterials/tree/master/data). Unzip the file. Go back to Galaxy and select "Upload File" under the "Get Data" section in the lefthand toolbar. Drag the files to the window and click "Start" to upload these files. The files will appear in the righthand toolbar. When they turn green (meaning loaded and available), preview the data in one of the files. What data is included in each column?

*Concatenate megablast searches and filter by sequence length* Under "Text Manipulation," select "Concatenate datasets" to combine the results from the two megablast searches. Next, create a new tabular dataset including the length of each sequence by going to "FASTA manipulation" and running "Compute sequence length" on the tabular-to-fasta converted data. Add the sequence length to the megablast results by going to the "Join, Subtract, and Group" category and selecting "Join two Datasets." Join your concatenated megablast results with the computed sequence lengths on column 1 (unique names for each sequence). Finally, under "Filter and sort," select "Filter." The megablast results with sequence lengths should be autodetected as the file to filter. Use the following condition to filter: "c5/c15 < 0.5". This filter removes megablast hits that cover less than 50% of the sequence read. What data columns are included in this filter?

**Metagenomic analysis**

The rest of our analyses will use commands under the "Metagenomics analysis" section of the tools sidebar.

First, select "Fetch taxonomic representation." Input your filtered data file (should autodetect). Select 2 for the GIs column, and 1 for Name column. What does this command do?

Next, select "Find lowest diagnostic rank" and input your taxonomic data file (from last step, should autodetect). Require the lowest rank to be at least Subkingdom. This command reconciles differing blast results to the most specific identification possible.

Then select "Summarize taxonomy" to count the sequences from each taxnomic group in your results. Finally, select "Summarize phylogeny" on the summarized taxonomy file, showing ranks from root to Class. How do you interpret these results?

###Assignment
* Due Wednesday, April 15 at 5 pm
* Assessment criteria
	* Technical content: 40, appropriate syntax for written assessment answers
	* Critical thinking: 40, explanations for written assessment answers
	* Documentation: 10, code comments, citations for resources used in questions embedded in answers
	* Professional behavior: 10, class participation, assignment formatting using homework template (including code formatted in `monospace`)
* Written assessment: 
	* create new file in your homework repository, `LastnameHomework`, called `LastnameWk10Homework.md". Title (header) is "Metagenomics".
	* Answer the following questions about the tools you learned for this week's lab, including code comments where appropriate 				
	* Use appropriate Markdown formatting, including `monospace` when referencing commands you entered. 
	* If you choose to copy and paste the questions before answering, it might help to copy from the Raw view. 
	* Don't forget to preview your homework before committing! 
	* If you get stuck on a question, please consult readings above.
	
1. At the beginning of this exercise, we used the "Select first" tool to extract a subset of our data. What Unix command could you have used to accomplish this task, had you been on the command line?
2. Why did we add "TripA" to the sequence IDs?
3. What does megablast do? Why did we use it for this lab?
4. Why did we calculate sequence length and add it to the megablast results?
5. How would you expect your final results to differ if you do not filter the megablast results by sequence length? Now re-run the last few steps on the unfiltered dataset. Was your hypothesis supported?
6. How long did it take you to complete these questions?
7. Type SUBMIT as the answer to this question when you are ready for this assignment to be graded.
