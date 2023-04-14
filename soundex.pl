#!/usr/bin/perl

# Examples:
#
# Euler, Ellery -> E460
# Gauss, Ghosh -> G200
# Hilbert, Heilbronn -> H416
# Knuth, Kant -> K530
# Lloyd, Ladd -> L300
# Lukasiewicz, Lissajous -> L222

use strict;
use warnings;

# getting the arguments as input lol
my @input = $ARGV[0];
sub soundex(@)
{
	# mapping the "@_" to an list results
	# aka. mapping works in a way that for every
	# entry the defined function
	# syntax looks a little bit weird compared
	# to other languages but works fine
	my @results = map {
		# returns uppercase result of the entry
		my $code = uc($_);
		if (length($code)) {
			my $firstchar = substr($code, 0, 1);
			# transliterating through the string
			# swapping characters out
			# and getting rid of every duplicate
			$code =~ tr[AEHIOUWYBFPVCGJKQSXZDTLMNR]
					   [00000000111122222222334556]s;
			# ignoring the first char, and removing 0
			($code = substr($code, 1)) =~ tr/0//d;
			# creating the string to be returned
			substr($firstchar . $code . '000', 0, 4);
		} else {
			# return nothing
			my $nocode;
		}
	} @_;
	# checks if the result of the subrotone is either
	# an array or a scalar
	# and depending on that returns the result
	wantarray ? @results : $results[0];
}

my @names = ("Euler", "Ellery", "Gauss", "Ghosh", "Hilbert", "Heilbronn", "Knuth", "Kant", "Lloyd", "Ladd", "Lukasiewicz", "Lissajous");

my @solution = soundex(@names);
for my $i (0..scalar(@solution)-1) {
	print $names[$i]," => ",$solution[$i],"\n";
}

my $name = "Euler";
my $solution = soundex($name);
print $name," => ",$solution,"\n";
