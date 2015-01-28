#Bioinformatics Week 3 Lab
##Unix scripting and pipelines

Slides for the introduction to today's lab, as well as a PDF of this document, can be found on [Blackboard](http://blackboard.uttyler.edu).

###Learning Objectives
You should be able to:

1. Combine common Unix commands using multiple methods (pipes, nesting, loops, shell scripts)
2. Include comments to explain your code

###Readings:
* PCB: Chapter 5 (Handling text in the shell)
* PCB: Chapter 6 (Scripting with the shell)
* While these chapters include much of what we will discuss in class today, the same topics are also referenced at other parts of PCB (for example, Chapter 16, Advanced shell and pipelines). Check in the index at the back of the book for other mentions of particular commands! 

Additional materials for reference:
* Software Carpentry, [Pipes and Filters](http://software-carpentry.org/v5/novice/shell/03-pipefilter.html)
* Software Carpentry, [Loops](http://software-carpentry.org/v5/novice/shell/04-loop.html)
* Software Carpentry, [Shell Scripts](http://software-carpentry.org/v5/novice/shell/05-script.html)
* [PCB Cheat Sheets](http://practicalcomputing.org/files/PCfB_Appendices.pdf)

###Activities

Now that you've learned some common Unix commands, you're ready to start learning ways to link these commands together to perform more complex tasks. 

**Downloading web content**

We're going to use the same `Examples` file from the [Practical Computing for Biologists website](http://practicalcomputing.org/downloads) as last week. This time, though, we're going to download it using the command line. Note that this exercise uses `wget` while PCB uses `curl`, but both of these commands are equivalent.

First, we need to learn how to install additional packages in Cygwin. Go to the [Cygwin website](https://www.cygwin.com) and select the page on the left to "Update Cygwin." Click on `setup-x86_64.exe` to download the file. When the download is complete, click on it to open the installer. Click through the default settings; when you need to choose a download site, select `http://missors-usa.go-parts.com`. After the mirror is reached, a page will appear directing you to select packages. Search for `wget`; it will appear in a few categories. Expand the Web category and click on Skip; it will change to Install. Then click next, then Finish. Cygwin has now been updated with a new package, `wget`.

Now we're going to have a quick refresher on paths (where you are in the computer). It's easiest for us to work on files in class when we can also see them on the Desktop, so we're going to move there from our home directory (which opens in Cygwin by default). Last week week, we used `cd` followed by a drag-and-drop shortcut to get to a directory on your Desktop. It will be useful for you to know the actual path to your Desktop on the lab computers. Save this command, because you'll probably use it at least once a week. `username` is what you used to log in to the computer.

`cd /cygdrive/c/Users/username/Desktop`

It's very important to recognize where you are in the computer in relation to the files you want to manipulate! If you are getting errors while trying to run commands, first check and make sure you are specifying the correct paths. For more information, check out pg. 51 in PCB.

Now you're ready to download the file:

`wget http://practicalcomputing.org/files/pcfb_examples.zip`

The should now appear on your Desktop (and in the shell if you check with `ls`) as a zipped file. Unzip the file:

`unzip pcfb_examples.zip`

You should now see both the zipped (`pcfb_examples.zip`) and unzipped (`pcfb/`) versions. You're ready to apply the skills you learned last week!

**Pipes and nesting**

Let's say we wanted to determine the shortest sequence in `pcfb/examples`. Let's assume all sequences are in separate fasta files (that end in .seq), and the headers are all the same length. 

The first thing we need to do is determine the length of each sequence. Given the assumptions above, we can simply count the number of characters in each file.

`wc -c *.seq > length.txt`

You'll notice there is no output printed to your shell screen. The arrow (`>`) is a redirect, meaning the output is saved to the file (in this case, `length.txt`). You can view the results in Notepad++ or nano (`nano length.txt`). Note that the last line of the file is the total number of characters.

If you sort `length.txt`, the shortest fasta file will be at the top of the list:

`sort length.txt > length.sorted.txt`

Then you can print the name of only the shortest (first) file:

`head -1 length.sorted.txt`

As described above, the entire task requires three lines and outputs two extra files:

```
#determining shortest sequence

#counting number of characters in each file
wc -c *.seq > length.txt
#sorting files by length
sort length.txt > length.sorted.txt
#extracting the shortest sequence
head -1 length.sorted.txt
```

The first line is a comment. It's a note about what task the following commands perform, so it starts with `#` to tell the computer not to read it.

If you're using large data files, you may not want to save extra files. There's also a shorter (fewer keystrokes) way to connect these commands together, using a pipe (`|`). The following single line is equivalent to the three lines above:

```
#determining shortest sequence
wc -c *.seq | sort | head -1
```

Connecting commands using pipes is a very powerful way to filter files and/or their contents.

Another way to combine Unix commands is by nesting one command inside another. From `pcfb/examples`, try the following command to find the names of authors for all Protein Databank Files in our folder:

`grep "AUTHOR" $(find . -name '*.pdb')`

`$()` is a subshell; the shell runs commands contained within it first, then runs the rest of the command on the resulting output. 

**Loops**

Sometimes you may want to perform repeated tasks on a set of files. It may seem like you could use wildcards to perform the same tasks across many files in a directory. For example, if you want to create copies of two data files (`file1.txt` and `file2.txt`) to backup your work, you might try the following command:

`cp *.txt backup.*.txt`

In the best case scenario (depending on the version of your program), your attempt to back up your files would return an error. In the worst case scenario, the shell would expand the first wildcard and accidentally overwrite one of them!

The solution to this dilemma is to use a programming structure called a loop, which performs the same task for a series of pre-defined files. Here is the syntax, using two files from `pcfb/examples`:

```
$ for filename in FEC00001_1.seq FEC00002_1.seq
> do
>    cp $filename backup.$filename
> done
```

If you run this command, you will see nothing print to the screen. You should have produced two duplicate sequence files with `backup.` as a prefix.

There are a few important parts of this type of loop structure syntax. The first, second and forth lines represent the main structure of the loop. In the first line, `filename` is a variable, meaning it represents the two files listed later. `$filename` refers to the variable in specified in the first line. You can specify whatever name you'd like for the variable, but it should be somewhat descriptive for what the variable specifies. The arrows (`>`) at the beginning of the second, third and fourth lines indicate the shell is still expecting more commands, and `done` closes the loop. The third line represents the commands which will be performed across all selected files. 

Here is a loop which performs the same action, but is slightly more refined:

```
$ for filename in *.seq
> do
>    echo $filename
>    cp $filename backup.$filename
> done
```

In this example, you should have seen the file names for all ten files ending in .seq in the examples directory printed to your screen. You will also have backups for each of those files. 

If you use the up arrow to recall the last command, you will see it formatted differently than you input it:

`$ for filename in *.seq; do echo $filename; wc $filename; done`

We write loops in multiple lines (with indentation) to help us read the structure better, but you can also enter them with lines divided by semi-colons.

The goal of the previous example was to copy files. For other tasks, you may be more interested in the text output from each loop:

```
$ for filename in *.seq
> do
>    echo $filename
>    wc $filename
> done
```

In this case, `echo` just lists the name of the file so you can view it in the output. You can save the output of this loop to a file using a redirect:

```
$ for filename in *.seq
> do
>    echo $filename
>    wc $filename
> done > seqlengthsall.txt
```

However, this saves both the names from `echo` AND the report from `wc` in the same file. If you just want to save the report from `wc`, you'll need to use a redirect that appends to the previous file, instead of overwriting:

```
$ for filename in *.seq
> do
>    echo $filename
>    wc $filename >> seqlengthsonly.txt
> done
```

This way, you can see the progress of the script as it runs (as names are printed to the screen), but the main results are printed to a file.

**Reusing scripts**

This lesson has taught you a few ways to connect several Unix commands together to make a powerful tool for obtaining information. Getting commands to work can be tricky, and you may want a way to save the work you've done for future reference. You can print the commands you've entered using `history`. In many circumstances, you may want to recall just the last few lines and save them to a file:

`history | tail -10 > unixhistory.txt`

`history` prints a line number in front of each command. You can use that number to run the same command again. For example, the following command will run the entry from line 13 again:

`!13`

You might also be interested in using the same series of commands on other files. To save time and to avoid mistakes in typing, you could save the commands as a script (i.e., in a separate text file). 

Let's suppose you wanted a script that would create a dataset for testing new scripts by removing the header from a character-delimited dataset and printing the first 5 lines of data. We can test this using `pcfb/examples/shaver_etal.csv`:

`tail -n +2 shaver_etal.csv | head -5`

Once you test this script to ensure that it works the way you'd like, you can open a new text file and enter the code:

```
#! /bin/bash

#making test dataset from shaver_etal.csv
tail -n +2 shaver_etal.csv | head -5 > test.shaver_etal.csv
```

The first line begins with a shebang (`#!`) to tell the computer to use bash (the shell we're using) to interpret the commands. We've also included a redirect to save the output to a file. Save this file as `test.sh` (the file suffix indicates it's a shell script).

If you go back to the command line, you can run this script again:

`bash test.sh`

You should see the resulting file created. If you open it up in a text editor, you will see the five lines of data as expected. 

This command doesn't completely solve our problem, though, because we wanted to use the script for other data files. A few modifications to the saved script allow this to happen:

```
#! /bin/bash

#making test dataset from file entered on command line
tail -n +2 $1 | head -5 > test.$1
```

Here, `$1` is a variable indicating the first thing entered on the command line. Test this new script on another file from `pcfb/examples`:

`bash test.sh ThalassocalyceData.txt`

You should see `test.ThalassocalyceData.txt` created, which you can compare with the original file and confirm the script worked. 

Now we are going to make this script an executable. Use `ls -l` to list the details of each file in your directory. There shouldn't be any x's next to test.sh. You can confirm this by the error that appears when you try:

`./test.sh japetella_respiration.txt`

Because this is a shell script, we have to specify for the computer where the script is located (`./`). Permission to read, write, and execute files is controlled by a command called `chmod`. You can add permissions for all users to use the file:

`chmod u+x test.sh`

Now you will see x's, indicating permission to use/execute the file, when you view file details. The file should run now:

`./test.sh japetella_respiration.txt`

Ideally, we would set up a permanent folder on this computer for you to save your scripts, and also configure the shell for you to be able to run scripts in this folder more easily. Unfortunately, the configuration of these computerYou can read more about setting up your personal computer, adding scripts to your path, and file permissions in PCB Chapter 6.

###Practice exercises (not part of your assignment, just for practice)

Use Unix commands to complete the following tasks. Your answers for these will not be graded for credit.

1. How many Carex species are in this data table: http://datadryad.org/bitstream/handle/10255/dryad.38186/cyp_states.csv
2. Assume you have a directory containing hundreds of different kinds of files. Write a command that would find all `.txt` files containing the word `arugula`.
3. Download `whenWhoWhere.sh` from [BioinformaticsMaterials/scripts](https://github.com/BioinformaticsSpring2015/BioinformaticsMaterials/tree/wk3/scripts/whenWhoWhere.sh). Run this script (no additional files are required) and describe the output.
4. What is the difference between `wc -l input.txt` and `wc -l < input.txt`? Try out these commands on a file from the `pcfb/examples`.

###Assignment
* Due Tuesday, Feb 3 at 5 pm
* Assessment criteria
	* Technical content X, appropriate syntax for written assessment answers
	* Critical thinking X, explanations for written assessment answers
	* Documentation: 5, citations for resources used in questions embedded in answers
	* Professional behavior: 10, class participation, assignment formatting using homework template (including code formatted in `monospace`)
* :pencil2: Written assessment: 
	* create new file in your homework repository, `LastnameHomework`, called `LastnameWk3Homework.md". Title (header) is "Unix scripting and pipelines." 
	* Answer the following questions about the Unix tools you learned for this week's lab, including code comments where appropriate 				
	* Use appropriate Markdown formatting, including `monospace` when referencing commands you entered. 
	* If you choose to copy and paste the questions before answering, it might help to copy from the Raw view. 
	* Don't forget to preview your homework before committing! 
	* If you get stuck on a question, please consult the textbook (see readings above).

1.  Why would it be a very bad idea to use the command `chmod o-r test.sh`?
2.  Take a look at `whenWhoWhere.sh` in [BioinformaticsMaterials/scripts](https://github.com/BioinformaticsSpring2015/BioinformaticsMaterials/tree/wk3/scripts). Copy and paste the contents of this script into your answers and add comments that indicate what each step does. 
3. Write a sentence to describe what happens at each step in the following pipeline. Assume each file contains columns of only numerical data. 
`cat data1.txt data2.txt | sort -n | cut -d "," -f 1 > processedData.txt`
4. Write a sentence to describe why variables are so useful in shell scripts.
5.  Concatenate the `FEC*.seq` files from `pcfb/examples` into one file named `concatenated.seq`. Include your commands.
6.  List all latitudes in `pcfb/examples/LatLon.txt` and save to a file called `Lat.txt`. Include you commands.
7.  Make a list of unique SITES from shaver_etal.csv in `pcfb/examples` using Unix commands. Include your code.
8.  Write a script to print the last five commands you entered in the shell.
9.  How many woody species are in this data file: http://datadryad.org/bitstream/handle/10255/dryad.59002/GlobalWoodinessDatabase.csv? You can find the README for this file here: http://datadryad.org/bitstream/handle/10255/dryad.59002/README.txt. Include the code you used to determine your answer, including downloading the file.
10. Write a loop that will make a copy of every file in a directory, adding the work "backup" to the beginning of the copy's filename. Don't forget to include comments that describe the actions your script performs. Save this command as a shell script and upload to your GitHub homework repository as a new file named `Week3.sh`
11. How long did it take you to complete these questions?
12. Type SUBMIT as the answer to this question when you are ready for this assignment to be graded.
