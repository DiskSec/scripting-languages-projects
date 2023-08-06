#!/usr/bin/perl
use strict;
use warnings;
use LWP::Simple;

# Function to fetch IP geolocation information
sub get_ip_geolocation {
    my $ip = shift;
    my $url = "http://ip-api.com/json/$ip";
    my $json_data = get($url);
    
    if ($json_data) {
        my $data = decode_json($json_data);
        if ($data->{status} eq 'success') {
            return {
                country => $data->{country},
                region => $data->{regionName},
                city => $data->{city},
                isp => $data->{isp}
            };
        }
    }
    return undef;
}

# Usage function
sub usage {
    print "Usage: $0 <ip_address>\n";
    exit 1;
}

# Check if the IP address is provided
usage() unless @ARGV == 1;
my $ip_address = $ARGV[0];

# Get and display IP geolocation information
my $geolocation_info = get_ip_geolocation($ip_address);
if ($geolocation_info) {
    print "IP Address: $ip_address\n";
    print "Country: $geolocation_info->{country}\n";
    print "Region: $geolocation_info->{region}\n";
    print "City: $geolocation_info->{city}\n";
    print "ISP: $geolocation_info->{isp}\n";
} else {
    print "Unable to fetch geolocation information for $ip_address\n";
}
