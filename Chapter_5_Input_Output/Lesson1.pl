# Input from Standard Input
# Reading from the standard input stream is easy. You’ve been doing it already with the
# <STDIN> operator. Evaluating this operator in a scalar context gives you the next line
# of input:

# $line = <STDIN>; # read the next line
# chomp($line); # and chomp it
# print "$line\n"

# What we’re calling the line-input operator here, <STDIN>, is actually a line-input oper‐
# ator (represented by the angle brackets) around a filehandle. You’ll learn about file‐
# handles later in this chapter.
# Since the line-input operator will return undef when you reach end-of-file, this is
# handy for dropping out of loops:

# while (defined($line = <STDIN>)) {
#     print "I Saw $line";
# }

# There’s a lot going on in that first line: you’re reading the input into a variable, check‐
# ing that it’s defined, and if it is (meaning that we haven’t reached the end of the
# input), you’re running the body of the while loop. So, inside the body of the loop,
# you’ll see each line, one after another, in $line. This is something you’ll want to do
# fairly often, so naturally Perl has a shortcut for it. The shortcut looks like this:

# while (<STDIN>) {
#     print "I saw $_";
# }

# Input from the Diamond Operator
# Another way to read input is with the diamond operator: <>. This is useful for mak‐
# ing programs that work like standard Unix utilities, with respect to the invocation
# arguments (which we’ll see in a moment). If you want to make a Perl program that
# can be used like the utilities cat, sed, awk, sort, grep, lpr, and many others, the dia‐
# mond operator will be your friend. If you want to make anything else, the diamond
# operator probably won’t help.

# The invocation arguments to a program are normally a number of “words” on the
# command line after the name of the program. In this case, they give the names of the
# files your program will process in sequence:
# $ ./my_program fred barney betty
# That command means to run the command my_program (which will be found in the
# current directory), and that it should process file fred, followed by file barney, fol‐
# lowed by file betty.
# If you give no invocation arguments, the program should process the standard input
# stream. Or, as a special case, if you give just a hyphen as one of the arguments, that
# means standard input as well. So, if the invocation arguments had been fred - betty,
# that would have meant that the program should process file fred, followed by the
# standard input stream, followed by file betty.

# The benefit of making your programs work like this is that you may choose where the
# program gets its input at runtime; for example, you won’t have to rewrite the program
# to use it in a pipeline (which we’ll show more later). Larry put this feature into Perl
# because he wanted to make it easy for you to write your own programs that work like
# standard Unix utilities—even on non-Unix machines. Actually, he did it so he could
# make his own programs work like standard Unix utilities; since some vendors’ utilit‐
# ies don’t work just like others’, Larry could make his own utilities, deploy them on a
# number of machines, and know that they’d all have the same behavior. Of course, this
# meant porting Perl to every machine he could find.
# The diamond operator is actually a special kind of line-input operator. But instead of
# getting the input from the keyboard, it comes from the user’s choice of input:
# while (defined($line = <>)) {
#     chomp($line);
#     print "It was $line that I saw!\n";
# }
# So, if you run this program with the invocation arguments fred, barney, and betty,
# it will say something like: “It was [a line from file fred] that I saw!”, “It was [another
# line from file fred] that I saw!”, on and on until it reaches the end of file fred. Then it
# will automatically go on to file barney, printing out one line after another, and then
# on through file betty. Note that there’s no break when you go from one file to another;
# when you use the diamond, it’s as if the input files have been merged into one big file.
# The diamond will return undef (and we’ll drop out of the while loop) only at the end
# of all of the input.

# The Invocation Arguments
# Technically, the diamond operator isn’t looking literally at the invocation arguments
# —it works from the @ARGV array. This array is a special array that is preset by the Perl
# interpreter as the list of the invocation arguments. In other words, this is just like any
# other array (except for its funny, all-caps name), but when your program starts, @ARGV
# is already stuffed full of the list of invocation arguments

# You can use @ARGV just like any other array; you could shift items off of it, perhaps,
# or use foreach to iterate over it. You could even check to see if any arguments start
# with a hyphen so that you could process them as invocation options (like Perl does
# with its own -w option).

# The diamond operator looks in @ARGV to determine what filenames it should use. If it
# finds an empty list, it uses the standard input stream; otherwise, it uses the list of files
# that it finds. This means that after your program starts and before you start using the
# diamond, you’ve got a chance to tinker with @ARGV. For example, you can process
# three specific files, regardless of what the user chose on the command line:

