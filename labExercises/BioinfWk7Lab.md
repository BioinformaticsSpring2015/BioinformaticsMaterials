#Bioinformatics Week 7 Lab
##Sequence searching

Slides for the introduction to today's lab, as well as a PDF of this document, can be found on [Blackboard](http://blackboard.uttyler.edu).

###Learning Objectives
You should be able to:

1. compare web-based and command-line database searching
2. load and analyze sequences in R
3. perform sequence searches (BLAST) using NCBI's online interface
4. identify sequences using the Barcode of Life database

###Readings:

Additional materials for reference:
* [BLAST on NCBI](http://blast.ncbi.nlm.nih.gov/Blast.cgi)
* [Barcode of Life](http://www.boldsystems.org)
* [Little Book of R for Bioinformatics](https://a-little-book-of-r-for-bioinformatics.readthedocs.org/en/latest/)

###Activities

**Download data and install packages for today's exercises**

First we're going to set up the files that we'll be using for the rest of today's lab. Open up RStudio and your BioinformaticsR package. Create a new folder called "data" in your directory.

Go to [Molecular Evolution's Sample Files page](http://www.molecularevolution.org/resources/fileformats) and download both the "Example unaligned FASTA DNA file" and "Example unaligned FASTA amino acid file." On your desktop, drag these two files to your newly created "data" folder. You should then see them appear in your RStudio file hierarchy.

In RStudio, you can now install and load the packages for today's lab:

```
#install and load packages
install.packages("seqinr", "rentrez", "bold")
library(seqinr, rentrez, bold)
```

Now we're ready with data and software for the rest of lab.

**Sequence analysis in R**


**BLAST**

*Web-based BLAST*

Navigate to the web interface for [NCBI's BLAST](http://blast.ncbi.nlm.nih.gov/Blast.cgi). Lots of options.

search for particular sequence by taxon name or accession number, each part of record includes relevant information

blastn

blastp

blastx

*BLAST in R*

**Barcode of Life**

*Web-based Barcode of Life*

*Barcode of Life in R*




###Assignment
* Due Wednesday, Feb X at 5 pm
* Assessment criteria
	* Technical content: X, appropriate syntax for written assessment answers
	* Critical thinking: X, explanations for written assessment answers
	* Documentation: 10, code comments, citations for resources used in questions embedded in answers
	* Professional behavior: 10, class participation, assignment formatting using homework template (including code formatted in `monospace`)
* Written assessment: 
	* create new file in your homework repository, `LastnameHomework`, called `LastnameWk7Homework.md". Title (header) is "Sequence searching".
	* Answer the following questions about the Unix tools you learned for this week's lab, including code comments where appropriate 				
	* Use appropriate Markdown formatting, including `monospace` when referencing commands you entered. 
	* If you choose to copy and paste the questions before answering, it might help to copy from the Raw view. 
	* Don't forget to preview your homework before committing! 
	* If you get stuck on a question, please consult the textbook (see readings above).
	
1.

How long did it take you to complete these questions?

Type SUBMIT as the answer to this question when you are ready for this assignment to be graded.
