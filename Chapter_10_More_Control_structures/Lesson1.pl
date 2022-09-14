# The unless Control Structure
# In an if control structure, the block of code is executed only when the conditional
# expression is true. If you want to execute a block of code only when the conditional is
# false, change if to unless:
unless ($fred =~ /\A[A-Z_]\w*\z/i) {
    print "The value of \$fred doesn't look like a Perl identifier name.\n";
}
# Using unless says to run the block of code unless this condition is true. It’s just like
# using an if test with the opposite condition. Another way to say it is that it’s like hav‐
# ing the else clause on its own. That is, whenever you see an unless that you don’t
# understand, you can rewrite it (either in your head or in reality) as an if test:
if ($fred =~ /\A[A-Z_]\w*\z/i) {
    # Do nothing
} 
else {
    print "The value of \$fred doesn't look like a Perl identifier name.\n";
}
# It’s no more or less efficient, and it should compile to the same internal bytecodes. Or,
# another way to rewrite it would be to negate the conditional expression by using the
# negation operator (!):
if ( ! ($fred =~ /\A[A-Z_]\w*\z/i) ) {
    print "The value of \$fred doesn't look like a Perl identifier name.\n";
}
# Generally, you should pick the way of writing code that makes the most sense to you,
# since that will probably make the most sense to your maintenance programmer. If it
# makes the most sense to write if with a negation, do that. More often, however, you’ll
# probably find it natural to use unless.

# Statement Modifiers
# In order to have a more compact notation, a statement may be followed by a modifier
# that controls it. For example, the if modifier works in a way analogous to an if
# block:
print "$n is a negative number.\n" if $n < 0;
# That gives exactly the same result as if you had used this code, except that you saved
# some typing by leaving out the parentheses and curly braces:
if ($n < 0) {
    print "$n is a negative number.\n";
}
# As we’ve said, Perl folks generally like to avoid typing. And the shorter form reads
# like in English: print this message if $n is less than zero.
# Notice that the conditional expression is still evaluated first, even though it’s written
# at the end. This is backward from the usual left-to-right ordering; in understanding
# Perl code, you have to do as Perl’s internal compiler does, and read to the end of the
# statement before you can tell what it’s really doing.

# Loop Controls
# As you’ve surely noticed by now, Perl is one of the so-called “structured” program‐
# ming languages. In particular, there’s just one entrance to any block of code, which is
# at the top of that block. But there are times when you may need more control or ver‐
# satility than what we’ve shown so far. For example, you may need to make a loop like
# a while loop, but one that always runs at least once. Or maybe you need to occasion‐
# ally exit a block of code early. Perl has three loop control operators you can use in
# loop blocks to make the loop do all sorts of tricks.
# The last Operator
# The last operator immediately ends execution of the loop. (If you’ve used the
# “break” operator in C or a similar language, it’s like that.) It’s the “emergency exit” for
# loop blocks. When you hit last, the loop is done.

# The next Operator
# Sometimes you’re not ready for the loop to finish, but you’re done with the current
# iteration. That’s what the next operator is good for. It jumps to the inside of the bot‐
# tom of the current loop block. After next, control continues with the next iteration of
# the loop (much like the continue operator in C or a similar language).


# The redo Operator
# The third member of the loop control triad is redo. It says to go back to the top of the
# current loop block, without testing any conditional expression or advancing to the
# next iteration. (If you’ve used C or a similar language, you’ve never seen this one
# before. Those languages don’t have this kind of operator.).

# The Conditional Operator
# When Larry was deciding which operators to make available in Perl, he didn’t want
# former C programmers to miss something that C had and Perl didn’t, so he brought
# over all of C’s operators to Perl. That meant bringing over C’s most confusing opera‐
# tor: the conditional operator ?:. While it may be confusing, it can also be quite use‐
# ful.
# The “conditional operator” is like an if-then-else test, all rolled into an expression. It’s
# sometimes called a “ternary operator” because it takes three operands. It looks like
# this:
# expression ? if_true_expr : if_false_expr

# Logical Operators
# As you might expect, Perl has all of the necessary logical operators needed to work
# with Boolean (true/false) values. For example, it’s often useful to combine logical tests
# by using the logical AND operator (&&) and the logical OR operator (||)