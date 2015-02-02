#Unix commands: Key points


**Navigation and file management**
*   `pwd` prints user's current working directory
*   `ls` lists the current working directory
*   `cd path` changes the current working directory
*   `mkdir path` creates new directory
*   `cp old new` makes a copy of file `old` named `new`
*   `mv old new` moves (renames) a file or directory
*   `rm` removes (deletes) a file
*   `rmdir` removes (deletes) an empty directory
*	`wget URL` to download file from internet
*	`unzip` to uncompress zipped file

**Paths**
*   `/path` absolute path
*   `/` root of the filesystem 
*   `path/` relative path
*   `.` current directory 
*	`..` parent of current directory (up one level in hierarchy)
*   `*` matches zero or more characters in a filename (`*.txt` matches all files ending in `.txt`)

**Working within files**
*   `nano` text editor in shell window (use `Command X` to exit `nano`)
*   `cat` displays the contents of file(s); concatenates
*   `head` displays the first lines of a file
*   `tail` displays the last lines of a file
*   `wc` counts lines, words, and characters in file(s)
*	`cut` extracts a specified column from a character-delimited file
*   `sort` sorts a file alphabetically or numerically
*	`uniq` removes duplicate adjacent lines

**Searching files**
*   `find` searches file names and properties (type, etc.)
*   `grep` searches text within files that matches a specified pattern

**Finding help**
*   `man command` displays the manual page for a command (use `q` to exit manual)
*	`command -h` or `command --help` prints available arguments

**Combining commands**
*   `command > file` redirect, sends command output to file
*   `first | second` output of first command sent to input of second command
*   A `for` loop repeats commands once for every thing in a list:

	```
  for variable in name_1 name_2 name_3
    do
      ...commands refering to $variable...
    done
	```
	
*   Use semicolons to group multi-line commands on the same line:

	`for variable in name_1 name_2 name_3; do ...commands refering to $variable...; done`

*   Use `$name` to expand a variable (i.e., get its value)
*   `bash filename` runs commands saved in `filename`
*	`chmod u+x` gives users permission to run a script
*	`./script.sh` runs a script (with appropriate permissions)
*   `$1`, `$2`, etc., refer to specified command-line parameters
*   `$(command)` nesting or subshell; inserts a command's output in place

**Shortcuts**
*   `history` displays numbered list of recently entered commands
*	`!number` repeats a command by number from `history`
*   Tab: automatically complete unique directory and file names
*   Up arrow: redisplay a previous command
*	Drag and drop files/folders from finder to shell (in Terminal and Cygwin) to automatically enter path

Modified from Software Carpentry's [Unix command reference](https://github.com/swcarpentry/bc/blob/gh-pages/novice/ref/01-shell.md).
