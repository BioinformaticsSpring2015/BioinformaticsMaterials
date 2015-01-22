#Bioinformatics Week 2 Lab
##Unix and command line interface

Slides for the introduction to today's lab, as well as a PDF of this document, can be found on [Blackboard](http://blackboard.uttyler.edu).

###Learning Objectives
You should be able to:

1. Apply basic unix shell scripting commands to navigate and manipulate files in the command line.
2. Understand why and how to view text files in a text editor (i.e., Notepad++) and in the command line (Unix shell).

###Readings:
* PCB: Chapter 1 (Getting set up)
* PCB: Chapter 4 (Command-line operations: the shell)
 
More information about wildcards and regular expressions:
* PCB: Chapter 2 (Regular Expressions: Powerful search and replace)
* PCB: Chapter 3 (Exploring the flexibility of regular expressions)

Additional materials for reference:
* Software Carpentry, [Introducing the Shell](http://software-carpentry.org/v5/novice/shell/00-intro.html)
* Software Carpentry, [Files and Directories](http://software-carpentry.org/v5/novice/shell/01-filedir.html)
* Software Carpentry, [Creating Things](http://software-carpentry.org/v5/novice/shell/02-create.html)
* [PCB Cheat Sheets](http://practicalcomputing.org/files/PCfB_Appendices.pdf)

###Activities

The exercises we'll work on today are explained clearly in PCB (relevant material in the chapters listed above). Additional materials are included for reference if you have difficulty and would like additional explanation. If you are working on the lab computers, the text editor you use will be Notepad++ instead of TextWrangler (as referenced in PCB). Similarly, you will be using a Cygwin shell emulator instead of Terminal, as the text describes. More inforamtion on using Windows instead of the book's assumed MacOSX can be found in PCB Appendix 1.

The questions listed in these activities are just to make sure you're thinking about what you're doing! The questions for your assignment this week are under **Assessment** (below).

**Set up your files**

1. Go to the [PCB website](http://practicalcomputing.org/downloads) and download the file `Examples`.
2. Unzip the file (`pcfb`) and place it in on your Desktop. 

During today's exercises, if you accidentally delete or overwrite a file in this folder, don't worry! You can always redownload it.

This introduction to the Unix shell will show you some powerful tools for working with files in the command line. This is not a comprehensive introduction, but you will learn some of the most common commands using Cygwin, a shell emulator for Windows, which is already installed on the lab computers.

**Navigation and file management**

Open up Cygwin. You'll see a black screen and a prompt to enter text.

To find out where in the computer you, type the following and press `Enter`:

`pwd`

This is your home directory, which begins with `/`. The path, or string of directories listed from this command, is how the computer knows to access particular files. 

We're going to move to the `pcfb` folder. Enter `cd` and then drag-and-drop the folder from the Desktop into the shell window. This is a shortcut to getting to the appropriate place in the computer.

In a shell, you enter text commands and hit `Enter` to tell the computer what to do. To find out what is contained in the current directory:

`ls`

You can compare this to what you see in the Windows Explorer window. Are the same files there?

You can add arguments to each command to give you more information. For example, to find out if the results you received from the previous command are files or directories:

`ls -F`

There are often many possible arguments (also called flags or options) for most commands. There are a few ways to find out what options are available. Some will work better on different computers (Mac vs. Windows, or based on installed software), so it's worth it to know them all. For example:

`ls -h`
`ls --help`
`man ls`

The `-h` and `--help` options will print the help information to the screen. `man` is short for manual, and takes you to another screen where you can scroll through a more extensive description (use `q` to exit this screen).

You can also create things in the shell. To make a directory:

`mkdir testFolder`

How do you check to see if a folder was created? Why is `testFolder` one word, instead of with spaces?

Remember how to navigate through directories:

`cd testFolder`

You can use `tab` as a shortcut to complete paths and filenames, if the name you are entering is unique. Try entering the partial filename and then `tab`.

We can also move up in the file hierarchy (for example, to our home directory):

`cd ..`

Now navigate into the `examples` folder. Can you list the files here?

Make a copy of the `LatLon.txt` file, calling the new copy `test.txt`:

`cp LatLon.txt test.txt`

You can also rename files (move them from one filename to another). The same command can be used to move files to different directories. Filenames can include paths if you're moving between directories:

```
mv test.txt new.txt
mv new.txt ../new.txt
```

Practice exercise: Navigate back to your home directory, and copy `new.txt` to `testFolder`.

From your home directory, you can also delete the original `new.txt` from `pcfb/examples`:

`rm pcfb/examples/new.txt`

How do you check to see if the file has been removed? Remember that removing a file deletes it forever (there is no undo). Use these commands carefully!

Try using this command on `testFolder`. What happens?

You need a special command to delete directories:

`rmdir testFolder`

But this doesn't work either! Why not? What can you do to fix this? Try a Google search if you get stuck.

**Working within files**

Using Windows Explorer, go to `pcfb/examples` and open `LatLon.txt` in Notepad++.

You can view the same file similarly through the shell. Make sure you have navigated to the appropriate folder and then open `LatLon.txt` using the program `nano`.

`nano LatLon.txt`

This will take you to a new window where you can use arrows to move throughout the text within the file, make alterations, copy, and paste. There are notes at the bottom of your screen which remind you of common commands, including how to exit (`command x`). `nano` is a convenient way to quickly view files without having to switch windows or programs.

You can also directly print text to the screen:

`cat LatLon.txt`

While cat is useful for small files, you may not want to see everything in a large file printed directly into your shell. You can also just print only the first few lines of a file, which is useful if you want to see if there is a header, or what the delimiters might be:

`head LatLon.txt`

You can specify the exact number of lines:

`head -5 LatLon.txt`

To view the last few lines of a file:

`tail -5 LatLon.txt`

These viewing options aren't that important for a small file like `LatLon.txt`, but try viewing a larger file like `ctd.txt`.

There are two additional programs that you may find useful for viewing files (scrolling, but not editing): `more` and `less`. Try looking up the help documentation for these commands.

The following command is short for word count, and can tell you lots of information about how much text is included in the file:

`wc ctd.txt`

Use the help documentation to tell you what the output numbers mean.

You can use different options to limit the output. For example, the number of lines can be assessed using:

`wc -l ctd.txt`

So far, we've only really been working with entire files. There are several useful shell commands that can help you extract information from or organize files.

First, take a look at `ctd.txt` and determine the delimiter. You'll need this to tell commands how to interpret the file.

For data arranged in columns and rows, you can remove all but particular columns:

`cut -f 1 -d "," ctd.txt`

In this case, `-f 1` refers to the first field (column), and `-d ","` specifies that the columns are separated by commas.

You can also sort a file:

`sort ctd.txt`

What criteria does sort use? Try sorting `ctd.txt`. What happens to the header, and why?

You can also easily find all unique lines in a file, to make sure you haven't duplicated data:

`uniq LatLon.txt`

How did these results compare to the original file?

**Searching files**

An alternative to Windows Search (or Mac Finder) are two shell commands: `find` and `grep`.

Use `find` to search file names and types. For example, you can list all of the files in `pcfb/examples`:

`find . -type f`

How does this command differ from using `ls` in this directory? 

`find` is recursive, which means it searches a directory, then searches all directories within that directory, iteratively.

Note the difference in syntax. What does the period indicate? There is an alternative way to perform the same task:

`find . -name "*.*"`

What does the asterisk (`*`) indicate?

Open up Notepad++. You are probably already familiar with ways to search within text for a full or partial word. If you open a search window and select "Regular Expression" under search mode, you'll be able to use more advanced searching techniques that are very useful for working with data files. You can 

`grep` is somewhat analogous to the search command in a text editor, because You can use it to search within a file. For example, if you wanted to find all latitudes in the northern hemisphere:

`grep "N" LatLon.txt`

Is `grep` case sensitive? Let's try:

`grep "n" LatLon.txt`

Did you get the same results?

`grep` searches can also be very specific.

There are other "flavors" of `grep`, like `egrep`, that include additional options. There are also many other options for `grep`, this flexibility is the most powerful parts of the program. The biggest challenge is the implementation of regular expressions. Go to [RegexOne](http://regexone.com) and work through the tutorials to familiarize yourself with available options.

**Reminders about the Unix shell**
* Avoid spaces in file names
* Everything is case sensitive
* Paths are important!
* Shortcut: Use tab to complete unique paths
* Shortcut: arrow up to repeat or modify the last command 
* Use `-h` after a command to read the help page

###Assessment
* Due Tuesday, Jan 27 at 5 pm
* Assessment criteria
	* Technical content 55, appropriate syntax for written assessment answers
	* Critical thinking 30, explanations for written assessment answers
	* Documentation: 5, citations for resources used in questions embedded in answers
	* Professional behavior: 10, class participation, assignment formatting using homework template (including code formatted in `monospace`)
* :pencil2: Written assessment: create new file in your homework repository, `LastnameHomework`, called `LastnameWk2Homework.md". Title (header) is "Unix commands and text editors." Answer the following questions about the Unix tools you learned for this week's lab. Use appropriate Markdown formatting, including `monospace` when referencing commands you entered. Don't forget to preview your homework before committing!

1. What series of commands would you use to copy a file named `CopyMe.txt`, rename it `renamed.txt`, and then delete the original file?
2. What happens when you enter the command `cd` without a directory name?
3. Name two ways you could determine what `ls -f` would do if you entered it as a command. What action does the command perform?
4. What actions do the commands `sort` and `uniq` perform? Why is it recommended that `sort` be performed before `uniq`?
5. What is the difference between `grep` and `find`?
6. Download the Example unaligned FASTA DNA file from [here](http://www.molecularevolution.org/resources/fileformats). After clicking on the link to download, you may need to save the page (it should auto-detect it's a text file and add `.txt` to the end). Use a shell script to determine the number of lines in this file, and include the script and the answer.
7. Use a shell script to determine the number of sequences in the file from Question 6, and include the script and the answer.
8. What would be the problem with using `sort` on the file from Question 6?
9. Why is it a bad idea to create a directory named `new folder`?
10. What will be the result of the following command: `cp file.txt file2.txt file3.txt`?
11. What will happen if you perform the following command: `mv file1.txt folder/`?
12. Is there a difference between `mv myfile ./myfile2` and `mv myfile /myfile2`?
13. Suppose that:
```
$ ls -F
new/ old/ yaks.txt zebras.txt
```
What command(s) would you need to run so that the following output were accurate?
```
$ ls
new   old
$ ls old/
yaks.txt    zebras.txt
```

14.Given the following data file, what is the header and what is the delimiter?
```
nucleotides genes proteins
150,456 435 302 150
175,321 567 342 120
```
15.You have a directory called `Food` containing files with receipts for grocery purchases. Each file contains a different list, similar to this one:
```
bagels	$4.00
bananas	$2.00
milk	$2.00
pineapple	$2.00
```
Write a script that would extract the prices for every purchase of milk.
