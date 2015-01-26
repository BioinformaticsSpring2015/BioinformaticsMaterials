#Bioinformatics Week 3 Lab
##Unix scripting and pipelines

Slides for the introduction to today's lab, as well as a PDF of this document, can be found on [Blackboard](http://blackboard.uttyler.edu).

###Learning Objectives
You should be able to:

1. Combine common Unix commands using multiple methods
2. Include comments to explain your code

###Readings:
* PCB: Chapter 5 (Handling text in the shell)
* PCB: Chapter 6 (Scripting with the shell)

Additional materials for reference:
* Software Carpentry, [Pipes and Filters](http://software-carpentry.org/v5/novice/shell/03-pipefilter.html)
* Software Carpentry, [Loops](http://software-carpentry.org/v5/novice/shell/04-loop.html)
* Software Carpentry, [Shell Scripts](http://software-carpentry.org/v5/novice/shell/05-script.html)
* [PCB Cheat Sheets](http://practicalcomputing.org/files/PCfB_Appendices.pdf)

###Activities

Now that you've learned some common Unix commands, you're ready to start learning ways to link these commands together to perform more complex tasks. 

Just like last week, download the `Examples` file from the [Practical Computing for Biologists website](http://practicalcomputing.org/downloads). Unzip the file and move it to your Desktop. Open up Cygwin and navigate to the file by using `cd` and dragging-and-dropping the file into your shell.

**Pipes**

Let's say we wanted to determine the shortest sequence in `pcfb/examples`. Let's assume all sequences are in separate fasta files (that end in .seq), and the headers are all the same length. 

The first thing we need to do is determine the length of each sequence. Given the assumptions above, we can simply count the number of characters in each file.

`wc -c *.seq > length.txt`

You'll notice there is no output printed to your shell screen. The arrow `>` means the output is saved to the file (in this case, `legnth.txt`). You can view the results in Notepad++ or nano (`nano length.txt`). Note that the last line of the file is the total number of characters.

If you sort `length.txt`, the shortest fasta file will be at the top of the list:

`sort length.txt > length.sorted.txt`

Then you can print the name of only the shortest (first) file:

`head -1 length.sorted.txt`

As described above, the entire task requires three lines and outputs two extra files:

```
#determining shortest sequence
wc -c *.seq > length.txt
sort length.txt > length.sorted.txt
head -1 length.sorted.txt
```

The first line starts is a comment. It's a note about what task the following commands perform, so it starts with `#` to tell the computer not to read it.

If you're using large data files, you may not want to save extra files. There's also a shorter (fewer keystrokes) way to connect these commands together, using a pipe (`|`). The following single line is equivalent to the three lines above:

```
#determining shortest sequence
wc -c *.seq | sort | head -1
```

nesting

Loops

appending

running scripts from files

permissions

###Assessment
* Due Tuesday, Jan X at 5 pm
* Assessment criteria
	* Technical content X, appropriate syntax for written assessment answers
	* Critical thinking X, explanations for written assessment answers
	* Documentation: 5, citations for resources used in questions embedded in answers
	* Professional behavior: 10, class participation, assignment formatting using homework template (including code formatted in `monospace`)
* :pencil2: Written assessment: create new file in your homework repository, `LastnameHomework`, called `LastnameWk3Homework.md`. Title (header) is "Unix scripting and pipelines." Answer the following questions about the Unix tools you learned for this week's lab. Use appropriate Markdown formatting, including `monospace` when referencing commands you entered. Don't forget to preview your homework before committing!

1. pseudocode
2. code with comments
3. 
