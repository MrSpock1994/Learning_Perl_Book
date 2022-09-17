# Strings and Sorting
# As we mentioned near the beginning of this book, Perl is designed to be good at solv‐
# ing programming problems that are about 90% working with text and 10% every‐
# thing else. So it’s no surprise that Perl has strong text-processing abilities, even
# without all that you’ve done with regular expressions. Sometimes the regular expres‐
# sion engine is too fancy and you need a simpler way of working with a string, as you’ll
# see in this chapter.

# Finding a Substring with index
# Finding a substring depends on where you lost it. If you happen to have lost it within
# a bigger string, you’re in luck because the index function can help you out. Here’s
# how it looks:
# my $where = index($big, $small);
# Perl locates the first occurrence of the small string within the big string, returning an
# integer location of the first character. The character position returned is a zero-based
# value: if the substring is found at the very beginning of the string, index returns 0; if
# it’s one character later, the return value is 1, and so on. If index can’t find the sub‐
# string at all, it returns -1 to indicate that. In this example, $where gets 6 because that’s
# the position where wor starts:

# my $stuff = "Howdy world!";
# my $where = index($stuff, "wor");
# Another way you could think of the position number is the number of characters to
# skip over before getting to the substring. Since $where is 6, you know that you have to
# skip over the first six characters of $stuff before you find wor.

my $test = "Im the most advanced man on earth advanced";

my $position = index($test, "adv");
print $position;

# Manipulating a Substring with substr
# The substr function works with only a part of a larger string. It looks like this:
# my $part = substr($string, $initial_position, $length);
# It takes three arguments: a string value, a zero-based initial position (such as
# the return value of index), and a length for the substring. The return value is the
# substring:
my $mineral = substr("Fred J. Flintstone", 8, 5); # gets "Flint"
my $rock = substr "Fred J. Flintstone", 13, 1000; # gets "stone"


# The third argument to substr is the length of the substring you want. It’s always
# going to be the length no matter how badly we want it to be the end position.


# Formatting Data with sprintf
# The sprintf function takes the same arguments as printf (except for the optional
# filehandle, of course), but it returns the requested string instead of printing it. This is
# handy if you want to store a formatted string in a variable for later use, or if you want
# more control over the result than printf alone would provide:
my $date_tag = sprintf "%4d/%02d/%02d %2d:%02d:%02d", $yr, $mo, $da, $h, $m, $s;

# Using sprintf with “Money Numbers”
# One popular use for sprintf is when you want to format a number with a certain
# number of places after the decimal point, such as when you want to show an amount
# of money as 2.50 and not 2.5—and certainly not as 2.49997! That’s easy to accom‐
# plish with the "%.2f" format:
my $money = sprintf "%.2f", 2.49997;
# The full implications of rounding are numerous and subtle, but in most cases you
# should keep numbers in memory with all of the available accuracy, rounding off only
# for output.