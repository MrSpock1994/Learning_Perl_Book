# Finding Modules
# Modules come in two types: those that come with Perl and that you should already
# have available to you, and those that you can get from CPAN to install yourself.
# Unless we say otherwise, the modules that we show come with Perl.

# To find modules that don’t come with Perl, start at MetaCPAN. You can also browse
# the distribution and have a peek at the files without the bother of installing the mod‐
# ules. You can read the module documentation before you download the entire pack‐
# age. There are many other tools for inspecting a distribution too.

# But before you go looking for a module, you should check if it is already installed.
# One way is to just try to read the documentation with perldoc. The Digest::SHA
# module comes with Perl (and we’ll use it later), so you should be able to read its
# documentation

# $ perldoc Digest::SHA
# Try it with a module that does not exist and you’ll get an error message:
# $ perldoc Llamas
# No documentation found for "Llamas".
# The documentation may be available in other formats (such as HTML) on your sys‐
# tem too. If the documentation is there, you have the module installed.
# The cpan command that comes with Perl can give you details on a module:
# $ cpan -D Digest::SHA