# @ARGV = qw# larry moe curly #; # force these three files to be read
# while (<>) {
#     chomp;
#     print "It was $_ that I saw in some stooge-like file!\n";
# }

# Output to Standard Output
# The print operator takes a list of values and sends each item (as a string, of course)
# to standard output in turn, one after another. It doesn’t add any extra characters
# before, after, or in between the items; if you want spaces between items and a newline
# at the end, you have to say so:

# $name = "Larry Wall";
# print "Hello there, $name, did you know that 3+4 is ", 3+4, "?\n";

# Of course, that means that there’s a difference between printing an array and interpo‐
# lating an array:

# print @array; # print a list of items
# print "@array"; # print a string (containing an interpolated array)

# That first print statement will print a list of items, one after another, with no spaces
# in between. The second one will print exactly one item, which is the string you get by
# interpolating @array into the empty string—that is, it prints the contents of @array,
# separated by spaces. So, if @array holds qw/ fred barney betty /, the first one
# prints fredbarneybetty, while the second prints fred barney betty separated by
# spaces. But before you decide to always use the second form, imagine that @array is a
# list of unchomped lines of input. That is, imagine that each of its strings has a trailing
# newline character. Now, the first print statement prints fred, barney, and betty on
# three separate lines. But the second one prints this:

# fred
#  barney
#  betty

# Do you see where the spaces come from? Perl is interpolating an array, so it puts
# spaces between the elements (actually, whatever is in the variable $"). So we get the
# first element of the array (fred and a newline character), then a space, then the next
# element of the array (barney and a newline character), then a space, then the last ele‐
# ment of the array (betty and a newline character). The result is that the lines seem to
# have become indented, except for the first one.
# Every week or two, we encounter a question like “Perl indents everything after the
# first line.” Without even reading the message, we can immediately see that the pro‐
# gram used double quotes around an array containing unchomped strings. “Did you
# perhaps put an array of unchomped strings inside double quotes?” we ask, and the
# answer is always “yes.”
# Generally, if your strings contain newlines, you simply want to print them, after all:
# print @array;
# But if they don’t contain newlines, you generally want to add one at the end:
# print "@array\n";
# So, if you use the quote marks, you’re (generally) adding the \n at the end of the
# string anyway; this should help you remember which is which.
# It’s normal for your program’s output to be buffered. That is, instead of sending out
# every little bit of output at once, your program saves the output until there’s enough
# to bother with.

# Formatted Output with printf
# You may wish to have a little more control with your output than print provides. In
# fact, you may be accustomed to the formatted output of C’s printf function. Fear
# not! Perl provides a comparable operation with the same name.
# The printf operator takes a template string followed by a list of things to print. That
# string is a fill-in-the-blanks template showing the desired form of the output:
$user = "William";
$days_to_die = 4;
printf "Hello, %s; your password expires in %d days!\n", $user, $days_to_die;

# The template string holds a number of so-called conversions; each conversion begins
# with a percent sign (%) and ends with a letter. (As you’ll see in a moment, there may
# be significant extra characters between these two symbols.) There should be the same
# number of items in the following list as there are conversions; if these don’t match up,
# it won’t work correctly. In the preceding example, there are two items and two con‐
# versions, so the output might look something like this:
# Hello, merlyn; your password expires in 3 days!
# There are many possible printf conversions, so we’ll take time here to describe just
# the most common ones. Of course, the full details are available in the perlfunc
# documentation.
# To print a number in what’s generally a good way, use %g, which automatically choo‐
# ses floating-point, integer, or even exponential notation, as needed

