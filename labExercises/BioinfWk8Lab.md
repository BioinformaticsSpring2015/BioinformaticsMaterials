#Bioinformatics Week 8 Lab
##Multiple sequence alignment

Slides for the introduction to today's lab, as well as a PDF of this document, can be found on [Blackboard](http://blackboard.uttyler.edu).

###Learning Objectives
You should be able to:

1. perform and compare multiple sequence alignments using a variety of algorithms using web servers
2. import and analyze sequence matrices in R

###Readings:

Additional materials for reference:
* 

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

Download in fasta format

**MSA in R**

We're going to use two new packages today to import sequences, perform some quick MSAs, and view the resulting files.

```
#install and load packages
install.packages(c("muscle","ape")
library(c(muscle,ape))
```

As we discussed last week in lab, performing sequence alignments in R isn't very efficient. We may often prefer to perform an alignment using a web-based server, download the results, and then import the aligned dataset into R. We can do this using one of the datasets we downloaded earlier:

```
XXX
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
	
1. Why does ClustalW output a phylogenetic tree?
2. Perform mutliple sequence alignment using the package `muscle`. Include your code and comments.
How long did it take you to complete these questions?
Type SUBMIT as the answer to this question when you are ready for this assignment to be graded.
