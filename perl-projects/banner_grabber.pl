#!/usr/bin/perl
use strict;
use warnings;
use IO::Socket::INET;

# Function to grab banner information from a target host
sub grab_banner {
    my $target = shift;
    my $port = shift;

    my $socket = IO::Socket::INET->new(
        PeerAddr => $target,
        PeerPort => $port,
        Proto => 'tcp',
        Timeout => 3
    );

    if ($socket) {
        $socket->recv(my $banner, 1024);
        print "Banner from $target:$port:\n$banner\n";
        close($socket);
    } else {
        print "Could not connect to $target:$port\n";
    }
}

# Usage function
sub usage {
    print "Usage: $0 <target_host> <port>\n";
    exit 1;
}

# Check if both target host and port are provided
usage() unless @ARGV == 2;
my ($target_host, $port) = @ARGV;

# Get and display the banner information
grab_banner($target_host, $port);
