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