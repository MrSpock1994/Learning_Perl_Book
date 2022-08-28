# NUMBERS

# Perl relies on the underlying C libraries for its numbers and uses a double-precision
# floating-point value to store the numbers. You don’t have to know much about that,
# but it does mean Perl has some limitations in precision and magnitude of the num‐
# bers, which are related to how you compiled and installed the perl interpreter instead
# of a limitation of the language itself. Perl does this to be as fast as possible by using
# the optimizations of the local platform and libraries to do its math.
# As you’ll see in the next few paragraphs, you can specify both integers (whole num‐
# bers, like 255 or 2,001) and floating-point numbers (real numbers with decimal
# points, like 3.14159, or 1.35 × 1,025). But internally, Perl computes with double-
# precision floating-point values.
# This means that there are no integer values internal to Perl—an integer constant in
# the program is treated as the equivalent floating-point value. In Perl, a number is just
# a number, unlike some other languages that ask you to decide what magnitude and
# type of number it is.


# Numeric Operators
# Operators are Perl’s verbs. They decide how to treat the nouns. Perl provides the typi‐
# cal ordinary addition, subtraction, multiplication, and division operators. These
# numeric operators always treat their operands as numbers, and are denoted by sym‐
# bolic characters:

2 + 3; # 2 plus 3, or 5
5.1 - 2.4; # 5.1 minus 2.4, or 2.7
3 * 12;  # 3 times 12 = 36
14 / 2; # 14 divided by 2, or 7
10.2 / 0.3; # 10.2 divided by 0.3, or 34
10 / 3; # always floating-point divide, so 3.3333333...

# STRINGS

# Strings are sequences of characters, such as hello or ☃★๛. Strings may contain any
# combination of any characters. The shortest possible string has no characters and is
# called the empty string. The longest string fills all of your available memory (although
# you wouldn’t be able to do much with that). This is in accordance with the principle
# of “no built-in limits” that Perl follows at every opportunity. Typical strings are print‐
# able sequences of letters, digits, punctuation, and whitespace. However, the ability to
# have any character in a string means you can create, scan, and manipulate raw binary
# data as strings—something with which many other utilities would have great diffi‐
# culty. For example, you could update a graphical image or compiled program by read‐
# ing it into a Perl string, making the change, and writing the result back out.


# A single-quoted string literal is a sequence of characters enclosed in single quotes, the
# ' character. The single quotes are not part of the string itself—they’re just there to let
# Perl identify the beginning and end of the string

'fred'; # those four characters: f, r, e, and d
'barney'; # those six characters
''; # the null string (no characters)
'⅚∞☃☠'; # Some "wide" Unicode characters


# A double-quoted string literal is a sequence of characters, although this time enclosed
# in double quotes. But now the backslash takes on its full power to specify certain con‐
# trol characters, or even any character at all through octal and hex representations.
# Here are some double-quoted strings:
"barney"; # just the same as 'barney'
"hello world\n"; # hello world, and a newline
"The last character of this string is a quote mark: \"";
"coke\tsprite"; # coke, a tab, and sprite
"\x{2668}"; # Unicode HOT SPRINGS character code point
"\N{SNOWMAN}"; # Unicode Snowman by name


# String Operators

# You can concatenate, or join, string values with the . operator. (Yes, that’s a single
# period.) This does not alter either string, any more than 2+3 alters either 2 or 3. The
# resulting (longer) string is then available for further computation or assignment to a
# variable. For example:
"hello" . "world"; # same as "helloworld"
"hello" . ' ' . "world"; # same as 'hello world'
'hello world' . "\n"; # same as "hello world\n"

# A special string operator is the string repetition operator, consisting of the single
# lowercase letter x. This operator takes its left operand (a string) and makes as many
# concatenated copies of that string as indicated by its right operand (a number). For
# example:
"fred" x 3; # is "fredfredfred"
"barney" x (4+1); # is "barney" x 5, or "barneybarneybarneybarneybarney"
5 x 4.8; # is really "5" x 4, which is "5555"

# Automatic Conversion Between Numbers and Strings
# For the most part, Perl automatically converts between numbers and strings as
# needed. How does it know which it should use? It all depends on the operator that
# you apply to the scalar value. If an operator expects a number (like + does), Perl will
# see the value as a number. If an operator expects a string (like . does), Perl will see the
# value as a string. So, you don’t need to worry about the difference between numbers
# and strings; just use the proper operators, and Perl will make it all work


# SCALAR VARIABLES

