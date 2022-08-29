# SUBROUTINES

# You’ve already seen and used some of the built-in system functions, such as chomp,
# reverse, print, and so on. But, as other languages do, Perl has the ability to make
# subroutines, which are user-defined functions. These let you recycle one chunk of
# code many times in one program. The name of a subroutine is another Perl identifier
# (letters, digits, and underscores, but they can’t start with a digit) with a sometimes-
# optional ampersand (&) in front. There’s a rule about when you can omit the amper‐
# sand and when you cannot; you’ll see that rule by the end of the chapter. For now, just
# use it every time it’s not forbidden, which is always a safe rule. We’ll tell you every
# place where it’s forbidden, of course.
# The subroutine name comes from a separate namespace, so Perl won’t be confused if
# you have a subroutine called &fred and a scalar called $fred in the same program—
# although there’s no reason to do that under normal circumstances.


# Defining a Subroutine
# To define your own subroutine, use the keyword sub, the name of the subroutine
# (without the ampersand), then the block of code in curly braces, which makes up the
# body of the subroutine. Something like this:
sub marine {
    $n += 1; # Global variable $n
    print "Hello, sailor number $n!\n";
}


# You may put your subroutine definitions anywhere in your program text, but pro‐
# grammers who come from a background of languages like C or Pascal like to put
# them at the start of the file. Others may prefer to put them at the end of the file so
# that the main part of the program appears at the beginning. It’s up to you. In any case, 
# you don’t normally need any kind of forward declaration. If you have two subroutine
# definitions with the same name, the later one overwrites the earlier one. Although, if
# you have warnings enabled, Perl will tell you when you do that. It’s generally consid‐
# ered bad form, or the sign of a confused maintenance programmer.

# Return Values
# You always invoke a subroutine as part of an expression, even if you don’t use the
# result of the expression. When you invoked &marine earlier, you were calculating the
# value of the expression containing the invocation but then throwing away the result.
# Many times, you call a subroutine and actually do something with the result. This
# means that you do something with the return value of the subroutine. All Perl sub‐
# routines have a return value—there’s no distinction between those that return values
# and those that don’t. Not all Perl subroutines have a useful return value, however.
# Since you can call Perl subroutines in a way that needs a return value, it’d be a
# bit wasteful to have to declare special syntax to “return” a particular value for the
# majority of the cases. So Larry made it simple. As Perl chugs along in a subroutine, 
# it calculates values as part of its series of actions. Whatever calculation is last performed
# in a subroutine is automatically also the return value.


# Arguments
# That subroutine called larger_of_fred_or_barney would be much more useful if it
# didn’t force you to use the global variables $fred and $barney. If you wanted to get
# the larger value from $wilma and $betty, you currently have to copy those into $fred
# and $barney before you can use larger_of_fred_or_barney. And if you had some‐
# thing useful in those variables, you’d have to first copy those to other variables—say,
# $save_fred and $save_barney. And then, when you’re done with the subroutine,
# you’d have to copy those back to $fred and $barney again.
# Luckily, Perl has subroutine arguments. To pass an argument list to the subroutine,
# simply place the list expression, in parentheses, after the subroutine invocation.

# Perl passes the list to the subroutine; that is, Perl makes the list available for the sub‐
# routine to use however it needs to. Of course, you have to store this list somewhere,
# so Perl automatically stores the parameter list (another name for the argument list)
# in the special array variable named @_ for the duration of the subroutine.