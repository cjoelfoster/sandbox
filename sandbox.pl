#!/usr/bin/perl

use strict;
use warnings;


sub Line{
	my ($symbol, $length, $offset) = @_;
	unless($symbol){$symbol = " ";}
	unless($length){$length = 0;}
	if($offset){
		print " " x $offset;
	}
		print $symbol x $length;
		print "\n";
}

sub MenuEntry{
	# Format single menu entry
	my ($entry, $active, $shift) = @_;
	my $length = 14;
	my $offset = 4;
	if($entry eq "bbar"){&Line("=", $length, $shift);}
	elsif($entry eq "bar"){&Line("-", $length, $shift);}
	else{
		if($active){print "*", " " x ($shift + $offset - 1);}
		else{print " " x ($shift + $offset);}
		print $entry;
		print "\n";
	}
}

sub Menu{
	# Format menu entries for display
	my %entry = @_;
	my $shift = 1;
	&MenuEntry("bbar", 0, $shift);
	&MenuEntry("MENU:", 0, $shift);
	&MenuEntry("bar", 0, $shift);
	&MenuEntry("exit", 0, $shift);
	&MenuEntry("restart", 0, $shift);
	&MenuEntry("cls", 0, $shift);
	&MenuEntry("menu", 0, $shift);
	&MenuEntry("bar", 0, $shift);
	foreach my $item (sort keys %entry){&MenuEntry($item, $entry{$item}, $shift);}
	&MenuEntry("bbar", 0, $shift);
}


#my @menu = qw(exit clear restart echo esrever CAPS l33k pswd);



sub Clear{print `clear`;}

sub Init{
	&Clear();
	print "Please enter your name: ";
	my $name = <STDIN>;
	chomp $name;
	print "Hello $name! Welcome to the Sandbox!\n";
	print "Type \'menu\' at any time to see the Menu\n";
	return $name;
}

#print &MainMenu(@menu);

sub esrever{
	my $gnirst = $_[0];
	chomp $gnirst;
	return reverse $gnirst;
}

sub caps{return uc $_[0];}

sub l33k{
		#i->1, e->3, a->4, s->$, o->0
		my $string = $_[0];
		$string =~ s/a/\@/g;
		$string =~ s/A/4/g;
		$string =~ s/e/3/ig;
		$string =~ s/i/1/ig;
		$string =~ s/o/0/ig;
		$string =~ s/s/\$/ig;
		return $string;
}

sub pswd{
		my $string = $_[0];
		return "*" x length $string;
}

#print pswd("password");

#print &l33k("password");
		

sub End{
	my $name = $_[0];
	print "Goodbye $name!\n";
	exit;
}
#my %is_invited = map {$_ => 1} @names;
# Begin Sandbox
sub Main{

#	my %menu = map {$_ => 0} qw(exit cls restart echo esrever CAPS l33k pswd);

	while(1){
		my $name = "Siri";
		my %menu = map {$_ => 0} qw(echo esrever CAPS l33k pswd);
		my $P = ":: ";
		my $term = 1;
		$name = &Init();
		my $prompt = $P;

		while(1){
			print $prompt;
			my $line = <STDIN>;
			chomp $line;
			# Main options
			if(		$line eq "exit"		){&Clear; &End($name);}
			elsif(	$line eq "restart"	){&Clear; last;}
			elsif(	$line eq "cls"		){&Clear; next;}			
			elsif(	$line eq "menu"		){&Clear; &Menu(%menu); next;}
			# Turn text options on/off
			elsif($line eq "esrever"){
				if($menu{$line}){$menu{$line} = 0; print "esrever off\n";}
				else{$menu{$line} = 1;print "no reverse\n";}
			}
			elsif($line eq "echo"){
				if($menu{$line}){$menu{$line} = 0; print "echo off\n";}
				else{$menu{$line} = 1; print "echo on\n";}
			}
			elsif($line eq "CAPS"){
				if($menu{$line}){$menu{$line} = 0; print "CAPS off\n";}
				else{$menu{$line} = 1; print "CAPS ON\n";}
			}
			elsif($line eq "l33k"){
				if($menu{$line}){$menu{$line} = 0; print "l33k off\n";}
				else{$menu{$line} = 1; print "l33k 0n\n";}
			}
			elsif($line eq "pswd"){
				if($menu{$line}){$menu{$line} = 0; print "pswd off\n";}
				else{$menu{$line} = 1; print "**** **\n";}
			}
			else{# apply options to text
				if($menu{"esrever"}){$line = &esrever($line);}
				if($menu{"CAPS"}){$line = &caps($line);}
				if($menu{"l33k"}){$line = &l33k($line);}
				if($menu{"pswd"}){$line = &pswd($line);}
				if($menu{echo}){print $line, "\n";}
			}
		}
	}
}

&Main();

__END__;

sub Echo{
	my state $echo;
	if($_){
		if($_ eq "on"){$echo = "on";}
		elsif($_ eq "off"){$echo = "off";}
		elsif($_ eq "rev"){$echo = "rev";}
	}

	return $echo;
}

exit
sub Menu{
	# Display menu to user and return valid selection
	my @menuItems = @_;
	my $validEntry = 1;
#	my $input = "";
#	while($validEntry){
		&Clear();
		&DisplayMenu(@menuItems);

#		print "\nType selection: ";
#		$input = <STDIN>;
#		chomp $input;

#		if(grep{lc $_ eq lc $input}@menuItems){$validEntry=0;}
#	}
#	return $input;
}

