# $Id: Data.pm,v 1.5 2003/11/27 14:19:37 comdog Exp $
package Business::ISBN::Data;
use vars qw($VERSION);

$VERSION = sprintf "%d.%02d", q$Revision: 1.5 $ =~ m/ (\d+) \. (\d+) /xg;

=head1 NAME 

Business::ISBN::Data - data pack for Business::ISBN

=head1 SYNOPSIS

see L<Business::ISBN>

=head1 DESCRIPTION

Business::ISBN uses this "data pack" to do its work.  You can update
Business::ISBN::Data independently of the main module as the various
ISBN organizations assign new publisher codes.  The ISBN agency lists
these data at http://www.isbn-international.org/identifiers.html .

Note, that as a historical artifact, some countries are actaully
language areas. For instance, country code 2 is "French", and includes
several French-speaking countries.

Simply install this module over the previous version.  The module is
a Perl data structure, so you can install it with CPAN.pm, or simply
copy it to the right location.

Older versions of this module did not declare a version.

=head1 SOURCE AVAILABILITY

This source is part of a SourceForge project which always has the
latest sources in CVS, as well as all of the previous releases.

	https://sourceforge.net/projects/perl-isbn/
	
If, for some reason, I disappear from the world, one of the other
members of the project can shepherd this module appropriately.

=head1 AUTHOR

brian d foy, E<lt>bdfoy@cpan.orgE<gt>

=cut

package Business::ISBN;


