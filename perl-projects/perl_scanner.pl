#!/usr/bin/perl

use strict;
use warnings;

print "Enter the target IP range (e.g., 192.168.0.1/24): ";
my $target = <STDIN>;
chomp($target);

print "Starting scan...\n";
system("nmap -sn $target");
print "Scan completed.\n";
