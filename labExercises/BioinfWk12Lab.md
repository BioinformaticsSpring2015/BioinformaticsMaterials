#Bioinformatics Week 12 Lab
##Comparative genomics

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

Navigate to the [Galaxy website](https://usegalaxy.org). Log in and click on the button that looks like an open book in the top right hand corner of the screen to view your histories. Create a new history called "metagenomics" and make sure it's your current history before navigating back to your work page (click "Analyze Data" at the top of the screen).

Select "Data Libraries" in the "Shared Data" drop down menu at the top of the screen. Search for "windshield" and click on the result to view the data files. Click on the boxes next to "Trip A left Side Reads" and "Trip A Left Side QV" and then hit Go to import these data to your current history.

"454 reads" is the file containing the fasta sequences, while "454 qualities" is a separate file containing quality scores. 

Under "NGS: QC and manipulation," choose "Select high quality segments." Galaxy should autodetect and enter "454 reads" in the "Reads" field and "454 qualities" in the "Quality scores" field for you. Select a minimal quality score of 20 and minimal length of contiguous segment as 50. 454 should be pre-selected for you under "Select technology," and leave the default option for "DO NO trigger splitting." While this doesn't report exactly how many sequences were filtered out, the file size does decrease.

"FASTA to Tabular" under "NGS: QC and manipulation" to convert to a tab-delimited file format, leave number of columns as 1?

Under "Text Manipulation," select "Add column". "TripA" as value and "YES" to iterate, should autodetect dataset.

Under "Convert Formats" select "Tabular-to-FASTA", tab-delimited file should auto-detect as the column added file, title column is 3 and sequence column is 2.

**Sequence searching**

Under "NGS: Mapping" select "Megablast." Should autodetect dataset as output from tabular-to-FASTA. Select "wgs" for "against target database," 28 as word size, 80 as report hit threshold, and 0.0001 as e-value cutoff. What do the columns in the output file mean?

Perform another "Megablast" with the same parameters, except select "nt" as the target database.

Under "FASTA manipulation," select "Compute sequence length" on the tabular-to-fasta converted data.

Under "Text Manipulation," select "Concatenate datasets" to combine the results from the two megablast searches.

Under "Join, Subtract, and Group," select "Join two Datasets" to combine your concatenated megablast results with the computed sequence lengths (use default values)

Under "Filter and sort," select "Filter." The megablast with sequence lengths should be autodetected as the file to filter. Use the following condition to filter: "c5/c15 < 0.5"

**Metagenomic analysis**

The rest of our analyses will use commands under the "Metagenomics analysis" section of the tools sidebar.

Select "Fetch taxonomic representation." Input your filtered data file. Select 2 for the GIs column, and 1 for Name column.

Select "Find lowest diagnostic rank" and input your taxonomic data file. Require the lowest rank to be at least Subkingdom.

Select "Summarize taxonomy" and to summarize your taxonomic representation file.

Select "Summarize phylogeny" on the summarized taxonomy file, showing ranks from root to Class.

###Assignment
* Due Wednesday, April 15 at 5 pm
* Assessment criteria
	* Technical content: 40, appropriate syntax for written assessment answers
	* Critical thinking: 40, explanations for written assessment answers
	* Documentation: 10, code comments, citations for resources used in questions embedded in answers
	* Professional behavior: 10, class participation, assignment formatting using homework template (including code formatted in `monospace`)
* Written assessment: 
	* create new file in your homework repository, `LastnameHomework`, called `LastnameWk10Homework.md". Title (header) is "Comparative genomics".
	* Answer the following questions about the tools you learned for this week's lab, including code comments where appropriate 				
	* Use appropriate Markdown formatting, including `monospace` when referencing commands you entered. 
	* If you choose to copy and paste the questions before answering, it might help to copy from the Raw view. 
	* Don't forget to preview your homework before committing! 
	* If you get stuck on a question, please consult readings above.
	
1. What does Megablast do?
2. Change parameters and run
3. Why did we add sequence length?
4. Why did we add "TripA" to the sequence IDs?


8. How long did it take you to complete these questions?
9. Type SUBMIT as the answer to this question when you are ready for this assignment to be graded.
