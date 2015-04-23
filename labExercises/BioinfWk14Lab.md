#Bioinformatics Week 13 Lab
##Wrapping up

Slides for the introduction to today's lab, as well as a PDF of this document, can be found on [Blackboard](http://blackboard.uttyler.edu).

###Learning Objectives
You should be able to:

1. Design a workflow to answer specified questions
2. Write code to accomplish each step in the workflow

###Readings:
* [R cheat sheet](https://github.com/BioinformaticsSpring2015/BioinformaticsMaterials/blob/master/ref/Rref.md)

###Activities

Over the last few weeks, we used the online Galaxy interface to develop and implement workflows to perform next-generation sequencing analysis. Today we're going back to R to design and implement a workflow to answer a few specific questions. We'll apply tools we already learn to manipulate data and obtain a meaningful answer.

One of the big questions in bioinformatics is accessing information. We've worked with several databases this semester, and today we'll revisit two of them to compare what data is available. We can phrase this objective as a question: for a given taxon, are there the same number of sequences in BOLD and Entrez? We'll also use some of the data we obtain to look at diversity within a group of organisms. This second question becomes: are sequences from the same taxon very similar? Together we will plan and implement a series of steps in R to answer these two quesitons.

Today's lab:
* Pick a genus of animal (you'll need to know the scientific name). You will collect data on this animal and compile it with data from the rest of the class to test whether both databases contain the same number of sequences per taxon.
* With the help of your instructor, develop a plan to obtain data from the databases (first question).
* Implement your plan to collect these data and compile the class results.
* With the help of your instructor, develop a plan to describe diversity in your extracted sequences (second question).
* Implement your plan and interpret your results.

###Assignment
* Due Wednesday, April 29 at 5 pm (but you should be able to finish before you leave today!)
* Assessment criteria
	* Technical content: 40, appropriate syntax for written assessment answers
	* Critical thinking: 40, explanations for written assessment answers
	* Documentation: 10, code comments, citations for resources used in questions embedded in answers
	* Professional behavior: 10, class participation, assignment formatting using homework template (including code formatted in `monospace`)
* Written assessment: 
	* create new file in your homework repository, `LastnameHomework`, called `LastnameWk10Homework.md". Title (header) is "Wrapping up".
	* Answer the following questions
	* Use appropriate Markdown formatting 
	* If you choose to copy and paste the questions before answering, it might help to copy from the Raw view. 
	* Don't forget to preview your homework before committing! 
	* If you get stuck on a question, please consult readings above.

1. Outline the steps (in human-readable language) used to conduct today's workflow.
2. Enter all code (with comments) used to accomplish today's workflow.
3. Do BOLD and Entrez contain different numbers of sequences for the species our class sampled today? How do you know?
4. How long did it take you to obtain these data for one taxon? How long do you estimate it would take you to use your code to obtain data for another taxon? When would it be worth the time to write the code, rather than performing these tasks with online tools? 
5. Type SUBMIT as the answer to this question when you are ready for this assignment to be graded.
