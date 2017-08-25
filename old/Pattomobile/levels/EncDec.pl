($#ARGV < 2) and die ("\nUsage:\n\tEncDec.pl mode key [filename1 [filename2 [filename3 ...]]]");

$chars = '1234567890ABCDEFGHIJKLMNOPQRTSUVWXYZabcdefghijklmnopqrstuvwxyz.,/?!@$%^&*()_+-=:;~{}';
$mode = $ARGV[0];
$key = $ARGV[1];
@files = @ARGV;
splice(@files,0,2);

if ($key eq "") {
	die ("Key must contain at least 1 character!\n");
} else {
	$len = length($key);
	print "Key: '$key' (length: $len)\n";
	$len = length($chars);
	print "Using Alphabet: $chars (length: $len)\n"
};

if ($mode eq "encrypt") {
	print "Mode: '$mode'\n";
	for $file (@files) {
		encrypt($key, $file);
	};
} elsif ($mode eq "decrypt") {
	print "Mode: '$mode'\n";
	for $file (@files) {
		decrypt($key, $file);
	};
} else {
	die ("Invalid mode supplied: '$mode' (use either 'encrypt' or 'decrypt')\n");
};

sub encrypt {
	my $file = $_[1];
	my $key = $_[0];
	print "Encrypt file: $file > _$file\n";
	open (IN, "$file") or die ("Couldn't open input file!\n");
	binmode IN, ":raw";
	open (OUT, ">_$file") or die ("Couldn't open output file!\n");
	binmode OUT, ":raw";
	my $text = "";
	for $line (<IN>) {
		$text = $text . $line;
	};
	my $c;
	my $ki = 0;
	my $kl = length($key);
	my $al = length($chars);
	for $char (0 .. length($text)) {
		$c = index($chars,substr($text,$char,1));
		if ($c != -1) {
		  	$c = ($c + index($chars,substr($key,$ki % $kl,1))) % $al;
	  		print OUT substr($chars,$c,1);
	  	} else {
			print OUT substr($text,$char,1);
		};
		$ki++;
	};
	close IN;
	close OUT;
};

sub decrypt {
	my $file = $_[1];
	print "Decrypt file: $file > _$file\n";
	open (IN, "$file") or die ("Couldn't open input file!\n");
	binmode IN, ":raw";
	open (OUT, ">_$file") or die ("Couldn't open output file!\n");
	binmode OUT, ":raw";
	my $text = "";
	for $line (<IN>) {
		$text = $text . $line;
	};
	my $c;
	my $ki = 0;
	my $kl = length($key);
	my $al = length($chars);
	for $char (0 .. length($text)) {
		$c = index($chars,substr($text,$char,1));
		if ($c != -1) {
			$c = ($c - index($chars,substr($key,$ki % $kl,1)) + $al) % $al;
	  		print OUT substr($chars,$c,1);
		} else {
			print OUT substr($text,$char,1);
		};
		$ki++;
	};
	close IN;
	close OUT;
};