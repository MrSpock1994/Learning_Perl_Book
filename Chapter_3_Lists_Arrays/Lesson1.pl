# LISTS AND ARRAYS

# A list is an ordered collection of scalars. An array is a variable that contains a list.
# People tend to use the terms interchangeably, but there’s a big difference. The list is
# the data and the array is the variable that stores that data. You can have a list value
# that isn’t in an array, but every array variable holds a list (although that list may be
# empty).

# Each element of an array or list is a separate scalar value. These values are ordered—
# that is, they have a particular sequence from the first to the last element. The elements
# of an array or a list are indexed by integers starting at zero and counting by ones, so
# the first element of any array or list is always element zero. This also means that the
# last index is one less than the number of items in the list.

# Since each element is an independent scalar value, a list or array may hold numbers,
# strings, undef values, or any mixture of different scalar values. Nevertheless, it’s com‐
# mon to have all elements of the same type, such as a list of book titles (all strings) or a
# list of cosines (all numbers).
# Arrays and lists can have any number of elements. The smallest one has no elements,
# while the largest can fill all of available memory. Once again, this is in keeping with
# Perl’s philosophy of “no unnecessary limits.”


# Accessing Elements of an Array
@fred = ('William', 'Tamires', 'Danilo');

print "@fred[0]\n";
print "@fred[1]\n";
print "@fred[2]\n";

# List Literals
# A list literal (the way you represent a list value within your program) is a list of
# comma-separated values enclosed in parentheses. These values form the elements of
# the list. For example:
(1, 2, 3); # list of three values 1, 2, and 3
(1, 2, 3,); # the same three values (the trailing comma is ignored)
("fred", 4.5); # two values, "fred" and 4.5
( ); # empty list - zero element


# The qw Shortcut
# A list may have any scalar values, like this typical list of strings:
# ("fred", "barney", "betty", "wilma", "dino")
# # It turns out that lists of simple words (like the previous example) are frequently
# # needed in Perl programs. The qw shortcut makes it easy to generate them without
# # typing a lot of extra quote marks:
# qw( fred barney betty wilma dino ) # same as earlier, but less typing
# qw stands for “quoted words” or “quoted by whitespace,” depending on whom you
# ask. Either way, Perl treats it like a single-quoted string (so, you can’t use \n or $fred
# inside a qw list as you would in a double-quoted string). The whitespace (characters
# like spaces, tabs, and newlines) disappear and whatever is left becomes the list of
# items.


# The pop and push Operators
# You could add new items to the end of an array by simply storing them as elements
# with new, larger indices.
# One common use of an array is as a stack of information, where you add new values
# to and remove old values from the righthand side of the list. The righthand side is the
# end with the “last” items in the array, the end with the highest index values. These
# operations occur often enough to have their own special functions. Think of this like
# a stack of plates. You take a plate off the top of the stack and put plates on top of the
# stack (if you’re like most people).
# The pop operator takes the last element off of an array and returns it:

@array = 5..9;
$fred = pop(@array); # $fred gets 9, @array now has (5, 6, 7, 8)
$barney = pop @array; # $barney gets 8, @array now has (5, 6, 7)
pop @array; # @array now has (5, 6). (The 7 is discarded.)

# That last example uses pop in a void context, which is merely a fancy way of saying the
# return value isn’t going anywhere. There’s nothing wrong with using pop in this way,
# if that’s what you want.
# If the array is empty, pop leaves it alone (since there is no element to remove) and
# returns undef.
# You may have noticed that you can use pop with or without parentheses. This is a
# general rule in Perl: as long as you don’t change the meaning by removing the paren‐
# theses, they’re optional. The converse operation is push, which adds an element (or a
# list of elements) to the end of an array:
push(@array, 0); # @array now has (5, 6, 0)
push @array, 8; # @array now has (5, 6, 0, 8)
push @array, 1..10; # @array now has those 10 new elements
@others = qw/ 9 0 2 1 0 /;
push @array, @others; # @array now has those five new elements (19 total)
# Note that the first argument to push or the only argument for pop must be an array
# variable—pushing and popping would not make sense on a literal list.

sub adding_elements_array {
    my @testing_array;
    print "Insert bellow the length of the array.\n";
    my $length = <STDIN>;
    my $count = 0;
    while ($count < $length) {
        print "Insert bellow the element for the position $count.\n";
        my $number = <STDIN>;
        chomp($number);
        push(@testing_array, $number);
        $count += 1;
    }
    print "The elements for the array are:\n";
    foreach $number_add (@testing_array) {
        print "$number_add\n";
    }
}

adding_elements_array();

# The shift and unshift Operators
# The push and pop operators do things to the end of an array (or the right side of an
# array, or the portion with the highest subscripts, depending on how you like to think
# of it). Similarly, the unshift and shift operators perform the corresponding actions
# on the “start” of the array (or the “left” side of an array, or the portion with the lowest
# subscripts). Here are a few examples:

@array = qw# dino fred barney #;
$m = shift(@array); # $m gets "dino", @array now has ("fred", "barney")
$n = shift @array; # $n gets "fred", @array now has ("barney")
shift @array; # @array is now empty
$o = shift @array; # $o gets undef, @array is still empty
unshift(@array, 5); # @array now has the one-element list (5)
unshift @array, 4; # @array now has (4, 5)
@others = 1..3; unshift @array, @others; # @array now has (1, 2, 3, 4, 5)
# Analogous to pop, shift returns undef if you give it an empty array variable.