# Filehandles
# You name these filehandles just like other Perl identifiers: letters, digits, and under‐
# scores (but not starting with a digit). The bareword filehandles don’t have any prefix
# character, so Perl might confuse them with present or future reserved words, or with
# labels, which you’ll see in Chapter 10. Once again, as with labels, the recommenda‐
# tion from Larry is that you use all uppercase letters in the name of your filehandle—
# not only does it stand out better, but it also guarantees that your program won’t fail
# when Perl introduces a future (always lowercase) reserved word.
# But there are also six special filehandle names that Perl already uses for its own pur‐
# poses: STDIN, STDOUT, STDERR, DATA, ARGV, and ARGVOUT. Although you may choose
# any filehandle name you like, you shouldn’t choose one of those six unless you intend
# to use that one’s special properties.
# Maybe you recognized some of those names already. When your program starts,
# STDIN is the filehandle naming the connection between the Perl process and wherever
# the program should get its input, known as the standard input stream. This is gener‐
# ally the user’s keyboard unless the user asked for something else to be the source of
# input, such as a file or the output of another program through a pipe.
# There’s also the standard output stream, which is STDOUT. By default, this one goes to
# the user’s display screen, but the user may send the output to a file or to another pro‐
# gram, as you’ll see shortly. These standard streams come to you from the Unix “stan‐
# dard I/O” library, but they work in much the same way on most modern operating
# systems. The general idea is that your program should blindly read from STDIN and
# blindly write to STDOUT, trusting in the user (or generally whichever program is start‐
# ing your program) to have set those up. In that way, the user can type a command like
# this one at the shell prompt:
# $ ./your_program <dino >wilma
# That command tells the shell that the program’s input should be read from the file
# dino, and the output should go to the file wilma. As long as the program blindly reads
# its input from STDIN, processes it (in whatever way we need), and blindly writes its
# output to STDOUT, this will work just fine.
# And at no extra charge, the program will work in a pipeline. This is another concept
# from Unix, which lets us write command lines like this one:
# $ cat fred barney | sort | ./your_program | grep something | lpr
# Now, if you’re not familiar with these Unix commands, that’s OK. This line says that
# the cat command should print out all of the lines of file fred followed by all of the
# lines of file barney. Then that output should be the input of the sort command, which
# sorts those lines and passes them on to your_program. After it has done its process‐
# ing, your_program sends the data on to grep, which discards certain lines in the data,
# sending the others on to the lpr command, which should print everything that it gets
# on a printer. Whew!
# Pipelines like that are common in Unix and many other systems today because they
# let you build powerful, complex commands out of simple, standard building blocks.
# Each building block does one thing very well, and it’s your job to use them together in
# the right way.
# There’s one more standard I/O stream. If (in the previous example) your_program
# had to emit any warnings or other diagnostic messages, those shouldn’t go down the
# pipeline. The grep command is set to discard anything that it hasn’t specifically been
# told to look for, and so it will most likely discard the warnings. Even if it did keep the
# warnings, you probably don’t want to pass them downstream to the other programs
# in the pipeline. So that’s why there’s also the standard error stream: STDERR. Even if the
# standard output is going to another program or file, the errors will go to wherever the
# user desires. By default, the errors will generally go to the user’s display screen, but
# the user may send the errors to a file with a shell command like this one:
# $ netstat | ./your_program 2>/tmp/my_errors
# Generally, errors aren’t buffered. That means that if the standard error and standard
# output streams are both going to the same place (such as the monitor), the errors
# may appear earlier than the normal output. For example, if your program prints a line
# of ordinary text, then tries to divide by zero, the output may show the message about
# dividing by zero first, and the ordinary text second.


# Filehandles
# A filehandle is the name in a Perl program for an I/O connection between your Perl
# process and the outside world. That is, it’s the name of a connection, not necessarily
# the name of a file. Indeed, Perl has mechanisms to connect a filehandle to almost any‐
# thing.

# Fatal Errors with die
# Step aside for a moment. You need some stuff that isn’t directly related to (or limited
# to) I/O but is more about getting out of a program earlier than normal.
# When a fatal error happens inside Perl (for example, if you divide by zero, use an
# invalid regular expression, or call a subroutine that you haven’t declared), your pro‐
# gram stops with an error message telling why. But this functionality is available to you
# with the die function, so you can make your own fatal errors.

# The die function prints out the message you give it (to the standard error stream,
# where such messages should go) and makes sure that your program exits with a non‐
# zero exit status.
# You may not have known it, but every program that runs in Unix (and many other
# modern operating systems) has an exit status, telling whether it was successful or not.
# Programs that run other programs (like the make utility program) look at that exit
# status to see that everything happened correctly. The exit status is just a single byte, so
# it can’t say much; traditionally, it is 0 for success and a nonzero value for failure. Per‐
# haps 1 means a syntax error in the command arguments, while 2 means that some‐
# thing went wrong during processing, and 3 means the configuration file couldn’t be
# found; the details differ from one command to the next. But 0 always means that
# everything worked. When the exit status shows failure, a program like make knows
# not to go on to the next step.
# So you could rewrite the previous example, perhaps as something like this:


if ( ! open LOG, '>>', 'logfile' ) {
    die "Cannot create logfile: $!";
}