# The Current Working Directory
# Your program runs with a working directory. This is the default directory for every‐
# thing your program does.
# With the Cwd module (part of the Standard Library), you can see what that directory
# is. Try this program, which we’ll call show_my_cwd:

use Cwd;

print getcwd()


# Manipulating Files and Directories
# Perl is commonly used to wrangle files and directories. Because Perl grew up in a
# Unix environment and still spends most of its time there, most of the description in
# this chapter may seem Unix centric. But the nice thing is that to whatever degree pos‐
# sible, Perl works exactly the same way on non-Unix systems.
# Removing Files
# Most of the time, you make files so that the data can stay around for a while. But
# when the data has outlived its usefulness, it’s time to make the file go away. At the
# Unix shell level, you type an rm command to remove a file or files:
# $ rm slate bedrock lava
# In Perl, you use the unlink operator with a list of the files that you want to remove:

# unlink 'slate', 'bedrock', 'lava';
# unlink qw(slate bedrock lava);
# This sends the three named files away to bit heaven, never to be seen again.

# Renaming Files
# Giving an existing file a new name is simple with the rename function:
# rename 'old', 'new';