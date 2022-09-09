# Regular Expressions

# Perl has strong support for regular expressions, or regexes for short. This mini-
# language within Perl is a tight and powerful way to describe a family of strings that
# can match a pattern. It’s one of the features that has made Perl so popular.
# Today many languages have some sort of access to these powerful tools (perhaps as
# something called “Perl-Compatible Regular Expressions,” or PCRE), but Perl is still
# out in front of most of them in its power and expressivity.

# Sequences
# Perl’s regular expressions either match a string or they don’t. There is no such thing as
# a partial match. And Perl doesn’t look for a best match. Instead, it matches the left‐
# most, longest substring that satisfies the pattern

# The simplest sort of pattern is a sequence. You put literal characters next to each other
# to assert that you want to match a substring with those characters in that order. If you
# want to match the sequence abba, you put that between slashes:

$_ = "yabba dabba doo";
if (/abba/){
    print "It matched!\n";
}

# The forward slashes in the if expression are the match operator. It applies its pattern
# to the string in $_. The pattern is the part between the slashes. This might seem weird
# because this is the first time in this book that you’ve seen an operator that surrounds
# the value.
# If the pattern matches the string in $_, the match operator returns true. Otherwise, it
# returns false. The match works by trying the pattern at the first position in the string.
# The first character in $_ is a y, but the first character in the pattern is a. Those don’t
# match, so Perl keeps looking.
# The match operator then slides over one spot and tries the match at the next position. 
# It matches the a—so far, so good. It tries to match the next
# character in the sequence, the b. It matches the first b in the string. Again, so far, so
# good. Then it matches the second b, and finally the last a. The match operator found
# the sequence in the string, so the pattern matches.

# Inside a Perl pattern, whitespace is significant. Any whitespace you include in the pat‐
# tern tries to match the same whitespace in $_. This example doesn’t match because it
# looks for a space between the two bs:

$_ = "yabba dabba doo";
    if (/ab ba/) { # Won't match
    print "It matched!\n";
}

#Testing

while (<STDIN>){
    chomp;
    if (/william/){
        print "\tMatches!\n"
    }
    else {
        print "\tDoes not match!\n"
    }
}


# The Wildcard
# The dot, ., matches any single character except a newline. It’s the first regex meta‐
# character we show:

$_ = "yabba dabba doo"
if (/ab.a/){
    print "Its a match!\n"
}

# Quantifiers
# You can repeat parts of a pattern with a quantifier. These metacharacters apply to the
# part of the pattern that comes directly before them. Some people call these repeat or
# repetition operators.
# The easiest quantifier is the question mark, ?. It asserts that the preceding item shows
# up zero or one times (or, in human speak, that item is optional). Suppose that some
# people write Bamm-bamm while others write Bammbamm without the hyphen. You can
# match either by making the - optional:
$_ = 'Bamm-bamm';
    if (/Bamm-?bamm/) {
    print "It matched!\n";
}


# The next quantifier is the star, *. It asserts that the preceding item shows up zero or
# more times. That seems like a weird way to say it, but it means it can be there or not.
# It’s optional, but it can be there as many times as it likes:
$_ = 'Bamm-----bamm';
    if (/Bamm-*bamm/) {
    print "It matched!\n";
}
# Since you use the * after the hyphen, there can be any number of hyphens (including
# zero!) in the string. This is more handy for a variable amount of whitespace. Suppose
# you had the possibility of several spaces between the two parts of the name:
$_ = 'Bamm     bamm';
    if (/Bamm *bamm/) {
    print "It matched!\n";
}

# You could have another pattern to find a variable number of characters between the B
# and an m:
$_ = 'Bamm bamm';
    if (/B.*m/) {
    print "It matched!\n";
}
# The longest part of the leftmost longest rule shows up here. The .* can match zero or
# more of any character except the newline, and so it does. In the process of matching,
# the .* matches the rest of the string all the way to the end of the string. We say that
# the quantifiers are greedy because they’ll match as much as they can right away. Perl
# also has nongreedy matching


