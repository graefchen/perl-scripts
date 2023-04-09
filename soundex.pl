# Examples:
#
# Euler, Ellery -> E460
# Gauss, Ghosh -> G200
# Hilbert, Heilbronn -> H416
# Knuth, Kant -> K530
# Lloyd, Ladd -> L300
# Lukasiewicz, Lissajous -> L222

# getting the arguments as input lol
my @input = $ARGV[0];
sub soundex
{
	my @results = map {
		# returns uppercase result of the input
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
			$nocode;
		}
	} @_;
	# checks if the result of the subrotone is either
	# an array or a scalar
	# and depending on that returns the result
	wantarray ? @results : $results[0];
}

my @names = ("Euler", "Ellery", "Gauss", "Ghosh", "Hilbert", "Heilbronn", "Knuth", "Kant", "Lloyd", "Ladd", "Lukasiewicz", "Lissajous");

my @solution = soundex(@names);
for $i (0..length(solution)) {
	print $names[$i]," => ",$solution[$i],"\n";
}