# A variable is a name for a container that holds one or more values. As you’ll see, a
# scalar variable holds exactly one value, and in upcoming chapters you’ll see other
# types of variables, such as arrays and hashes, that can hold many values. The name of
# the variable stays the same throughout your program, but the value or values in that
# variable can change over and over again.
# A scalar variable holds a single scalar value, as you’d expect. Scalar variable names
# begin with a dollar sign, called the sigil, followed by a Perl identifier: a letter or under‐
# score, and then possibly more letters, or digits, or underscores. Another way to think
# of it is that it’s made up of alphanumerics and underscores, but can’t start with a digit.
# Uppercase and lowercase letters are distinct: the variable $Fred is a different variable
# from $fred. And all of the letters, digits, and underscores are significant, so all of
# these refer to different variables:
$name;
$Name;
$NAME;

# Scalar Assignment
# The most common operation on a scalar variable is assignment, which is the way to
# give a value to that variable. The Perl assignment operator is the equals sign (much
# like other languages), which takes a variable name on the left side and gives it the
# value of the expression on the right. For example:
$fred = 17; # give $fred the value of 17
$barney = 'hello'; # give $barney the five-character string 'hello'
$barney = $fred + 3; # give $barney the current value of $fred plus 3 (20)
$barney = $barney * 2; # $barney is now $barney multiplied by 2 (40)


# Compound Assignment Operators
# Expressions like $fred = $fred + 5 (where the same variable appears on both sides
# of an assignment) occur frequently enough that Perl (like C and Java) has a shorthand
# for the operation of altering a variable: the compound assignment operator. Nearly
# all binary operators that compute a value have a corresponding compound assign‐
# ment form with an appended equals sign. For example, the following two lines are
# equivalent:
$fred = $fred + 5; # without the compound assignment operator
$fred += 5; # with the compound assignment operator
# These are also equivalent:
$barney = $barney * 3;
$barney *= 3;
# In each case, the operator alters the existing value of the variable in some way, rather
# than simply overwriting the value with the result of some new expression.
# Another common assignment operator is made with the string concatenation opera‐
# tor ( . ). This gives us an append operator ( .= ):
$str = $str . " "; # append a space to $str
$str .= " "; # same thing with compound assignment

# Output with print
# It’s generally a good idea to have your program produce some output; otherwise,
# someone may think it didn’t do anything. The print operator makes this possible: it
# takes a scalar argument and puts it out without any embellishment onto standard
# output. Unless you’ve done something odd, this will be your terminal display. For
# example:

print "hello world\n"; # say hello world, followed by a newline

# Comparison Operators
# To compare numbers, Perl has logical comparison operators that may remind you of
# algebra: < <= == >= > !=. Each of these returns a true or false value. You’ll find out
# more about those return values in the next section. Some of these may be different
# than what you’d use in other languages. For example, == is used for equality, not a
# single =, because that’s used for assignment. And != is used for inequality testing
# because <> is used for another purpose in Perl. And you’ll need >= and not => for
# “greater than or equal to” because the latter is used for another purpose in Perl. In
# fact, nearly every sequence of punctuation is used for something in Perl. So, if you get
# writer’s block, just let the cat walk across the keyboard, and debug the result.
# To compare strings, Perl has an equivalent set of string comparison operators that
# look like funny little words: lt, le, eq, ge, gt, and ne. These compare two strings
# character by character to see whether they’re the same, or whether one comes first in
# standard string sorting order.


# The if Control Structure
# Once you can compare two values, you’ll probably want your program to make deci‐
# sions based on that comparison. Like all similar languages, Perl has an if control
# structure that only executes if its condition returns a true value:

sub if_control_structure {
    my $name = "William";
    my $second_name = "Fred";
    if ($name gt $second_name) {
        print "$name comes after $second_name in sorted order.\n";
    }
    my $bigger = $name gt $second_name;
    if ($bigger){
        print "Testing boolean values.\n";
    }
}

if_control_structure();

# Getting User Input
# At this point, you’re probably wondering how to get a value from the keyboard into a
# Perl program. Here’s the simplest way: use the line-input operator, <STDIN>.

sub user_input {  
    use strict;
    print "Type what you want bellow or hit enter for a blank line.\n";
    my $first_input = <STDIN>;
    chomp($first_input);
    if ($first_input eq "\n") {
        print "That was just a blank line!\n";
    }
    else {
        print "You typed $first_input";
    }
}

user_input();

# The while Control Structure
# Like most algorithmic programming languages, Perl has a number of looping struc‐
# tures. The while loop repeats a block of code as long as a condition is true:

sub while_looping {
    use strict;
    my $count = 0;
    while ($count <= 10) {
        print "$count\n";
        $count += 1;
    }
}

while_looping();