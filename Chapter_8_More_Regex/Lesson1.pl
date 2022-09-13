# Matching with Regular Expressions

# Matches with m//
# You put patterns in pairs of forward slashes, like /fred/, but this is actually a shortcut
# for m//, the pattern match operator. As you saw with the qw// operator, you may
# choose any pair of delimiters to quote the contents. So you could write that same
# expression as m(fred), m<fred>, m{fred}, or m[fred] using those paired delimiters,
# or as m,fred,, m!fred!, m^fred^, or many other ways using nonpaired delimiters.

# f you choose the forward slash as the delimiter, you may omit the initial m. Since Perl
# folks love to avoid typing extra characters, you’ll see most pattern matches written
# using slashes, as in /fred/.
# Of course, you should wisely choose a delimiter that doesn’t appear in your pattern. If
# you wanted to make a pattern match the beginning of an ordinary web URL, you
# might start to write /http:\/\// to match the initial "http://". But that would be
# easier to read, write, maintain, and debug if you used a better choice of delimiter:
# m%http://%. It’s common to use curly braces as the delimiter. If you use a programm‐
# er’s text editor, it probably has the ability to jump from an opening curly brace to the
# corresponding closing one, which can be handy in maintaining code.

# Match Modifiers
# There are several modifier letters, sometimes called flags, which you can append as a
# group right after the ending delimiter. Some flags apply to the pattern and some
# change how the match operator behaves.

# Case-Insensitive Matching with /i
# To make a case-insensitive pattern match so that you can match FRED as easily as fred
# or Fred, use the /i modifier:
print "Would you like to play a game? ";
chomp($_ = <STDIN>);
if (/yes/i) { # case-insensitive match
    print "In that case, I recommend that you go bowling.\n";
}


# Matching Any Character with /s
# By default, the dot (.) doesn’t match a newline, and this makes sense for most “look
# within a single line” patterns. If you might have newlines in your strings, and you
# want the dot to be able to match them, the /s modifier will do the job. It changes
# every dot in the pattern to act like the character class [\d\D] does, which is to match
# any character, even if it is a newline. Of course, you have to have a string with new‐
# lines for this to make a difference:
$_ = "I saw Barney\ndown at the bowling alley\nwith Fred\nlast night.\n";
if (/Barney.*Fred/s) {
    print "That string mentions Fred after Barney!\n";
}
# Without the /s modifier, that match would fail, since the two names aren’t on the
# same line.

# Combining Option Modifiers
# If you want to use more than one modifier on the same match, just put them both at
# the end (their order isn’t significant).

# The Binding Operator =~
# Matching against $_ is merely the default; the binding operator (=~) tells Perl to match
# the pattern on the right against the string on the left, instead of matching against $_.
# For example:
my $some_other = "I dream of betty rubble.";
if ($some_other =~ /\brub/) {
    print "Aye, there's the rub.\n";
}
# The first time you see it, the binding operator looks like some kind of assignment
# operator. But it’s no such thing! It is simply saying, “This pattern match that would

# attach to $_ by default—make it work with this string on the left instead.” If there’s no
# binding operator, the expression uses $_ by default.