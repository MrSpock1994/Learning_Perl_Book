# Processing Text with Regular Expressions
# You can use regular expressions to change text too. So far we’ve only shown you how
# to match a pattern, and now we’ll show you how to use patterns to locate the parts of
# strings that you want to change.

# Substitutions with s///
# If you think of the m// pattern match as being like your word processor’s “search” fea‐
# ture, the “search and replace” feature would be Perl’s s/// substitution operator. This
# simply replaces whatever part of a variable matches the pattern with a replacement
# string:

$_ = "He's out bowling with Barney tonight.";
s/Barney/Fred/; # Replace Barney with Fred
print "$_\n";


# Global Replacements with /g
# As you may have noticed in a previous example, s/// will make just one replacement,
# even if others are possible. Of course, that’s just the default. The /g modifier tells s///
# to make all possible nonoverlapping replacements; that is, each new match starts
# looking just beyond the latest replacement:
$_ = "home, sweet home!";
s/home/cave/g;
print "$_\n"; # "cave, sweet cave!"
# A fairly common use of a global replacement is to collapse whitespace; that is, to turn
# any arbitrary whitespace into a single space:
$_ = "Input data\t may have extra whitespace.";
s/\s+/ /g; # Now it says "Input data may have extra whitespace."


# The split Operator
# Another operator that uses regular expressions is split, which breaks up a string
# according to a pattern. This is useful for tab-separated data, or colon-separated,
# whitespace-separated, or anything-separated data, really. So long as you can specify
# the separator with a regular expression (and generally, it’s a simple regular expres‐
# sion), you can use split. It looks like this:
# my @fields = split /separator/, $string;


# The split drags the pattern through a string and returns a list of fields (substrings)
# that were separated by the separators. Whenever the pattern matches, that’s the end of
# one field and the start of the next. So, anything that matches the pattern never shows
# up in the returned fields. Here’s a typical split pattern, splitting on colons:
my @fields = split /:/, "abc:def:g:h";
# gives ("abc", "def", "g", "h")


# The join Function
# The join function doesn’t use patterns; it performs the opposite function of split:
# split breaks up a string into a number of pieces, and join glues together a bunch of
# pieces to make a single string. The join function looks like this:
my $result = join $glue, @pieces;
# The first argument to join is the glue, which may be any string. The remaining argu‐
# ments are a list of pieces. join puts the glue string between the pieces and returns the
# resulting string:
my $x = join ":", 4, 6, 8, 10, 12;
# $x is "4:6:8:10:12"