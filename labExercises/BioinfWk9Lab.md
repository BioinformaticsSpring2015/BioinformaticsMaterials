#Bioinformatics Week 9 Lab
##Phylogenetics and remote computation

Slides for the introduction to today's lab, as well as a PDF of this document, can be found on [Blackboard](http://blackboard.uttyler.edu).

###Learning Objectives
You should be able to:

1. Construct phylogenetic trees from multiple sequence alignments.
2. Log on to a remote computational cluster and perform analyses.

###Readings:
* PCB Chapter 20: Working on remote computers

Additional materials for reference:
* [TACC](https://portal.tacc.utexas.edu)

###Activities

Over the past few weeks, we've performed database searches and multiple sequence alignments using web servers and on a local (desktop) computer using R. Today we're going to use the same approaches to building phylogenetic trees. In addition, we'll learn to log on to a remote computational cluster to perform actions on the command line (using Unix commands in Cygwin).

We've mostly been working with files in fasta format so far. Today, go to [Molecular Evolution](http://www.molecularevolution.org/resources/fileformats) and download the "Example PHYLIP DNA file" and "Example PHYLIP amino acid file" under the "PHYLIP" section. You may want to put these in your `BioinformaticsR/alignments` folder for safekeeping. You can open up one of the files in a text editor to remind you how the data are structured. Also note that the file download name uses "phy" in it to signify the format.

**Web-based phylogenetic inference**

First, we're going to build a phylogenetic tree using an online interface. This will let us explore the options for tree building, without worrying too much about syntax. 

Navigate to the [PhyML web server](http://www.atgc-montpellier.fr/phyml/). There are four main sections to the options available for starting a job. Under "Input Data," upload `dna.phy.dat.txt`. Are the rest of the default options in this section appropriate?

Look at the options available under the next section, "Substitution model." PhyML estimates trees in a maximum likelihood framework, so there are options available for specifying the model of molecular evolution. There are also options listed below "Tree searching" to change the heuristic strategy for exploring tree topology. We'll leave all options at default for now. 

Under the last section, "Branch support," select the "no" button by the "Fast likelihood-based method." This allows the analysis to find a phylogenetic tree, but skip the bootstrap analysis.

We're ready to run our analysis! If you leave the box by "Name your analysis" blank, the program will use the input file name. Enter an email address (and confirm it), then hit "Execute and email results." You should receive a confirmation email that your analysis is running, and then a zipped result file within a few minutes. If your results don't appear, you can download the example data file from the "data" folder in the [class GitHub repository](LINK).

Download and unzip the result file. You should have four files. The most important is the file that includes "tree" in the filename, because this is the phylogeny we wanted to infer. If you open up this tree in a text editor, you will see it's in Newick format, and very difficult to interpret. In a web browser, navigate to the [ETE Toolkit tree viewer](http://etetoolkit.org/treeview/). Copy and paste the results from `dna_phy_dat_txt_phyml_tree.txt` to the box below "Paste your tree in newick format" and click "tree view." You should see your tree in the window below. What are the relationships in this tree?

**Phylogenetics in R on local computer**




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
