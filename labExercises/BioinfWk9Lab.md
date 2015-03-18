#Bioinformatics Week 9 Lab
##Phylogenetics and remote computation

Slides for the introduction to today's lab, as well as a PDF of this document, can be found on [Blackboard](http://blackboard.uttyler.edu).

###Learning Objectives
You should be able to:

1. Construct phylogenetic trees from multiple sequence alignments.
2. Log on to a remote computational cluster and perform analyses using Unix commands.

###Readings:
* PCB Chapter 20: Working on remote computers

Additional materials for reference:
* [TACC](https://portal.tacc.utexas.edu)
* [Virtual workshop in logging on, transferring files, and running programs on TACC](https://www.cac.cornell.edu/stampede/Environment/default.aspx): Note that this resource is for the Stampede cluster, while we will be running commands on Lonestar.
* [Virtual workshop in using R on TACC](https://www.cac.cornell.edu/stampede/R/default.aspx): In particular, the sections under "Running R."

###Activities

Over the past few weeks, we've performed database searches and multiple sequence alignments using web servers and on a local (desktop) computer using R. Today we're going to use the same approaches to building phylogenetic trees. In addition, we'll learn to log on to a remote computational cluster to perform actions on the command line (using Unix commands in Cygwin).

We've mostly been working with files in fasta format so far. Today, go to [Molecular Evolution](http://www.molecularevolution.org/resources/fileformats) and download the "Example PHYLIP DNA file" and "Example PHYLIP amino acid file" under the "PHYLIP" section. You may want to put these in your `BioinformaticsR/alignments` folder for safekeeping. You can open up one of the files in a text editor to remind you how the data are structured. Also note that the file download name uses "phy" in it to signify the format.

**Web-based phylogenetic inference**

First, we're going to build a phylogenetic tree using an online interface. This will let us explore the options for tree building, without worrying too much about syntax. 

Navigate to the [PhyML web server](http://www.atgc-montpellier.fr/phyml/). There are four main sections to the options available for starting a job. Under "Input Data," upload `dna.phy.dat.txt`. Are the rest of the default options in this section appropriate?

Look at the options available under the next section, "Substitution model." PhyML estimates trees in a maximum likelihood framework, so there are options available for specifying the model of molecular evolution. There are also options listed below "Tree searching" to change the heuristic strategy for exploring tree topology. We'll leave all options at default for now. 

Under the last section, "Branch support," select the "no" button by the "Fast likelihood-based method." This allows the analysis to find a phylogenetic tree, but skip the bootstrap analysis.

We're ready to run our analysis! If you leave the box by "Name your analysis" blank, the program will use the input file name. Enter an email address (and confirm it), then hit "Execute and email results." You should receive a confirmation email that your analysis is running, and then a zipped result file within a few minutes. If your results don't appear, you can download the example data file (`dna_phy_dat_txt_phyml.zip`) from the "data" folder in the [class GitHub repository](LINK).

Download and unzip the result file. You may wish to move this folder to a new folder called `trees` in your `BioinformaticsR` folder for easy access later.

If you look in your results folder, you should have four files. The most important is the file that includes "tree" in the filename, because this is the phylogeny we wanted to infer. If you open up this tree in a text editor, you will see it's in Newick format, and very difficult to interpret. In a web browser, navigate to the [ETE Toolkit tree viewer](http://etetoolkit.org/treeview/). Copy and paste the results from `dna_phy_dat_txt_phyml_tree.txt` to the box below "Paste your tree in newick format" and click "tree view." You should see your tree in the window below. What are the relationships among species in this tree? Keep this window open to compare with your later analyses.

**Phylogenetics in R on local computer**

Open up your `BioinformaticsR` project in RStudio. You may wish to create a new R script and name it `Week9.R`. We'll be using the `ape` package to work with phylogenetic trees in R:

```
#install and load packages
install.packages("ape")
library(ape)
```

R is not the best mechanism for performing likelihood tree inference, but you can easily import trees in parenthetical (Newick) format into R. Try this with the tree you obtained from your web-based PhyML job:

```
#import tree 
mltree<-read.tree(file = "trees/dna_phy_dat_txt_phyml/dna_phy_dat_txt_phyml_tree.txt")
#examine data structure
str(mltree)
#plot tree
plot(mltree)
#plot unrooted tree with no tip labels and red branches
plot(mltree, type="unrooted", show.tip.label=FALSE, edge.color="red")
```

What is the data structure? What are the different parts of this structure? Is this the same tree you obtained earlier? You can view other options for visualizing this tree under the entry for `plot.phylo`. You may also choose to export this tree as a PDF to save for later.

It is possible to build distance (neighbor-joining) tree in R from a multiple sequence alignment. Let's try this on one of our aligned files from last week:

```
#import aligned matrix
alignedNucs <- read.FASTA(file="alignments/dna.fasta.aligned.dat")
#build nj tree
njtree <- nj(dist.dna(alignedNucs))
#plot tree
plot(njtree)
```

Notice that the command we used for importing the alignment is `read.FASTA` (instead of `read.fasta` like last week). This is because `ape` has its own command for importing fasta files. Did you obtain the same tree from the neighbor joining algorithm as from the ML analysis? How can you tell?

One major difference between this tree and the one we obtained earlier is that this tree is not rooted. We can write a script that will perform the entire analysis for us and run with a single command. Open a new R script named `maketree.R` with the following code:

```
library(ape)
#import aligned matrix
alignedNucs <- read.FASTA(file="alignment/dna.fasta.aligned.dat")
#build nj tree
njtree <- nj(dist.dna(alignedNucs))
#root tree 
njrooted <- root(njtree, c("Carp", "Loach"), resolve.root = TRUE)
#save tree to file
write.tree(njrooted, file="trees/njrooted.tre")
#plot and save to file
pdf(file="trees/njrooted.pdf")
plot(njrooted)
dev.off()
```

You can execute this script in R using the command `source("maketree.R)`.

**Working remotely on TACC**

ssh

orientation

scp

phyml

R

###Assignment
* Due Wednesday, Mar 25 at 5 pm
* Assessment criteria
	* Technical content: 40, appropriate syntax for written assessment answers
	* Critical thinking: 40, explanations for written assessment answers
	* Documentation: 10, code comments, citations for resources used in questions embedded in answers
	* Professional behavior: 10, class participation, assignment formatting using homework template (including code formatted in `monospace`)
* Written assessment: 
	* create new file in your homework repository, `LastnameHomework`, called `LastnameWk7Homework.md". Title (header) is "Phylogenetics and remote computation".
	* Answer the following questions about the Unix tools you learned for this week's lab, including code comments where appropriate 				
	* Use appropriate Markdown formatting, including `monospace` when referencing commands you entered. 
	* If you choose to copy and paste the questions before answering, it might help to copy from the Raw view. 
	* Don't forget to preview your homework before committing! 
	* If you get stuck on a question, please consult the textbook (see readings above).
	
1. Use the PhyML web server to build a phylogeny for the `dna.phy.dat.txt` under the JC69 substitution model. How does this tree compare to the tree inferred from HKY85 (default settings)?
2. 
8. How long did it take you to complete these questions?
9. Type SUBMIT as the answer to this question when you are ready for this assignment to be graded.