%country_data = (
    0 => [ 'English',                   [ '00'=>19, 200=>699, 7000=>8499, 85000=>89999, 900000=>949999, 9500000=>9999999, ] ],
	1 => [ 'English',	                [ 4000 => 4154, 55000=>86979, 869800=>998999, 9999900=>9999999]],
    2 => [ 'French',                    [ '00'=>19, 200=>349, 35000=>39999, 495=>599, 7000=>7599, 7600=>8249, 84000=>86999, 87000=>87999, 89000=>89999, 900000=>919768, 919869=>939999, 9500000=>9699999, 9800000=>9999999, ]],
    3 => [ 'German',                    [ '00'=>'00', '030'=>'033', '0340'=>'0369', '03700'=>'03999','04'=>19, 250=>699, 7150=>8499, 85500=>89999, 905000=>949999, 9520000=>9539999, 9700000=>9999999, ]],
    4 => [ 'Japan',                     [ '00'=>19, 200=>699, 7000=>8499, 85000=>89999, 900000=>949999, 9500000=>9999999, ] ],
    5 => [ 'Russian Federation',        [ '00'=>19, 200=>699, 7000=>8499, 85000=>89999, 900000=>949999, 9500000=>9999999, ] ],
    7 => [ 'China',                     [ '00'=>'09', 100=>499, 5000=>7999, 80000=>89999, 900000=>999999, ] ],
   80 => [ 'Czech Republic',            [ '00'=>19, 200=>699, 7000=>8499, 85000=>89999, 900000=>999999, ] ],
   81 => [ 'India',                     [ '00'=>19, 200=>699, 7000=>8499, 85000=>89999, 900000=>999999, ] ],
   82 => [ 'Norway',                    [ '00'=>19, 200=>699, 7000=>8999, 90000=>98999, 990000=>999999, ] ],
   83 => [ 'Poland',                    [ '00'=>19, 200=>699, 7000=>8499, 85000=>89999, 900000=>999999, ] ],
   84 => [ 'Spain',                     [ '00'=>19, 200=>699, 7000=>8499, 85000=>89999, 900000=>949999, 95000=>96999, 9700=>9999, ] ],
   85 => [ 'Brazil',                    [ '00'=>19, 200=>699, 7000=>8499, 85000=>89999, 900000=>979999, 98000=>99999 ] ],
   86 => [ 'Yugoslavia',                [ '00'=>29, 300=>699, 7000=>7999, 80000=>89999, 900000=>999999, ] ],
   87 => [ 'Denmark',                   [ '00'=>29, 400=>649, 7000=>7999, 85000=>94999, 970000=>999999, ] ],
   88 => [ 'Italian',                   [ '00'=>19, 200=>599, 6000=>8499, 85000=>89999, 900000=>999999 ] ],
   89 => [ 'Korea',                     [ '00'=>24, 250=>549, 5500=>8499, 85000=>94999, 950000=>999999, ] ],
   90 => [ 'Belgium and Netherlands',   [ '00'=>19, 200=>499, 5000=>6999, 70000=>79999, 800000=>849999, 8500=>8999, 90=>90, 94=>94 ] ],
   91 => [ 'Sweden',                    [ '0'=>1, 20=>49, 500=>649, 7000=>7999, 85000=>94999, 970000=>999999, ] ],
   92 => [ 'Unesco',                    [ '0'=>5, 60=>76, 800=>899, 9000=>9151, 9153=>9499, 95000=>98999, 990000=>999999, ] ],
   93 => [ 'India',                     [ '0'=>0 ] ],
  950 => [ 'Argentina',                 [ '00'=>49, 500=>899, 9000=>9899, 99000=>99999, ] ],
  951 => [ 'Finland',                   [ '0'=>1, 20=>54, 550=>889, 8900=>9499, 95000=>99999, ] ],
  952 => [ 'Finland',                   [ '00'=>19, 200=>499, 5000=>5999, 60=>65, 6600=>6699, 67000=>69999, 7000=>7999, 80=>94, 9500=>9899, 99000=>99999, ] ],
  953 => [ 'Croatia',                   [ '0'=>'0', 10=>14, 150=>599, 6000=>9499, 95000=>99999] ],
  954 => [ 'Bulgaria',                  [ '00'=>29, 300=>799, 8000=>8999, 90000=>92999, 90000=>92999, 9300=>9999, ] ],
  955 => [ 'Sri Lanka',                 [ '0'=>1, 20=>54, 550=>799, 8000=>9499, 95000=>99999, ] ],
  956 => [ 'Chile',                     [ '00'=>19, 200=>699, 7000=>9999, ] ],
  957 => [ 'Taiwan, China',             [ '0'=>'02', '0300'=>'0499', '05'=>19, 2000=>2099, 21=>27, 28000=>30999, 31=>43, 440=>819, 8200=>9699, 97000=>99999 ] ],
  958 => [ 'Colombia',                  [ '00'=>59, 600=>799, 8000=>9499, 95000=>99999, ] ],
  959 => [ 'Cuba',                      [ '00'=>19, 200=>699, 7000=>8499, ] ],
  960 => [ 'Greece',                    [ '00'=>19, 200=>699, 7000=>8499, 85000=>99999, ] ],
  961 => [ 'Slovenia',                  [ '00'=>19, 200=>599, 6000=>8999, 90000=>94999, ] ],
  962 => [ 'Hong Kong',                 [ '00'=>19, 200=>699, 7000=>8499, 85000=>86999, 8700=>8999, 900=>999, ] ],
  963 => [ 'Hungary',                   [ '00'=>19, 200=>699, 7000=>8499, 85000=>89999, 9000=>9999, ] ],
  964 => [ 'Iran',                      [ '00'=>29, 300=>549, 5500=>8999, 90000=>99999, ] ],
  965 => [ 'Israel',                    [ '00'=>19, 200=>599, 7000=>7999, 90000=>99999, ] ],
  966 => [ 'Ukraine',                   [ '00'=>29, 500=>699, 7000=>7999, 90000=>99999, ] ],
  967 => [ 'Malaysia',                  [ '0'=>5, 60=>89, 900=>989, 9900=>9989, 99900=>99999, ] ],
  968 => [ 'Mexico',                    [ '01'=>39, 400=>499, 5000=>7999, 800=>999, ] ],
  969 => [ 'Pakistan',                  [ '0'=>1, 20=>39, 400=>799, 8000=>9999, ] ],
  970 => [ 'Mexico',                    [ '01'=>59, 600=>899, 9000=>9099, 91000=>9699, 9700=>9999 ] ],
  971 => [ 'Philippines',               [ '000'=>'019', '02'=>'02', '0300'=>'0599', '06'=>'09', 10=>49, 500=>849, 8500=>9099, 91000=>99999 ] ],
  972 => [ 'Portugal',                  [ '0'=>1, 20=>54, 550=>799, 8000=>9499, 95000=>99999, ] ],
  973 => [ 'Romania',                   [ '0'=>1, 20=>54, 550=>769, 7700=>8499, 85000=>89999, 9000=>9499, 95000=>99999] ],
  974 => [ 'Thailand',                  [ '00'=>19, 200=>699, 7000=>8499, 85000=>89999, ] ],
  975 => [ 'Turkey',                    [ '00'=>24, 250=>599, 6000=>9199, 92000=>98999, ] ],
  976 => [ 'Caribbean Community',       [ '0'=>3, 40=>59, 600=>799, 8000=>9499, 95000=>99999, ] ],
  977 => [ 'Egypt',                     [ '00'=>19, 200=>499, 5000=>6999, 700=>999, ] ],
  978 => [ 'Nigeria',                   [ '000'=>199, 2000=>2999, 30000=>79999, 8000=>8999, 900=>999, ] ],
  979 => [ 'Indonesia',	                [ '0'=>'0', 20=>29, 400=>799, 8000=>9599, 96000=>99999]],
  980 => [ 'Venezuela',                 [ '00'=>19, 200=>599, 6000=>9999, ] ],
  981 => [ 'Singapore',                 [ '00'=>19, 200=>299, 3000=>9999, ] ],
  982 => [ 'South Pacific',             [ '00'=>'09', 100=>699, 70=>89, 9000=>9999, ] ],
  983 => [ 'Malaysia',                  [ '00'=>'01', '020'=>199, 2000=>3999, 40000=>49999, 50=>79, 800=>899, 9000=>9899, 99000=>99999, ] ],
  984 => [ 'Bangladesh',                [ '00'=>39, 400=>799, 8000=>8999, 90000=>99999, ] ],
  985 => [ 'Belarus',                   [ '00'=>39, 400=>599, 6000=>8999, 90000=>99999, ] ],
  986 => [ 'Taiwan, China',             [ '00'=>19, 200=>559, 5600=>7999, 8000=>99999, ] ],
  987 => [ 'Argentina',                 [ '00'=>'09', 1000=>1999, 20000=>29999, 30=>49, 500=>899, 9000=>9499, 95000=>99999, ] ],
 9953 => [ 'Lebanon',                   [ '0'=>'0', 10=>39, 400=>599, 60=>89, 9000=>9999 ] ],
 9954 => [ 'Morocco',                   [ '0'=>1, 20=>39, 400=>799, 8000=>9999, ] ],
 9955 => [ 'Lithuania',                 [ '00'=>39, 400=>899, 9000=>9999, ] ],
 9957 => [ 'Jordan',                    [ '00'=>39, 400=>849, 8500=>9999, ] ],
 9958 => [ 'Bosnia and Herzegovina',    [ '0'=>0 ] ],
 9959 => [ 'Libya',                     [ '0'=>1, 20=>79, 800=>949, 9500=>9999, ] ],
 9960 => [ 'Saudi Arabia',              [ '00'=>59, 600=>899, 9000=>9999, ] ],
 9961 => [ 'Algeria',                   [ '0'=>4, 50=>79, 800=>949, 9500=>9999, ] ],
 9962 => [ 'Panama',                    [ '00'=>54, 5500=>5599, 56=>59, 600=>849, 8500=>9999, ] ],
 9963 => [ 'Cyprus',                    [ '0'=>2, 30=>54, 550=>749, 7500=>9999, ] ],
 9964 => [ 'Ghana',                     [ '0'=>6, 70=>94, 950=>999, ] ],
 9965 => [ 'Kazakhstan',                [ '00'=>39, 400=>899, 9000=>9999, ] ],
 9966 => [ 'Kenya',                     [ '00'=>69, 800=>959, 9600=>9999, ] ],
 9967 => [ 'Kyrgyzstan',                [ '00'=>39, 400=>899, 9000=>9999, ] ],
 9968 => [ 'Costa Rica',                [ '0'=>'0', 10=>69, 700=>969, 9700=>9999] ],
 9970 => [ 'Uganda',                    [ '00'=>39, 400=>899, 9000=>9999, ] ],
 9971 => [ 'Singapore',                 [ '0'=>5, 60=>89, 900=>989, 9900=>9999, ] ],
 9972 => [ 'Peru',                      [ '00'=>'09', 1=>2, 30=>59, 600=>899, 9000=>9999, ] ],
 9973 => [ 'Tunisia',                   [ '0'=>'0', 10=>69, 700=>969, 9700=>9999]],
 9974 => [ 'Uruguay',                   [ '0'=>2, 30=>54, 550=>749, 7500=>9499, 95=>99 ] ],
 9975 => [ 'Moldova',                   [ '0'=>4, 50=>89, 900=>949, 9500=>9999, ] ],
 9976 => [ 'Tanzania',                  [ '0'=>5, 60=>89, 900=>989, 9990=>9999, ] ],
 9977 => [ 'Costa Rica',                [ '00'=>89, 900=>989, 9900=>9999]],
 9978 => [ 'Ecuador',                   [ '00'=>29, 300=>399, 40=>94, 950=>989, 9900=>9999, ] ],
 9979 => [ 'Iceland',                   [ '0'=>4, 50=>75, 760=>899, 9000=>9999, ] ],
 9980 => [ 'Papua New Guinea',          [ '0'=>3, 40=>89, 900=>989, 9900=>9999 ] ],
 9981 => [ 'Morocco',                   [ '00'=>'09', 100=>159, 1600=>1999, 20=>79, 800=>949, 9500=>9999, ] ],
 9982 => [ 'Zambia',                    [ '00'=>79, 800=>889, 9900=>9999, ] ],
 9983 => [ 'Gambia',                    [ 80=>94, 950=>989, 9900=>9999, ] ],
 9984 => [ 'Latvia',                    [ '00'=>49, 500=>899, 9000=>9999, ] ],
 9985 => [ 'Estonia',                   [ '0'=>4, 50=>79, 800=>899, 9000=>9999, ] ],
 9986 => [ 'Lithuania',                 [ '00'=>39, 400=>899, 9000=>9399, 940=>969, 97=>99, ] ],
 9987 => [ 'Tanzania',                  [ '00'=>39, 400=>879, 8800=>9999, ] ],
 9988 => [ 'Ghana',                     [ '0'=>2, 30=>54, 550=>749, 7500=>9999, ] ],
 9989 => [ 'Macedonia',                 [ '0'=>'0', 100=>199, 2000=>2999, 30=>59, 600=>949, 9500=>9999, ] ],
99901 => [ 'Bahrain',                   [ '00'=>49, 500=>999, ] ],
99903 => [ 'Mauritius',                 [ '0'=>1, 20=>89, 900=>999, ] ],
99904 => [ 'Netherlands Antilles',      [ '0'=>5, 60=>89, 900=>999, ] ],
99905 => [ 'Bolivia',                   [ '0'=>3, 40=>79, 800=>999, ] ],
99906 => [ 'Kuwait',                    [ '0'=>2, 30=>59, 600=>699, 70=>89, 9=>9 ] ],
99908 => [ 'Malawi',                    [ '0'=>'0', 10=>89, 900=>999 ] ],
99909 => [ 'Malta',                     [ '0'=>3, 40=>94, 950=>999, ] ],
99910 => [ 'Sierra Leone',              [ '0'=>2, 30=>89, 900=>999, ] ],
99911 => [ 'Lesotho',                   [ '00'=>59, 600=>999, ] ],
99912 => [ 'Botswana',                  [ '0'=>5, 60=>89, 900=>999, ] ],
99913 => [ 'Andorra',                   [ '0'=>0 ] ],
99914 => [ 'Suriname',                  [ '0'=>4, 50=>89, 900=>949, ] ],
99915 => [ 'Maldives',                  [ '0'=>4, 50=>79, 800=>999, ] ],
99916 => [ 'Namibia',                   [ '0'=>2, 30=>69, 700=>999, ] ],
99917 => [ 'Brunei Darussalam',         [ '0'=>2, 30=>89, 900=>999, ] ],
99918 => [ 'Faroe Islands',             [ '0'=>3, 40=>89, 900=>999, ] ],
99919 => [ 'Benin',                     [ '0'=>2, 40=>69, 900=>999, ] ],
99920 => [ 'Andorra',                   [ '0'=>4, 50=>89, 900=>999, ] ],
99921 => [ 'Qatar',                     [ '0'=>1, 20=>69, 700=>999, 8=>8, 90=>99 ] ],
99922 => [ 'Guatemala',                 [ '0'=>4, 50=>79, 800=>900, ] ],
99923 => [ 'El Salvador',               [ '0'=>1, 20=>79, 800=>999, ] ],
99924 => [ 'Nicaragua',                 [ '0'=>2, 30=>79, 800=>900, ] ],
99925 => [ 'Paraguay',                  [ '0'=>3, 40=>79, 800=>999, ] ],
99927 => [ 'Albania',                   [ '0'=>2, 30=>59, 600=>999, ] ],
99930 => [ 'Armenia',                   [ '0'=>4, 50=>79, 800=>999, ] ],
99931 => [ 'Seychelles',                [ '0'=>4, 50=>79, 800=>999, ] ],
99932 => [ 'Malta',                     [ '0'=>0, 10=>59, 600=>699, 7=>7, 80=>99 ] ],
99933 => [ 'Nepal',                     [ '0'=>2, 30=>59, 600=>999  ] ],
99934 => [ 'Dominican Republic',        [ '0'=>1, 20=>79, 800=>999, ] ],
99935 => [ 'Haiti',                     [ 2=>2, 30=>59, 600=>999, ] ],
99937 => [ 'Macau',                     [ '0'=>1, 20=>59, 600=>999, ] ],
99938 => [ 'Srpska (Republic of)',      [ '0'=>2, 30=>59, 600=>999, ] ],
99939 => [ 'Guatemala',                 [ '0'=>0 ] ],
99942 => [ 'Sudan',                     [] ],
99946 => [ 'Korea, PDR',                [ '0'=>1, 20=>39, 400=>899, 9000=>9999, ] ],
99947 => [ 'Algeria',                   [ '0'=>1, 20=>79, 800=>999 ] ],
);

# i cheat a little bit here.  i know that that the max length is
# 5, and that i know that those will start with 999xx. :)
# however, if the data changes i should think about this again.
$MAX_COUNTRY_CODE_LENGTH = length( 
	( sort { $a <=> $b } keys %country_data )[-1]
	);


1;
