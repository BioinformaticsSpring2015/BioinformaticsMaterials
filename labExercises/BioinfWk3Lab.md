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

**Downloading web content**

We're going to use the same `Examples` file from the [Practical Computing for Biologists website](http://practicalcomputing.org/downloads) as last week. This time, though, we're going to download it using the command line. Note that this exercise uses `wget` while PCB uses `curl`, but both of these commands are equivalent.

First, we need to learn how to install additional packages in Cygwin. Go to the [Cygwin website](https://www.cygwin.com) and select the page on the left to "Update Cygwin." Click on `setup-x86_64.exe` to download the file. When the download is complete, click on it to open the installer. Click through the default settings; when you need to choose a download site, select `http://missors-usa.go-parts.com`. After the mirror is reached, a page will appear directing you to select packages. Search for `wget`; it will appear in a few categories. Expand the Web category and click on Skip; it will change to Install. Then click next, then Finish. Cygwin has now been updated with a new package, `wget`.

Open up Cygwin and navigate to your Desktop. Download the file:

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
wc -c *.seq > length.txt
sort length.txt > length.sorted.txt
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

The shell will run commands inside `$()` first, then run the rest of the command on the resulting output. 

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

There are a few important parts of this type of loop structure syntax. The first, second and forth lines represent the main structure of the loop. In the first line, `filename` is a variable, meaning it represents the two files listed later. `$filename` refers to the variable in specified in the first line. You can specify whatever you'd like for the variable, but it should be somewhat descriptive for what the variable specifies. The arrows (`>`) at the beginning of the second, third and fourth lines indicate the shell is still expecting more commands, and `done` closes the loop. The third line represents the commands which will be performed across all selected files. 

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

You can save the output of this loop to a file using a redirect:

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

**Reusing scripts**

This lesson has taught you a few ways to connect several Unix commands together to make a powerful tool for obtaining information. Getting commands to work can be tricky, and you may want a way to save the work you've done for future reference. You can print the commands you've entered using `history`. In many circumstances, you may want to recall just the last few lines and save them to a file:

`history | tail -10 > unixhistory.txt`

`history` prints a line number in front of each command. You can use that number to run the same command again. For example, the following command will run the entry from line 13 again:

`!13`

saving to file

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