# The splice Operator
# The push-pop and shift-unshift operators work with the ends of the array, but what
# if you need to remove or add elements to the middle? That’s where the splice opera‐
# tor comes in. It takes up to four arguments, two of which are optional. The first argu‐
# ment is always the array and the second argument is the position where you want to
# start. If you only use those two arguments, Perl removes all of the elements from your
# starting position to the end and returns them to you:

@array = qw( pebbles dino fred barney betty );
@removed = splice @array, 2; 
# remove fred and everything after
# @removed is qw(fred barney betty)
# @array is qw(pebbles dino)


# You can use a third argument to specify a length. Read that sentence again because
# many people assume that the third argument is an ending position, but no, it’s a
# length. That way, you can remove elements from the middle and leave some at the
# end:
@array = qw( pebbles dino fred barney betty );
@removed = splice @array, 1, 2; # remove dino, fred
# @removed is qw(dino fred)
# # @array is qw(pebbles barney betty)
# The fourth argument is a replacement list. At the same time that you take some ele‐
# ments out, you can put others in. The replacement list does not need to be the same
# size as the slice that you are removing:
@array = qw( pebbles dino fred barney betty );
@removed = splice @array, 1, 2, qw(wilma); # remove dino, fred
# @removed is qw(dino fred)
# @array is qw(pebbles wilma
# barney betty)

# The foreach Control Structure

# It’s handy to be able to process an entire array or list, so Perl provides a control struc‐
# ture to do just that. The foreach loop steps through a list of values, executing one
# iteration (time through the loop) for each value:


sub for_each_loop {
    foreach $rock (qw/ bedrock slate lava/){
        print "One rock is $rock.\n"; 
    }
}

for_each_loop();


# Perl’s Favorite Default: $_
# If you omit the control variable from the beginning of the foreach loop, Perl uses its
# favorite default variable, $_. This is (mostly) just like any other scalar variable, except
# for its unusual name. For example:
foreach (1..10) { # Uses $_ by default
    print "I can count to $_!\n";
}
# Although this isn’t Perl’s only default by a long shot, it’s Perl’s most common default.
# You’ll see many other cases in which Perl will automatically use $_ when you don’t tell
# it to use some other variable or value, thereby saving the programmer from the heavy
# labor of having to think up and type a new variable name. So as not to keep you in
# suspense, one of those cases is print, which will output $_ if given no other
# argument:
$_ = "Yabba dabba doo\n";
print; # prints $_ by default


# Scalar and List Context
# This is the most important section in this chapter. In fact, it’s the most important sec‐
# tion in the entire book. It wouldn’t be an exaggeration to say that your entire career in
# using Perl will depend on understanding this section. So if you’ve gotten away with
# skimming the text up to this point, this is where you should really pay attention.
# That’s not to say that this section is in any way difficult to understand. It’s actually a
# simple idea: a given expression may mean different things depending upon where it
# appears and how you use it. This is nothing new to you; it happens all the time in
# natural languages. For example, in English, suppose someone asked you what the
# word “flies” means. It has different meanings depending on how it’s used. You can’t
# identify the meaning until you know the context.
# The context refers to how you use an expression. You’ve actually already seen some
# contextual operations with numbers and strings. When you do numbery sorts of
# things, you get numeric results. When you do stringy sorts of things, you get string
# results. And it’s the operator that decides what you are doing, not the values. The * in
# 2*3 is numeric multiplication, while the x in 2×3 is string replication. The first gives
# you 6 while the second gives you 222. That’s context at work for you.

# As Perl is parsing your expressions, it always expects either a scalar value or a list
# value (or void, which we don’t cover in this book). What Perl expects is called the
# context of the expression:
42 + something # The something must be a scalar
sort something # The something must be a list
# This is like spoken languages. If we make a grammatical mistake, you notice it right
# away because you expect certain words in certain places. Eventually, you’ll read Perl
# this way too, but at first you have to think about it.


# Even if something is the exact same sequence of characters, in one case it may give a
# single, scalar value, while in the other, it may give a list. Expressions in Perl always
# return the appropriate value for their context. For example, how about the “name” of
# an array. In a list context, it gives the list of elements. But in a scalar context, it returns
# the number of elements in the array:
@people = qw( fred barney betty );
@sorted = sort @people; # list context: barney, betty, fred
$number = 42 + @people; # scalar context: 42 + 3 gives 45
# Even ordinary assignment (to a scalar or a list) causes different contexts:
@list = @people; # a list of three people
$n = @people; # the number 3
# But please don’t jump to the conclusion that scalar context always gives the number
# of elements that would have been returned in list context. Most list-producing
# expressions return something much more interesting.
# Any expression can produce a list or a scalar depending on context. So when we say
# “list-producing expressions,” we mean those that are typically used in a list context
# and therefore might surprise you when they’re used unexpectedly in a scalar context
# (like reverse or @fred).
# Not only that, but you can’t make any general rules to apply what you know about
# some expressions to others. Each expression can make up its own rules. Or, really,
# follow the overall rule that isn’t very helpful to you: do the thing that makes the most
# sense for that context. Perl is very much a language that tries to do the most common,
# mostly right thing for you.