# Where the * matches zero or more times, the + quantifier matches one or more times.
# If there must be at least one space, use the +:
$_ = 'Bamm   bamm';
    if (/Bamm +bamm/) {
    print "It matched!\n";
}
# Those repetition operators match “or more” repetitions. What if you want to match
# an exact number? You can put that number in braces. Suppose you want to match
# exactly three bs. You can note that with {3}:
$_ = "yabbbba dabbba doo.";
    if (/ab{3}a/) {
p   rint "It matched!\n";
}
# That matches inside dabbba because that’s where exactly three bs are. This is a handy
# way to avoid manually counting the characters yourself.


# Number to match              Metacharacter       Generalized form
# Optional                          ?                     {0,1}
# Zero or more                      *                     {0,}
# One or more                       +                     {1,}
# Minimum with no maximum                                 {3,}
# Minimum with maximum                                    {3,5}
# No minimum with maximum                          {0,5} or {,5} (v5.34)
# Exactly                                                 {3}


# Grouping in Patterns
# You can use parentheses to group parts of a pattern. So, parentheses are also meta‐
# characters.
# Remember that a quantifier only applies to the immediately preceding item. The pat‐
# tern /fred+/ matches strings like freddddddddd because the quantifier only applies to
# the d. If you want to match repetitions of the entire fred, you can group with paren‐
# theses, as in /(fred)+/. The quantifier applies to the entire group, so it matches
# strings like fredfredfred, which is more likely to be what you wanted.

# Alternation
# The vertical bar (|), often called “or” in this usage, means that either the left side may
# match, or the right side. If the part of the pattern on the left of the bar fails, the part
# on the right gets a chance to match:
foreach ( qw(fred betty barney dino) ) {
    if ( /fred|barney/ ) {
    print "$_ matched\n";
}
}
# This outputs two names. One matches the left alternative and one matches the right:
# fred matched
# barney matched
# You can have more than one alternative:
foreach ( qw(fred betty barney dino) ) {
    if ( /fred|barney|betty/ ) {
    print "$_ matched\n";
}
}
# This outputs three names:
# fred matched
# betty matched
# barney matched


# Character Classes
# Character classes are sets of characters that can match at a single location in the pat‐
# tern. You put those characters in square braces, like [abcwxyz]. At that position in the
# pattern, it can match any one of those seven characters. It’s a little like alternations but
# with individual characters.
# For convenience, you can specify a range of characters with a hyphen (-), so that class
# may also be written as [a-cw-z]. That didn’t save much typing, but it’s more usual to
# make a character class like [a-zA-Z] to match any one letter out of that set of 52, or
# [0-9] to match a digit.


# Sometimes it’s easier to specify the characters you want to leave out rather than the
# ones within the character class. A caret (^) at the start of the character class creates
# the complement of it:
# [^def]  anything not d, e, or f
# [^n-z]  not a lowercase letter from n to z
# [^n\-z] not an n, -, or z


# This is handy when the list of characters that you don’t want to match is shorter than
# the list of ones you do want.


# Anchors
# By default, if a pattern doesn’t match at the start of the string, it can “float” down the
# string trying to match somewhere else. But there are a number of anchors that may
# be used to hold the pattern at a particular point in a string.
# The \A anchor matches at the absolute beginning of a string, meaning that your pat‐
# tern will not float down the string at all. This pattern looks for an https only at the
# start of the string:


if ( /\Ahttps?:/ ) {
    print "Found a URL\n";
}


# The anchor is a zero-width assertion, meaning that it matches a condition at the cur‐
# rent match position but doesn’t match characters. In this case, the current match
# position has to be the beginning of the string. This keeps Perl from initially failing,
# moving over one character, and trying again.
# If you want to anchor something to the end of the string, you use \z. This pattern
# matches .png only at the absolute end of the string:
if ( /\.png\z/ ) {
    print "Found a URL\n";
}


Word Anchors
Anchors aren’t just at the ends of the string. The word-boundary anchor \b matches
at either end of a word. So you can use /\bfred\b/ to match the word fred but not
frederick or alfred or manfred mann. This is similar to the feature often called
something like “match whole words only” in a word processor’s search command.
Alas, these aren’t words as we are likely to think of them; they’re those \w-type words
made up of ordinary letters, digits, and underscores. The \b anchor matches at the
start or end of a group of \w characters. This is subject to the rules that \w is follow‐
ing, as we showed you earlier in this chapter.

