# What Is a Hash?
# A hash is a data structure, not unlike an array in that it can hold any number of values
# and retrieve them at will. But instead of indexing the values by number, as you did
# with arrays, you look up hash values by name. That is, the indices, called keys, aren’t
# numbers but instead are arbitrary, unique strings (see Figure 6-1).
# Hash keys are strings, first of all, so instead of getting element number 3 from an
# array, you access the hash element named wilma, for instance.
# These keys are arbitrary strings—you can use any string expression for a hash key.
# And they are unique strings—just as there’s only one array element numbered 3,
# there’s only one hash element named wilma.
# Another way to think of a hash is that it’s like a barrel of data, where each piece of
# data has a tag attached. You can reach into the barrel and pull out any tag and see
# what piece of data is attached. But there’s no “first” item in the barrel; it’s just a jum‐
# ble. In an array, you start with element 0, then element 1, then element 2, and so on.
# But in a hash there’s no fixed order, no first element. It’s just a collection of key-value
# pairs.

# It’s worth mentioning again that the keys are always unique, although you may use
# the same value more than once. The values of a hash may be all numbers, all strings,
# undef values, or a mixture. But the keys are all arbitrary, unique strings.

# Hash Element Access
# To access an element of a hash, you use syntax that looks like this:

# $hash{$some_key}
# This is similar to what you used for array access, but here you use curly braces instead
# of square brackets around the subscript (key). You do this because you’re doing
# something fancier than ordinary array access, so you should use fancier punctuation.
# And that key expression is now a string rather than a number:

$family_name{'fred'} = 'flintstone';
$family_name{'barney'} = 'rubble';


# The Hash as a Whole
# To refer to the entire hash, use the percent sign (%) as a prefix. So, the hash you’ve
# been using for the last few pages is actually called %family_name.

# Hash Functions
# Naturally, there are some useful functions that can work on an entire hash at once.
# The keys and values Functions
# The keys function yields a list of all the keys in a hash, while the values function
# gives the corresponding values. If there are no elements to the hash, then either func‐
# tion returns an empty list:
my %hash = ('a' => 1, 'b' => 2, 'c' => 3);
my @k = keys %hash;
my @v = values %hash;

# The exists Function
# To see whether a key exists in the hash (that is, whether someone has a library card or
# not), use the exists function, which returns a true value if the given key exists in the
# hash, whether the corresponding value is true or not:
if (exists $books{"dino"}) {
    print "Hey, there's a library card for dino!\n";
}
# That is to say, exists $books{"dino"} will return a true value if (and only if) dino is
# found in the list of keys from keys %books.


# The delete Function
# The delete function removes the given key (and its corresponding value) from the
# hash (if there’s no such key, its work is done; there’s no warning or error in that case):
my $person = "betty";
delete $books{$person};
# Revoke the library card for $person