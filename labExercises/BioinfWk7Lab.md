#Bioinformatics Week 7 Lab
##Sequence searching

Slides for the introduction to today's lab, as well as a PDF of this document, can be found on [Blackboard](http://blackboard.uttyler.edu).

###Learning Objectives
You should be able to:

1. load and analyze sequences in R
2. perform sequence searches (BLAST) using NCBI's online interface
3. identify sequences using the online Barcode of Life database

###Readings:

Additional materials for reference:
* [BLAST on NCBI](http://blast.ncbi.nlm.nih.gov/Blast.cgi)
* [Barcode of Life Database](http://www.boldsystems.org)
* [Little Book of R for Bioinformatics](https://a-little-book-of-r-for-bioinformatics.readthedocs.org/en/latest/)

###Activities

**Download data and install packages for today's exercises**

First we're going to set up the files that we'll be using for the rest of today's lab. Open up RStudio and your BioinformaticsR package. Create a new folder called "data" in your directory. We've been using the same R script for several weeks now, so let's also create a new R script, call it `week7.R`, and save it in our BioinformaticsR folder.

Go to [Molecular Evolution's Sample Files page](http://www.molecularevolution.org/resources/fileformats) and download both the "Example unaligned FASTA DNA file" and "Example unaligned FASTA amino acid file." On your desktop, drag these two files to your newly created "data" folder. You should then see them appear in your RStudio file hierarchy.

In RStudio, you can now install and load today's first package:

```
#install and load packages
install.packages(seqinr)
library(seqinr)
```

Now we're ready with data and software for the rest of lab.

**Sequence analysis in R**

It can be a little tricky to load sequence data into R. We're going to use parts of the `seqinr` package to import data. First, click on `dna.fasta.unaligned.dat` (just added to your new `data` folder). How are the data arranged? Now import them into R and look at the resulting structure:

```
#reading sequence data into R
nucleotide <- read.fasta(file ="data/dna.fasta.unaligned.dat", seqtype = "DNA")
#view data structure
str(nucleotide)
```

There are several fasta sequences in this dataset, but the way that R structures the data makes it easy to specify a single sequence, and even save that extracted sequence to file:

```
#extract one sequence (cow) and save to file
cow <- nucleotide[[1]]
write.fasta(names="cow", sequences=cow, file.out="data/cow.fas")
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

In addition to loading data from text files, there are other options for entering data into R. We can also obtain information about records in online databases using R. We can extract sequences from multiple parts of NCBI, including GenBank:

```
#install and load packages
install.packages("rentrez")
library(rentrez)
#specify search term
salamander <- "Ambystoma[Organism]"
#search for term
salamanderSearch <- entrez_search(db="nuccore", term=salamander)
#fetch sequences
salamanderSeqs <- entrez_fetch(db="nuccore", id = salamanderSearch$ids, rettype = "fasta")
write.fasta(names="Ambystoma", sequences=salamanderSeqs, file.out="data/salamander.fas")
```

The following example uses parts of the `bold` R package to extract information from BOLD, including installation and loading of the package:

```
#install and load packages
install.packages(seqinr)
library(seqinr)
#search for taxonomic names
bold_tax_name(name = c("Bos", "Bison"))
#search for sequences for a particular taxon
bold_seq(taxon = "Bos")
```

What data is included for each of these sequences?

Now that you know a little about working with sequence data in R, we can start to examine sequence similarity.

**BLAST**

Navigate to the web interface for [NCBI's BLAST](http://blast.ncbi.nlm.nih.gov/Blast.cgi). There are many different options available for searching the published sequence database. We're going to work through a few of the most commonly used options together.

Click on "nucleotide blast." Copy the cow sequence from `dna.fasta.unaligned.dat.txt`, paste it in the query sequence box, and click "BLAST."

The results window includes lots of different types of information. If you would like to know more about interpreting these results, click on either of two links in the upper right of the window: "How to read this page" and "Blast report description." Click on the top BLAST hit, "Bos taurus isolate 115 mitochondrion, complete genome," and download as "FASTA (complete sequence)" from the upper left of the search result. It will appear as "seqdump.txt". 

Go back to the search page, scroll down to the bottom of the page, and click "Algorithm parameters." You can view a more exhaustive set of options for manipulating similarity searching. What happens to your searches if you alter any of these parameters?

For your next search, upload the entire nucleotide fasta file. When your results appear, click on "Download" then "Hit table(text)" in the window that appears. It will download as "*-Alignment.txt" (probably in your Downloads folder). 

The search we just completed was a megablast, which is a variation of blastn (searches nucleotide database using nucleotide query). Return to the search page and click on the "blastx" tab in the upper left. This search accepts a nucleotide query but searches protein databases. Enter the same sequence into the query box and click "BLAST." How do these search results differ from our first search?

Now click on the "blastp" tab in the search window. Copy and paste the cow sequence from `protein.fasta.unaligned.dat.txt` into the search window. How do you interpret these results?

**Barcode of Life**

Navigate to the [Barcode of Life Database](http://www.boldsystems.org) in a web browser. Select the Public Data Portal (near the bottom of the screen). This first window allows you to search for records (specimens and sequences) for specific taxa in the database. Enter "Bos" in the search window and click "Search." What information is included with each result?

Click on "Identification" near the top of the screen. This allows you to enter a sequence to identify a specimen. Copy and paste the "unknown1" sequence from the `week7.fas` data file into the "Animal" search field. What is the best-scoring hit? How do you interpret these results? Click on the button for "BIN page," and then the blue "FASTA" button to download the best-scoring sequences. 

###Assignment
* Due Wednesday, Mar 4 at 5 pm
* Assessment criteria
	* Technical content: 40, appropriate syntax for written assessment answers
	* Critical thinking: 40, explanations for written assessment answers
	* Documentation: 10, code comments, citations for resources used in questions embedded in answers
	* Professional behavior: 10, class participation, assignment formatting using homework template (including code formatted in `monospace`)
* Written assessment: 
	* create new file in your homework repository, `LastnameHomework`, called `LastnameWk7Homework.md". Title (header) is "Sequence searching".
	* Answer the following questions about the Unix tools you learned for this week's lab, including code comments where appropriate 				
	* Use appropriate Markdown formatting, including `monospace` when referencing commands you entered. 
	* If you choose to copy and paste the questions before answering, it might help to copy from the Raw view. 
	* Don't forget to preview your homework before committing! 
	* If you get stuck on a question, please consult the textbook (see readings above).
	
1. BLAST the unknown2 sequence from `week7.fas` (in the class' GitHub repository data folder). Now perform the same search but with match/mismatch scores of 1,-4. How do the results from these two analyses compare?
2. BLAST this sequence: CGATGCGATATGCGAAAA. How do you interpret the score, similarity, query coverage, and E-value for the top hits? 
3. Import the *Bos taurus* mitochondrial sequence (downloaded during the BLAST exercise) into R using `seqinr`. What is the length and GC content? Include your code and comments.
4. Using R, extract the loach sequence from `protein.fasta.unaligned.dat.txt` and save it in a new file called `loachAA.fas`. Include your code and comments.
5. Import BOLD sequences for two taxa, *Callisia* and *Gibasis*, into R using the R package `bold`. Include your code and comments.
6. Import GenBank sequences for the organism *Boa* using `rentrez` and save to a file (using `seqinr`). Include your code and comments.
7. Search for the unknown3 sequence from `week7.fas` using the online BOLD database and using BLAST. Compare your results and explain your conclusion. 
8. How long did it take you to complete these questions?
9. Type SUBMIT as the answer to this question when you are ready for this assignment to be graded.
