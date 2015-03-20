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

We've mostly been working with files in fasta format so far. Today, go to [Molecular Evolution](http://www.molecularevolution.org/resources/fileformats) and download the "Example PHYLIP DNA file" under the "PHYLIP" section. You may want to put these in your `BioinformaticsR/alignments` folder for safekeeping. You can open up one of the files in a text editor to remind you how the data are structured. Also note that the file download name uses "phy" in it to signify the format.

**Web-based phylogenetic inference**

First, we're going to build a phylogenetic tree using an online interface. This will let us explore the options for tree building, without worrying too much about syntax. 

Navigate to the [PhyML web server](http://www.atgc-montpellier.fr/phyml/). There are four main sections to the options available for starting a job. Under "Input Data," upload the phylip file you downloaded earlier (e.g., `dna.phy.dat`). Are the rest of the default options in this section appropriate?

Look at the options available under the next section, "Substitution model." PhyML estimates trees in a maximum likelihood framework, so there are options available for specifying the model of molecular evolution. There are also options listed below "Tree searching" to change the heuristic strategy for exploring tree topology. We'll leave all options for this and the last section ("Branch support") at default for now. 

We're ready to run our analysis! If you leave the box by "Name your analysis" blank, the program will use the input file name. Enter an email address (and confirm it), then hit "Execute and email results." You'll get a pop-up window asking you if your file is actually phylip format; click yes. You should receive a confirmation email that your analysis is running, and then a zipped result file within a few minutes. If your results don't appear, you can download the example data file (`dna_phy_dat_txt_phyml.zip`) from the "data" folder in the [class GitHub repository](https://github.com/BioinformaticsSpring2015/BioinformaticsMaterials/blob/master/data/dna_phy_dat_txt_phyml.zip).

Download and unzip the result file. You may wish to move this folder to a new folder called `trees` in your `BioinformaticsR` folder for easy access later.

If you look in your results folder, you should have four files. The most important is the file that includes "tree" in the filename, because this is the phylogeny we wanted to infer. If you open up this tree in a text editor, you will see it's in Newick format, and very difficult to interpret. We're going to use R to view the tree.

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
mltree<-read.tree(file = "trees/dna_phy_dat_phyml_tree.txt")
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
#root tree 
njrooted <- root(njtree, c("Carp", "Loach"), resolve.root = TRUE)
#save tree to file
write.tree(njrooted, file="trees/njrooted.tre")
```

Notice that the command we used for importing the alignment is `read.FASTA` (instead of `read.fasta` like last week). This is because `ape` has its own command for importing fasta files. Compare the plotted trees to the PhyML tree from earlier. What are the results? 

**Working remotely on TACC**

We've talked a lot in class about computational limitations of some methods. One way to take advantage of more computationally intensive programs is to use a web server. In these cases, you use an online interface to submit your job to run on someone else's computer. There are certainly circumstances in bioinformatics in which we would like to use a larger, faster computer, but a web service is not available. Luckily, as UT System affiliates, we have access to very big, very fast, very cool computers in Austin. The catch is that working remotely on a computer generally requires use of the command line, particularly the Unix tools we learned at the beginning of the semester.

Last lab, you created a account for TACC. I've added you as a collaborator in our class project, which means you have access to resources to run large jobs. We're going to learn to upload files to TACC, run jobs remotely, and download the results to our local machines.

First, go to the [TACC portal](https://portal.tacc.utexas.edu/home) and log in to ensure your account is active. 

Next, open up a Cygwin window. Note the command prompt that appears here: it is specific to your local machine. Log on:

`ssh username@lonestar.tacc.utexas.edu`

You'll be prompted to enter `yes`, to indicate it's ok to log on, and then you'll enter the password you selected. Please note that no characters will appear on the screen as you submit your password! 

Upon login, you'll see a lot of information printed to your screen. There are some useful hints described here, as well as the resources to which you have access. You know you are logged on to a remote resource because your command prompt has changed. It probably says something like `login1.ls4(1)$`. The `$` is the important part, because it indicates that you can enter commands to run.

You can operate in this shell the same way you did during the Unix command lessons of lab (weeks 2 and 3).

In another Cygwin shell, navigate to the file containing `dna.phy.dat` (probably `BioinformaticsR/alignments`). Enter the following command to upload your data to TACC, where "username" is the name you selected last week for your TACC account:

`scp dna.phy.dat username@lonestar.tacc.utexas.edu:.`

This command is similar to the `cp` command we learned at the beginning of the semester, except this is a secure copy command used for transferring files between computers. The syntax is also similar, with the file you want to copy listed first, then the place where it will be copied (in this case, you're specifying the home directory of your personal account on TACC). You should see a line printed that lists the file as 100% uploaded. You may want to open a text editor to save these commands with notes (like you've done in RStudio).

Now go back to the shell where you are logged on to TACC. If you type `ls`, you should see the file you uploaded using `scp`.

We're going to build a tree in interactive mode. We need to specify this mode and request a node on which to run:

`idev`

You'll be prompted to say whether you want commands added to your profile; it's ok to say "yes." There will be some text printed to the screen indicating that the job has been submitted, and a job status line that shows `qw` for "queued" until you're prompted to enter "yes" for the authenticity check. You'll eventually see a new command prompt (like `c341-313$`), and you're ready to run your analysis. If you list the files in your directory, you should still see your multiple sequence alignment. Note that this interactive node will only be open for half an hour at most. When that time ends, it will automatically end the job (you can always log back in using `idev`). Also, you can run `phyml` without first submitting an interactive job, but it's good practice to get a node allocated if you'll be running any commands of importance (requiring computational resources).

One of the powerful uses of TACC is to access software without needing to install it on a local machine. You need to load the specific software you'll be using, however:

`module load phyml`

This command loads PhyML for us to access. If you type `phyml`, the screen should print some information about PhyML and provide a prompt to "Enter the sequence file name." This is an interactive interface that allows you to move through menus according to the on-screen directions and change the parameters of your analysis. Enter the name of your file (`dna.phy.dat`) and hit enter. Then type `R` to change the run ID to `justtree`. You can then use `+` to move throughout the menu options. We're going to run the analysis on the default model settings, so go ahead and type `Y` then enter.

Your analysis will run and then you'll see a command prompt again. List the files in your directory and you'll see a few new files. Two files (`dna.phy.dat_phyml_stats_justtree.txt` and `dna.phy.dat_phyml_tree_justtree.txt`) are the output from PhyML; `idev*` is a record of the interactive session you are running. You can view your tree and stats files in nano if you wish. 

You can also use R on Lonestar. Again, we'll need to load the module:

`module load R`

Then just type `R` and you should see a similar interface to your console in RStudio. We're not going to do much more with R in TACC (it takes a bit more effort to install packages and we don't have time), but try some basic arithmetic or other commands to see how working on R in the command line is similar to working in RStudio.

You can run R scripts in Lonestar using the same `source(script.R)` command we used on our local machines, but it takes a bit more effort to install packages and we don't have time to cover that today. If you're curious, you can find instructions [here](https://www.cac.cornell.edu/stampede/R/packages.aspx).

To exit R, type `q()` and you'll see your regular shell command prompt again. Then type `exit` to leave the interactive job (you should see your original TACC command prompt again, something like `login1.ls4(1)$`).

Our final exercise will be running a complete (non-interactive) job on Lonestar. First, copy everything from [this example shell script](https://github.com/BioinformaticsSpring2015/BioinformaticsMaterials/blob/master/scripts/bootstrap.sh) and save in a text editor with the name `bootstrap.sh`. This command runs a boostrap analysis in PhyML, which takes much longer than a single analysis (this is why we need to submit a job for it). Note that there are multiple commands in this file, each of which assist the computer in setting up your analysis, running the analysis, and notifying you when it is complete. Update the -M command with your email and save. Then open up a new Cygwin window, navigate to the folder containing this file, and upload to Lonestar:

`scp bootstrap.sh username@lonestar.tacc.utexas.edu:.`

If you go back to the Cygwin window where you're logged in to Lonestar and list files in your home directory, you should see the file available. Now you can submit this script to run:

`qsub ./bootstrap.sh`

You should receive a print out indicating at the end that your job has been submitted. You'll also receive an email when the job moves from "queued" to "running," and another when the job is complete. 

When you are done working on TACC, you can logout by entering `exit`. This will return you to the first command prompt you saw today, and you should be able to continue working on your desktop computer.

The final task you need to perform is downloading your results from Lonestar to your local machine. We can download the results from our first PhyML (non-bootstrap analysis) using the original part of the filenames: 

`scp username@lonestar.tacc.utexas.edu:*justtree.txt .`

Then you can visualize the results using R.

###Assignment
* Due Wednesday, Mar 25 at 5 pm
* Assessment criteria
	* Technical content: 40, appropriate syntax for written assessment answers
	* Critical thinking: 40, explanations for written assessment answers
	* Documentation: 10, code comments, citations for resources used in questions embedded in answers
	* Professional behavior: 10, class participation, assignment formatting using homework template (including code formatted in `monospace`)
* Written assessment: 
	* create new file in your homework repository, `LastnameHomework`, called `LastnameWk9Homework.md". Title (header) is "Phylogenetics and remote computation".
	* Answer the following questions about the Unix tools you learned for this week's lab, including code comments where appropriate 				
	* Use appropriate Markdown formatting, including `monospace` when referencing commands you entered. 
	* If you choose to copy and paste the questions before answering, it might help to copy from the Raw view. 
	* Don't forget to preview your homework before committing! 
	* If you get stuck on a question, please consult the textbook (see readings above).
	
1. Describe two circumstances in which it would be advantageous to write a script (like bootstrap.sh) to run a command, rather than working with a point-and-click interface.
2. What Unix command would you use to transfer a file called iamgroot.txt from your local computer to your home directory in Lonestar?
3. Download your bootstrap results from TACC (or if your run failed, download the example results file, `bootstrapResults.zip` from the [data folder](https://github.com/BioinformaticsSpring2015/BioinformaticsMaterials/tree/master/data). Import the tree file (`*tree_bootstrap.txt`) into R and plot it. Include your code and comments.
4. Use the R command `nodelabels(OBJECT$node.label)`, where OBJECT is your bootstrap tree imported in question 3, to plot the bootstrap values. What support value do you show for Rat+Mouse? Include your code and comments.
5. Use the R command `data(woodmouse)` to load an alignment from the ape package. Construct and plot a distance (neighbor-joining) tree from this dataset. Include your code and comments.
6. Use the R command `data(bird.orders)` to load a dataset from the ape package. Reroot the tree with Passeriformes and save the tree to a file named `passroot.tre`. Include your code and comments.
7. Use the PhyML web server to build a phylogeny for `dna.phy.dat` under the JC69 substitution model. How does your resulting tree compare to the tree inferred from HKY85 (default settings)? 
8. How long did it take you to complete these questions?
9. Type SUBMIT as the answer to this question when you are ready for this assignment to be graded.
