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
* [Barcode of Life Database](http://www.boldsystems.org)
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

It can be a little tricky to load sequence data into R. We're going to use parts of the `seqinr` package to import data. First, click on the `dna.fasta.unaligned.dat.txt` you added to your new `data` folder. How are the data arranged? Now import them into R and look at the resulting structure:

```
#reading sequence data into R
nucleotide <- read.fasta(file ="data/dna.fasta.unaligned.dat.txt")
#view data structure
str(nucleotide)
```

There are several fasta sequences in this dataset, but the way that R structures the data makes it easy to specify a single sequence:

```
#extract on sequence (cow)
cow <- nucleotide[[1]]
```

Then we can gather a few pieces of information about the sequence:

```
#length of cow
length(cow)
#base composition
table(cow)
#barplot from base composition
barplot(table(cow))
#GC content
GC(cow)
```

Now that you know a little about working with sequence data in R, we can start to examine sequence similarity.

**BLAST**

*Web-based BLAST*

Navigate to the web interface for [NCBI's BLAST](http://blast.ncbi.nlm.nih.gov/Blast.cgi). There are many different options available for searching the published sequence database. We're going to work through a few of the most commonly used options together.

Click on "nucleotide blast." Copy the cow sequence from `dna.fasta.unaligned.dat.txt`, paste it in the query sequence box, and click "BLAST."

The results window includes lots of different types of information. If you would like to know more about interpreting these results, click on either of two links in the upper right of the window: "How to read this page" and "Blast report description." Click on the top BLAST hit, "Bos taurus isolate 115 mitochondrion, complete genome," and download as "FASTA (complete sequence)" from the upper left of the search result. It will appear as "seqdump.txt" (probably in your Downloads folder).

The search we just completed was a megablast, which is a variation of blastn (searches nucleotide database using nucleotide query). Return to the search page and click on the "blastx" tab in the upper left. This search accepts a nucleotide query but searches protein databases. Enter the same sequence into the query box and click "BLAST." How do these search results differ from our first search?

Now click on the "blastp" tab in the search window. Copy and paste the cow sequence from `protein.fasta.unaligned.dat.txt` into the search window. How do you interpret these results?

*BLAST in R*

**Barcode of Life**

*Web-based Barcode of Life*

Navigate to the [Barcode of Life Database](http://www.boldsystems.org) in a web browser. Select the Public Data Portal (near the bottom of the screen). This first window allows you to search for records (specimens and sequences) for specific taxa in the database. Enter "Bos" in the search window and click "Search." What information is included with each result?

Click on "Identification" near the top of the screen. This allows you to enter a sequence to identify a specimen. Copy and paste the "unknown1" sequence from the `week7.fas` data file. What is the best-scoring hit? How do you interpret these results? Click on the button for "BIN page," and then the blue "FASTA" button to download the best-scoring sequences. 

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
