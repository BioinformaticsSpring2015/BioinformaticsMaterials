#Bioinformatics Week 8 Lab
##Multiple sequence alignment

Slides for the introduction to today's lab, as well as a PDF of this document, can be found on [Blackboard](http://blackboard.uttyler.edu).

###Learning Objectives
You should be able to:

1. perform and compare multiple sequence alignments using a variety of algorithms using web servers
2. import and analyze sequence matrices in R

###Readings:

Additional materials for reference:
* [Molecular Evolution file formats](http://www.molecularevolution.org/resources/fileformats)

###Activities

**Register for an account with TACC**

After spring break, we're going to be using some programs located on remote clusters owned by the Texas Advanced Computing Center (TACC) in Austin, Texas. You'll need to sign up for an account with TACC for me to grant you access to our class account. 

Go to the [TACC user portal](https://portal.tacc.utexas.edu/) and click "Create a TACC account." Read through the new user information and accept the terms and conditions (I assure you that all activities I will ask you to perform on these resources abide by these policies). Enter only the required fields (marked with a red asterisk), and use your UT Tyler email address. Your PI Eligibility is "Ineligible." 

Once you have signed up for an account, your instructor will be able to grant you access to Lonestar, the cluster we'll be using for class.

**Comparison of alignment algorithms**

Navigate to the [EMBL-EBI MSA tool page](http://www.ebi.ac.uk/Tools/msa/). This is a resource provided by the European Molecular Biology Laboratory that will allow us to perform several multiple sequence alignment methods and compare the results.

*Clustal W*

Select "Launch ClustalW." Use the upload button below the text box to enter `dna.fasta.unaligned.dat`. Use the drop down menu to select "DNA" to specify the type of sequences we are aligning. Note that there are several alignment parameters that you can alter. Click "Submit" to start your job. 

You'll see an intermediate screen indicating that a remote server is running your analysis. This job will output several types of files. You can click on each output to view it in your browser, or right click to download to your Desktop. The most important output is the file of aligned sequences, but you may also be interested in other files containing summary statistics and alignment parameters.  There is also an option to view the alignment color-coded in Jalview (but this requires an additional plug-in installation on your computer). 

*MAFFT*

Go back to the main list of sequence alignment algorithms and select "Launch MAFFT." Upload the `dna.fasta.unaligned.dat` file again, and select ClustalW as the output format. Download these results to import into R later.

**MSA in R**

We're going to use two new packages today to import sequences, perform some quick MSAs, and view the resulting files. First, we need to set up our R projects. Create a new folder in your `BioinformaticsR` directory called `intermediate`. This is where we will store the files we align. Move the alignments you downloaded from earlier in the lesson to this folder. Next, download the aligned data files from [Molecular Evolution's Sample Files page](http://www.molecularevolution.org/resources/fileformats). We are going to use these files as example alignments. We can do this on the command line by clicking on the "Download" button and copying the url for the following commands:

```
#download aligned example files
download.file(url = "http://www.molecularevolution.org/molevolfiles/fileformats/dna.fasta.aligned.dat", destfile = "data/dna.fasta.aligned.dat")
download.file(url = "http://www.molecularevolution.org/molevolfiles/fileformats/protein.fasta.aligned.dat", destfile = "data/protein.fasta.aligned.dat")
```

Now we need to make sure we have all packages installed for today's activities:

```
#install packages
install.packages(c("muscle","ape","seqinr")
```

As we discussed last week in lab, performing sequence alignments in R isn't very efficient. There is one algorithm available in R that will allow us to perform alignments for small datasets. We don't even have to read the data into R first! Let's perform a test alignment on `dna.fasta.unaligned.dat` and store the output in `intermediate`.

```
#load library
library(muscle)
#align and send to file
muscle(seqs = "data/dna.fasta.unaligned.dat", out = "intermediate/out1.afa")
```

Alternatively, you can load sequences into R, align, and export, which allows you to manipulate the stored object in R. The following output should be identical to the previous output.

```
#align and send to object
dna1 <- muscle(seqs = "data/dna.fasta.unaligned.dat")
#write output to file
write.fasta(dna1, file = "intermediate/out2.afa")
#print selected alignment positions
print.muscle(dna1, from = 1, to = 50)
```

More often than not, we may often prefer to perform an alignment using a web-based server, download the results, and then import the aligned dataset into R. We can do this using one of the datasets we downloaded earlier:

```
#load library
library(seqinr) #masked read.fasta and write.fasta from muscle
#read fasta alignment into R using seqinr
dna2 <- read.alignment(file = "data/dna.fasta.aligned.dat", format = "fasta")
#make consensus
con(dna2)
#write consensus to outfile
seqinr::write.fasta(names="consensus", sequences=con(dna2), file.out="intermediate/consensus.fas")
```

Note in the previous example that loading `seqinr` caused an overwrite of some commands from `muscle`, which we loaded earlier. We make sure we're running the appropriate version of a command by specifying `seqinr::write.fasta` later.

```
#load library 
library(ape) #masks as.alignment, consensus from seqinr; muscle from muscle
#read fasta alignment into R using ape
dna3 <- read.dna(file = "data/dna.fasta.aligned.dat", format ="fasta")
#read clustal alignment in R using ape
dna4 <- read.dna(file = "data/dna.fasta.aligned.dat", format ="clustal")
```

What would happen if you tried to run the command `muscle` now? How would you specify the other package?

We can examine the data structures from each of the different alignments we read into R. This will be very important when we start to perform other commands on these sequences files later!

```
#compare classes of unaligned sequences
class(dna1) #muscle
class(dna2) #alignment
class(dna3) #list
class(dna4) #list
```

###Assignment
* Due Wednesday, Mar 17 at 5 pm (although I strongly recommend you complete it before then!)
* Assessment criteria
	* Technical content: 20, appropriate syntax for written assessment answers
	* Critical thinking: 20, explanations for written assessment answers
	* Documentation: 5, code comments, citations for resources used in questions embedded in answers
	* Professional behavior: 5, class participation, assignment formatting using homework template (including code formatted in `monospace`)
* Written assessment: 
	* create new file in your homework repository, `LastnameHomework`, called `LastnameWk8Homework.md". Title (header) is "Multiple sequence alignment".
	* Answer the following questions about the Unix tools you learned for this week's lab, including code comments where appropriate 				
	* Use appropriate Markdown formatting, including `monospace` when referencing commands you entered. 
	* If you choose to copy and paste the questions before answering, it might help to copy from the Raw view. 
	* Don't forget to preview your homework before committing! 
	* If you get stuck on a question, please consult the textbook (see readings above).
	
1. What username did you choose for your account on TACC?
2. Look at the multiple sequence alignment in `data/week8.txt` in the class GitHub repository. What file format is it? How do you know?
3. Why does ClustalW output a phylogenetic tree?
4. Download [these sequences](http://www.embl.de/~seqanal/courses/commonCourseContent/sequences/moreDivergentHemoglobins_unaligned.fasta) in R and perform a mutliple sequence alignment using the R package `muscle`. Include your code and comments.
5. Align the same sequences from question 4 using MAFFT on the online EMBL server. How does this alignment compare to your muscle alignment from question 4?
6. How long did it take you to complete these questions?
7. Type SUBMIT as the answer to this question when you are ready for this assignment to be graded.
