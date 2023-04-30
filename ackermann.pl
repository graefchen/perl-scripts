#!/usr/bin/perl

sub ackerman
{
	my ($m, $n) = @_;
	my $ans;
	if ($m == 0) {
		$ans =  $n + 1;
	} 
	elsif ($n == 0) {
		$ans = ackerman($m - 1, 1);
	}
	else {
		$ans = ackerman($m - 1, ackerman($m, $n - 1));
	}
	return $ans;
}

print "A(0,1) => ", ackerman(0, 1),"\n";
print "A(1,1) => ", ackerman(1, 1),"\n";
print "A(1,2) => ", ackerman(1, 2),"\n";
print "A(1,3) => ", ackerman(1, 3),"\n";
print "A(1,4) => ", ackerman(1, 4),"\n";
print "A(2,1) => ", ackerman(1, 1),"\n";
print "A(3,1) => ", ackerman(3, 1),"\n";
print "A(4,1) => ", ackerman(4, 1),"\n";
