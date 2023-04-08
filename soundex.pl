my $input = $ARGV[0];
my @output;
# takes in 1 parameter that is an character array
sub soundex
{
	@array = @_;
	$ret;
	for $index (0..$#array) {
		$ret .= ($index < 1) ? $array[$index] : "";
		if ($array[$index] =~ m/[wh]/) { $ret .= "";}
		if ($array[$index] =~ m/[aeiouy]/) { $ret .= "_";}
		if ($array[$index] =~ m/[bpfv]/) { $ret .= "1";}
		if ($array[$index] =~ m/[cgjkqsxz]/) { $ret .= "2";}
		if ($array[$index] =~ m/[dt]/) { $ret .= "3";}
		if ($array[$index] =~ m/[l]/) { $ret .= "4";}
		if ($array[$index] =~ m/[mn]/) { $ret .= "5";}
		if ($array[$index] =~ m/[r]/) { $ret .= "6";}
		$l = length($ret) - 1;
		$cur = substr($ret, $l, 1);
		$prev = substr($ret, $l - 1, 1);
		if ($cur =~ $prev and $l > 1) { $ret = substr($ret, 0, $l - 1); }
	}
	$ret =~ s/[^a-zA-Z0-9]*//g;
	$ret = substr($ret, 0, 4);
	return $ret;
}

# https://gist.github.com/ishu3101/00c296fcb04bb10f4c2d5fbff894b06a
for $i (0..length($input)-1) {
	$char = substr($input, $i, 1);
	push(@output,$char);
}

$output = soundex(@output);
print $output;