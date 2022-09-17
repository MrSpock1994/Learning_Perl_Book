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

# Databases and DBI
# The DBI (Database Interface) module doesn’t come with Perl, but it’s one of the most
# popular modules since most people have to connect to a database of some sort. The
# beauty of DBI is that it allows you to use the same interface for just about any database
# server (or fake server, even), from simple comma-separated value files to enterprise
# servers such as Oracle. It has ODBC drivers, and some of its drivers are even vendor-
# supported. To get the full details, check out Programming the Perl DBI by Alligator
# Descartes and Tim Bunce (O’Reilly). You can also take a look at the DBI website.
# Once you install DBI, you also have to install a DBD (Database Driver). You can get a
# long list of DBDs from MetaCPAN. Install the right one for your database server, and
# ensure that you get the version that goes with the version of your server.
# The DBI is an object-oriented module, but you don’t have to know everything about
# OO programming to use it. You just have to follow the examples in the documenta‐
# tion. To connect to a database, you use the DBI module, then call its connect method:
# use DBI;
# $dbh = DBI->connect($data_source, $username, $password);
# The $data_source contains information particular to the DBD that you want to use,
# so you’ll get that from the DBD. For PostgreSQL, the driver is DBD::Pg, and the
# $data_source is something like:
# my $data_source = "dbi:Pg:dbname=name_of_database";
# Once you connect to the database, you go through a cycle of preparing, executing,
# and reading queries:
# my $sth = $dbh->prepare("SELECT * FROM foo WHERE bla");
# $sth->execute();
# my @row_ary = $sth->fetchrow_array;
# $sth->finish;
# When you are finished, you disconnect from the database:
# $dbh->disconnect();
# The DBI can do all sorts of other things too. See its documentation for more details.
# Although it’s a bit old, Programming the Perl DBI is still mostly a good introduction to
# the module.

# The localtime Function
# When you have a timestamp number (such as the ones from stat), it will typically
# look something like 1454133253. That’s not very useful for most humans, unless you
# need to compare two timestamps by subtracting. You may need to convert it to some‐
# thing human-readable, such as a string like “Sat Jan 30 00:54:13 2016.” Perl can
# do that with the localtime function in a scalar context:

my $timestamp = 1454133253;
my $date = localtime $timestamp;

print "$date"