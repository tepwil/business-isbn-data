package Business::ISBN::Data;
use strict;
use vars qw($VERSION);

use Carp qw(carp);
use File::Basename qw(dirname);
use File::Spec::Functions qw(catfile);

$VERSION = '20140918.001';

=head1 NAME

Business::ISBN::Data - data pack for Business::ISBN

=head1 SYNOPSIS

see L<Business::ISBN>

=head1 DESCRIPTION

You don't need to load this module yourself in most cases. C<Business::ISBN>
will load it when it loads.

These data are generated from the F<RangeMessage.xml> file provided by
the ISBN Agency. You can retrieve this yourself at L<https://www.isbn-international.org/range_file_generation>.
This file is included as part of the distribution and should be installed
at F<~lib/Business/ISBN/RangeMessage.xml>.

If you want to use a different F<RangeMessage.xml> file, you can set
the C<ISBN_RANGE_MESSAGE> environment variable to the alternate location
before you load C<Business::ISBN>. This way, you can use the latest (or
even earlier) data without having to install something new or wait for
an update to this module.

If the default F<RangeMessage.xml> or your alternate one is not available,
the module falls back to data included in F<Data.pm>. However, that data
is likely to be older data.

The data are in C<%Business::ISBN::country_data> (although the "country"
part is historical). If you want to see where the data are from, check
C<$Business::ISBN::country_data{_source}>.

=head1 SOURCE AVAILABILITY

This module lives in the Github repository with Business::ISBN:

	git://github.com/briandfoy/business--isbn.git

If you have something to add, create a fork on Github and send a
pull request.

=head1 AUTHOR

brian d foy, C<< <bdfoy@cpan.org> >>

Yakov Shafranovich updated the data in October 2008.

Daniel Jakubik updated the data in July 2012.

=head1 COPYRIGHT AND LICENSE

Copyright (c) 2002-2014, brian d foy, All Rights Reserved.

You may redistribute this under the same terms as Perl itself.

=cut

sub _default_data {
	(
	_source => __FILE__,
	0     => ['English language' =>  ['00' => '19', '200' => '699', '7000' => '8499', '85000' => '89999', '900000' => '949999', '9500000' => '9999999'] ],
	1     => ['English language' =>  ['00' => '09', '100' => '399', '4000' => '5499', '55000' => '86979', '869800' => '998999', '9990000' => '9999999'] ],
	10    => ['France' =>  ['00' =>  '19', '200' => '699', '7000' => '8999', '90000' => '97599', '976000' => '999999'] ],
	2     => ['French language' =>  ['00' => '19', '200' => '349', '35000' => '39999', '400' => '699', '7000' => '8399', '84000' => '89999', '900000' => '949999', '9500000' => '9999999'] ],
	3     => ['German language' =>  ['00' => '02', '030' => '033', '0340' => '0369', '03700' => '03999', '04' => '19', '200' => '699', '7000' => '8499', '85000' => '89999', '900000' => '949999', '9500000' => '9539999', '95400' => '96999', '9700000' => '9899999', '99000' => '99499', '99500' => '99999'] ],
	4     => ['Japan' =>  ['00' => '19', '200' => '699', '7000' => '8499', '85000' => '89999', '900000' => '949999', '9500000' => '9999999'] ],
	5     => ['Russian Federation and former USSR' =>  ['00' => '19', '200' => '420', '4210' => '4299', '430' => '430', '4310' => '4399', '440' => '440', '4410' => '4499', '450' => '699', '7000' => '8499', '85000' => '89999', '900000' => '909999', '91000' => '91999', '9200' => '9299', '93000' => '94999', '9500000' => '9500999', '9501' => '9799', '98000' => '98999', '9900000' => '9909999', '9910' => '9999'] ],
	600   => ['Iran' =>  ['00' => '09', '100' => '499', '5000' => '8999', '90000' => '99999'] ],
	601   => ['Kazakhstan' =>  ['00' => '19', '200' => '699', '7000' => '7999', '80000' => '84999', '85' => '99'] ],
	602   => ['Indonesia' =>  ['00' => '17', '18000' => '18999', '19000' => '19999', '200' => '749', '7500' => '7999', '8000' => '9499', '95000' => '99999'] ],
	603   => ['Saudi Arabia' =>  ['00' => '04', '05' => '49', '500' => '799', '8000' => '8999', '90000' => '99999'] ],
	604   => ['Vietnam' =>  ['0' => '4', '50' => '89', '900' => '979', '9800' => '9999'] ],
	605   => ['Turkey' =>  ['' => '', '01' => '09', '100' => '399', '4000' => '5999', '60000' => '89999', '90' => '99'] ],
	606   => ['Romania' =>  ['0' => '0', '10' => '49', '500' => '799', '8000' => '9199', '92000' => '99999'] ],
	607   => ['Mexico' =>  ['00' => '39', '400' => '749', '7500' => '9499', '95000' => '99999'] ],
	608   => ['Macedonia' =>  ['0' => '0', '10' => '19', '200' => '449', '4500' => '6499', '65000' => '69999', '7' => '9'] ],
	609   => ['Lithuania' =>  ['00' => '39', '400' => '799', '8000' => '9499', '95000' => '99999'] ],
	611   => ['Thailand' =>  ['' => ''] ],
	612   => ['Peru' =>  ['00' => '29', '300' => '399', '4000' => '4499', '45000' => '49999', '50' => '99'] ],
	613   => ['Mauritius' =>  ['0' => '9'] ],
	614   => ['Lebanon' =>  ['00' => '39', '400' => '799', '8000' => '9499', '95000' => '99999'] ],
	615   => ['Hungary' =>  ['00' => '09', '100' => '499', '5000' => '7999', '80000' => '89999', ] ],
	616   => ['Thailand' =>  ['00' => '19', '200' => '699', '7000' => '8999', '90000' => '99999'] ],
	617   => ['Ukraine' =>  ['00' => '49', '500' => '699', '7000' => '8999', '90000' => '99999'] ],
	618   => ['Greece' =>  ['00' => '19', '200' => '499', '5000' => '7999', '80000' => '99999'] ],
	619   => ['Bulgaria' =>  ['00' => '14', '150' => '699', '7000' => '8999', '90000' => '99999'] ],
	620   => ['Mauritius' =>  ['0' => '9'] ],
	7     => ['China, People\'s Republic' =>  ['00' => '09', '100' => '499', '5000' => '7999', '80000' => '89999', '900000' => '999999'] ],
	80    => ['Czech Republic and Slovakia' =>  ['00' => '19', '200' => '699', '7000' => '8499', '85000' => '89999', '900000' => '999999'] ],
	81    => ['India' =>  ['00' => '19', '200' => '699', '7000' => '8499', '85000' => '89999', '900000' => '999999'] ],
	82    => ['Norway' =>  ['00' => '19', '200' => '699', '7000' => '8999', '90000' => '98999', '990000' => '999999'] ],
	83    => ['Poland' =>  ['00' => '19', '200' => '599', '60000' => '69999', '7000' => '8499', '85000' => '89999', '900000' => '999999'] ],
	84    => ['Spain' =>  ['00' => '13', '140' => '149', '15000' => '19999', '200' => '699', '7000' => '8499', '85000' => '89999', '9000' => '9199', '920000' => '923999', '92400' => '92999', '930000' => '949999', '95000' => '96999', '9700' => '9999'] ],
	85    => ['Brazil' =>  ['00' => '19', '200' => '599', '60000' => '69999', '7000' => '8499', '85000' => '89999', '900000' => '979999', '98000' => '99999'] ],
	86    => ['Serbia (shared)' =>  ['00' => '29', '300' => '599', '6000' => '7999', '80000' => '89999', '900000' => '999999'] ],
	87    => ['Denmark' =>  ['00' => '29', '' => '', '400' => '649', '' => '', '7000' => '7999', '' => '', '85000' => '94999', '' => '', '970000' => '999999'] ],
	88    => ['Italy' =>  ['00' => '19', '200' => '599', '6000' => '8499', '85000' => '89999', '900000' => '909999', '910' => '929', '' => '', '95000' => '99999'] ],
	89    => ['Korea, Republic' =>  ['00' => '24', '250' => '549', '5500' => '8499', '85000' => '94999', '950000' => '969999', '97000' => '98999', '990' => '999'] ],
	90    => ['Netherlands' =>  ['00' => '19', '200' => '499', '5000' => '6999', '70000' => '79999', '800000' => '849999', '8500' => '8999', '90' => '90', '910000' => '939999', '94' => '94', '950000' => '999999'] ],
	91    => ['Sweden' =>  ['0' => '1', '20' => '49', '500' => '649', '' => '', '7000' => '7999', '' => '', '85000' => '94999', '' => '', '970000' => '999999'] ],
	92    => ['International NGO Publishers and EC Organizations' =>  ['0' => '5', '60' => '79', '800' => '899', '9000' => '9499', '95000' => '98999', '990000' => '999999'] ],
	93    => ['India' =>  ['00' => '09', '100' => '499', '5000' => '7999', '80000' => '94999', '950000' => '999999'] ],
	94    => ['Netherlands' =>  ['000' => '599', '6000' => '8999', '90000' => '99999'] ],
	950   => ['Argentina' =>  ['00' => '49', '500' => '899', '9000' => '9899', '99000' => '99999'] ],
	951   => ['Finland' =>  ['0' => '1', '20' => '54', '550' => '889', '8900' => '9499', '95000' => '99999'] ],
	952   => ['Finland' =>  ['00' => '19', '200' => '499', '5000' => '5999', '60' => '65', '6600' => '6699', '67000' => '69999', '7000' => '7999', '80' => '94', '9500' => '9899', '99000' => '99999'] ],
	953   => ['Croatia' =>  ['0' => '0', '10' => '14', '150' => '509', '51' => '54', '55000' => '59999', '6000' => '9499', '95000' => '99999'] ],
	954   => ['Bulgaria' =>  ['00' => '28', '2900' => '2999', '300' => '799', '8000' => '8999', '90000' => '92999', '9300' => '9999'] ],
	955   => ['Sri Lanka' =>  ['0000' => '1999', '20' => '44', '4500' => '4999', '50000' => '54999', '550' => '799', '8000' => '9499', '95000' => '99999'] ],
	956   => ['Chile' =>  ['00' => '19', '200' => '699', '7000' => '9999'] ],
	957   => ['Taiwan' =>  ['00' => '02', '0300' => '0499', '05' => '19', '2000' => '2099', '21' => '27', '28000' => '30999', '31' => '43', '440' => '819', '8200' => '9699', '97000' => '99999'] ],
	958   => ['Colombia' =>  ['00' => '56', '57000' => '59999', '600' => '799', '8000' => '9499', '95000' => '99999'] ],
	959   => ['Cuba' =>  ['00' => '19', '200' => '699', '7000' => '8499', '85000' => '99999'] ],
	960   => ['Greece' =>  ['00' => '19', '200' => '659', '6600' => '6899', '690' => '699', '7000' => '8499', '85000' => '92999', '93' => '93', '9400' => '9799', '98000' => '99999'] ],
	961   => ['Slovenia' =>  ['00' => '19', '200' => '599', '6000' => '8999', '90000' => '94999', '' => ''] ],
	962   => ['Hong Kong, China' =>  ['00' => '19', '200' => '699', '7000' => '8499', '85000' => '86999', '8700' => '8999', '900' => '999'] ],
	963   => ['Hungary' =>  ['00' => '19', '200' => '699', '7000' => '8499', '85000' => '89999', '9000' => '9999'] ],
	964   => ['Iran' =>  ['00' => '14', '150' => '249', '2500' => '2999', '300' => '549', '5500' => '8999', '90000' => '96999', '970' => '989', '9900' => '9999'] ],
	965   => ['Israel' =>  ['00' => '19', '200' => '599', '' => '', '7000' => '7999', '' => '', '90000' => '99999'] ],
	966   => ['Ukraine' =>  ['00' => '12', '130' => '139', '14' => '14', '1500' => '1699', '170' => '199', '2000' => '2789', '279' => '289', '2900' => '2999', '300' => '699', '7000' => '8999', '90000' => '90999', '910' => '949', '95000' => '97999', '980' => '999'] ],
	967   => ['Malaysia' =>  ['00' => '00', '0100' => '0999', '10000' => '19999', '' => '', '300' => '499', '5000' => '5999', '60' => '89', '900' => '989', '9900' => '9989', '99900' => '99999'] ],
	968   => ['Mexico' =>  ['01' => '39', '400' => '499', '5000' => '7999', '800' => '899', '9000' => '9999'] ],
	969   => ['Pakistan' =>  ['0' => '1', '20' => '39', '400' => '799', '8000' => '9999'] ],
	970   => ['Mexico' =>  ['01' => '59', '600' => '899', '9000' => '9099', '91000' => '96999', '9700' => '9999'] ],
	971   => ['Philippines' =>  ['000' => '015', '0160' => '0199', '02' => '02', '0300' => '0599', '06' => '09', '10' => '49', '500' => '849', '8500' => '9099', '91000' => '95999', '9600' => '9699', '97' => '98', '9900' => '9999'] ],
	972   => ['Portugal' =>  ['0' => '1', '20' => '54', '550' => '799', '8000' => '9499', '95000' => '99999'] ],
	973   => ['Romania' =>  ['0' => '0', '100' => '169', '1700' => '1999', '20' => '54', '550' => '759', '7600' => '8499', '85000' => '88999', '8900' => '9499', '95000' => '99999'] ],
	974   => ['Thailand' =>  ['00' => '19', '200' => '699', '7000' => '8499', '85000' => '89999', '90000' => '94999', '9500' => '9999'] ],
	975   => ['Turkey' =>  ['00000' => '01999', '02' => '24', '250' => '599', '6000' => '9199', '92000' => '98999', '990' => '999'] ],
	976   => ['Caribbean Community' =>  ['0' => '3', '40' => '59', '600' => '799', '8000' => '9499', '95000' => '99999'] ],
	977   => ['Egypt' =>  ['00' => '19', '200' => '499', '5000' => '6999', '700' => '849', '85000' => '89999', '90' => '99'] ],
	978   => ['Nigeria' =>  ['000' => '199', '2000' => '2999', '30000' => '79999', '8000' => '8999', '900' => '999'] ],
	979   => ['Indonesia' =>  ['000' => '099', '1000' => '1499', '15000' => '19999', '20' => '29', '3000' => '3999', '400' => '799', '8000' => '9499', '95000' => '99999'] ],
	980   => ['Venezuela' =>  ['00' => '19', '200' => '599', '6000' => '9999'] ],
	981   => ['Singapore' =>  ['00' => '11', '1200' => '1999', '200' => '289', '2900' => '9999'] ],
	982   => ['South Pacific' =>  ['00' => '09', '100' => '699', '70' => '89', '9000' => '9799', '98000' => '99999'] ],
	983   => ['Malaysia' =>  ['00' => '01', '020' => '199', '2000' => '3999', '40000' => '44999', '45' => '49', '50' => '79', '800' => '899', '9000' => '9899', '99000' => '99999'] ],
	984   => ['Bangladesh' =>  ['00' => '39', '400' => '799', '8000' => '8999', '90000' => '99999'] ],
	985   => ['Belarus' =>  ['00' => '39', '400' => '599', '6000' => '8999', '90000' => '99999'] ],
	986   => ['Taiwan' =>  ['00' => '11', '120' => '559', '5600' => '7999', '80000' => '99999'] ],
	987   => ['Argentina' =>  ['00' => '09', '1000' => '1999', '20000' => '29999', '30' => '49', '500' => '899', '9000' => '9499', '95000' => '99999'] ],
	988   => ['Hong Kong, China' =>  ['00' => '14', '15000' => '16999', '17000' => '19999', '200' => '799', '8000' => '9699', '97000' => '99999'] ],
	989   => ['Portugal' =>  ['0' => '1', '20' => '54', '550' => '799', '8000' => '9499', '95000' => '99999'] ],
	9927  => ['Qatar' =>  ['00' => '09', '100' => '399', '4000' => '4999', '' => ''] ],
	9928  => ['Albania' =>  ['00' => '09', '100' => '399', '4000' => '4999', '' => ''] ],
	9929  => ['Guatemala' =>  ['0' => '3', '40' => '54', '550' => '799', '8000' => '9999'] ],
	9930  => ['Costa Rica' =>  ['00' => '49', '500' => '939', '9400' => '9999'] ],
	9931  => ['Algeria' =>  ['00' => '29', '300' => '899', '9000' => '9999'] ],
	9932  => ['Lao People\'s Democratic Republic' =>  ['00' => '39', '400' => '849', '8500' => '9999'] ],
	9933  => ['Syria' =>  ['0' => '0', '10' => '39', '400' => '899', '9000' => '9999'] ],
	9934  => ['Latvia' =>  ['0' => '0', '10' => '49', '500' => '799', '8000' => '9999'] ],
	9935  => ['Iceland' =>  ['0' => '0', '10' => '39', '400' => '899', '9000' => '9999'] ],
	9936  => ['Afghanistan' =>  ['0' => '1', '20' => '39', '400' => '799', '8000' => '9999'] ],
	9937  => ['Nepal' =>  ['0' => '2', '30' => '49', '500' => '799', '8000' => '9999'] ],
	9938  => ['Tunisia' =>  ['00' => '79', '800' => '949', '9500' => '9999'] ],
	9939  => ['Armenia' =>  ['0' => '4', '50' => '79', '800' => '899', '9000' => '9999'] ],
	9940  => ['Montenegro' =>  ['0' => '1', '20' => '49', '500' => '899', '9000' => '9999'] ],
	9941  => ['Georgia' =>  ['0' => '0', '10' => '39', '400' => '899', '9000' => '9999'] ],
	9942  => ['Ecuador' =>  ['00' => '89', '900' => '984', '9850' => '9999'] ],
	9943  => ['Uzbekistan' =>  ['00' => '29', '300' => '399', '4000' => '9999'] ],
	9944  => ['Turkey' =>  ['0000' => '0999', '100' => '499', '5000' => '5999', '60' => '69', '700' => '799', '80' => '89', '900' => '999'] ],
	9945  => ['Dominican Republic' =>  ['00' => '00', '010' => '079', '08' => '39', '400' => '569', '57' => '57', '580' => '849', '8500' => '9999'] ],
	9946  => ['Korea, P.D.R.' =>  ['0' => '1', '20' => '39', '400' => '899', '9000' => '9999'] ],
	9947  => ['Algeria' =>  ['0' => '1', '20' => '79', '800' => '999'] ],
	9948  => ['United Arab Emirates' =>  ['00' => '39', '400' => '849', '8500' => '9999'] ],
	9949  => ['Estonia' =>  ['0' => '0', '10' => '39', '400' => '899', '9000' => '9999'] ],
	9950  => ['Palestine' =>  ['00' => '29', '300' => '849', '8500' => '9999'] ],
	9951  => ['Kosova' =>  ['00' => '39', '400' => '849', '8500' => '9999'] ],
	9952  => ['Azerbaijan' =>  ['0' => '1', '20' => '39', '400' => '799', '8000' => '9999'] ],
	9953  => ['Lebanon' =>  ['0' => '0', '10' => '39', '400' => '599', '60' => '89', '9000' => '9999'] ],
	9954  => ['Morocco' =>  ['0' => '1', '20' => '39', '400' => '799', '8000' => '9999'] ],
	9955  => ['Lithuania' =>  ['00' => '39', '400' => '929', '9300' => '9999'] ],
	9956  => ['Cameroon' =>  ['0' => '0', '10' => '39', '400' => '899', '9000' => '9999'] ],
	9957  => ['Jordan' =>  ['00' => '39', '400' => '699', '70' => '84', '8500' => '8799', '88' => '99'] ],
	9958  => ['Bosnia and Herzegovina' =>  ['00' => '03', '040' => '089', '0900' => '0999', '10' => '18', '1900' => '1999', '20' => '49', '500' => '899', '9000' => '9999'] ],
	9959  => ['Libya' =>  ['0' => '1', '20' => '79', '800' => '949', '9500' => '9699', '970' => '979', '98' => '99'] ],
	9960  => ['Saudi Arabia' =>  ['00' => '59', '600' => '899', '9000' => '9999'] ],
	9961  => ['Algeria' =>  ['0' => '2', '30' => '69', '700' => '949', '9500' => '9999'] ],
	9962  => ['Panama' =>  ['00' => '54', '5500' => '5599', '56' => '59', '600' => '849', '8500' => '9999'] ],
	9963  => ['Cyprus' =>  ['0' => '1', '20' => '24', '250' => '279', '2800' => '2999', '30' => '54', '550' => '734', '7350' => '7499', '7500' => '9999'] ],
	9964  => ['Ghana' =>  ['0' => '6', '70' => '94', '950' => '999'] ],
	9965  => ['Kazakhstan' =>  ['00' => '39', '400' => '899', '9000' => '9999'] ],
	9966  => ['Kenya' =>  ['000' => '149', '1500' => '1999', '20' => '69', '7000' => '7499', '750' => '959', '9600' => '9999'] ],
	9967  => ['Kyrgyz Republic' =>  ['00' => '39', '400' => '899', '9000' => '9999'] ],
	9968  => ['Costa Rica' =>  ['00' => '49', '500' => '939', '9400' => '9999'] ],
	9970  => ['Uganda' =>  ['00' => '39', '400' => '899', '9000' => '9999'] ],
	9971  => ['Singapore' =>  ['0' => '5', '60' => '89', '900' => '989', '9900' => '9999'] ],
	9972  => ['Peru' =>  ['00' => '09', '1' => '1', '200' => '249', '2500' => '2999', '30' => '59', '600' => '899', '9000' => '9999'] ],
	9973  => ['Tunisia' =>  ['00' => '05', '060' => '089', '0900' => '0999', '10' => '69', '700' => '969', '9700' => '9999'] ],
	9974  => ['Uruguay' =>  ['0' => '2', '30' => '54', '550' => '749', '7500' => '9499', '95' => '99'] ],
	9975  => ['Moldova' =>  ['0' => '0', '100' => '399', '4000' => '4499', '45' => '89', '900' => '949', '9500' => '9999'] ],
	9976  => ['Tanzania' =>  ['0' => '5', '60' => '89', '900' => '989', '9900' => '9999'] ],
	9977  => ['Costa Rica' =>  ['00' => '89', '900' => '989', '9900' => '9999'] ],
	9978  => ['Ecuador' =>  ['00' => '29', '300' => '399', '40' => '94', '950' => '989', '9900' => '9999'] ],
	9979  => ['Iceland' =>  ['0' => '4', '50' => '64', '650' => '659', '66' => '75', '760' => '899', '9000' => '9999'] ],
	9980  => ['Papua New Guinea' =>  ['0' => '3', '40' => '89', '900' => '989', '9900' => '9999'] ],
	9981  => ['Morocco' =>  ['00' => '09', '100' => '159', '1600' => '1999', '20' => '79', '800' => '949', '9500' => '9999'] ],
	9982  => ['Zambia' =>  ['00' => '79', '800' => '989', '9900' => '9999'] ],
	9983  => ['Gambia' =>  ['' => '', '80' => '94', '950' => '989', '9900' => '9999'] ],
	9984  => ['Latvia' =>  ['00' => '49', '500' => '899', '9000' => '9999'] ],
	9985  => ['Estonia' =>  ['0' => '4', '50' => '79', '800' => '899', '9000' => '9999'] ],
	9986  => ['Lithuania' =>  ['00' => '39', '400' => '899', '9000' => '9399', '940' => '969', '97' => '99'] ],
	9987  => ['Tanzania' =>  ['00' => '39', '400' => '879', '8800' => '9999'] ],
	9988  => ['Ghana' =>  ['0' => '2', '30' => '54', '550' => '749', '7500' => '9999'] ],
	9989  => ['Macedonia' =>  ['0' => '0', '100' => '199', '2000' => '2999', '30' => '59', '600' => '949', '9500' => '9999'] ],
	99901 => ['Bahrain' =>  ['00' => '49', '500' => '799', '80' => '99'] ],
	99902 => ['Gabon' =>  [ ] ],
	99903 => ['Mauritius' =>  ['0' => '1', '20' => '89', '900' => '999'] ],
	99904 => ['Netherlands Antilles and Aruba' =>  ['0' => '5', '60' => '89', '900' => '999'] ],
	99905 => ['Bolivia' =>  ['0' => '3', '40' => '79', '800' => '999'] ],
	99906 => ['Kuwait' =>  ['0' => '2', '30' => '59', '600' => '699', '70' => '89', '90' => '94', '950' => '999'] ],
	99908 => ['Malawi' =>  ['0' => '0', '10' => '89', '900' => '999'] ],
	99909 => ['Malta' =>  ['0' => '3', '40' => '94', '950' => '999'] ],
	99910 => ['Sierra Leone' =>  ['0' => '2', '30' => '89', '900' => '999'] ],
	99911 => ['Lesotho' =>  ['00' => '59', '600' => '999'] ],
	99912 => ['Botswana' =>  ['0' => '3', '400' => '599', '60' => '89', '900' => '999'] ],
	99913 => ['Andorra' =>  ['0' => '2', '30' => '35', '' => '', '600' => '604', ] ],
	99914 => ['Suriname' =>  ['0' => '4', '50' => '89', '900' => '999'] ],
	99915 => ['Maldives' =>  ['0' => '4', '50' => '79', '800' => '999'] ],
	99916 => ['Namibia' =>  ['0' => '2', '30' => '69', '700' => '999'] ],
	99917 => ['Brunei Darussalam' =>  ['0' => '2', '30' => '89', '900' => '999'] ],
	99918 => ['Faroe Islands' =>  ['0' => '3', '40' => '79', '800' => '999'] ],
	99919 => ['Benin' =>  ['0' => '2', '300' => '399', '40' => '69', '70' => '70', '710' => '849', '850' => '899', '900' => '999'] ],
	99920 => ['Andorra' =>  ['0' => '4', '50' => '89', '900' => '999'] ],
	99921 => ['Qatar' =>  ['0' => '1', '20' => '69', '700' => '799', '8' => '8', '90' => '99'] ],
	99922 => ['Guatemala' =>  ['0' => '3', '40' => '69', '700' => '999'] ],
	99923 => ['El Salvador' =>  ['0' => '1', '20' => '79', '800' => '999'] ],
	99924 => ['Nicaragua' =>  ['0' => '1', '20' => '79', '800' => '999'] ],
	99925 => ['Paraguay' =>  ['0' => '3', '40' => '79', '800' => '999'] ],
	99926 => ['Honduras' =>  ['0' => '0', '10' => '59', '600' => '899', '90' => '99'] ],
	99927 => ['Albania' =>  ['0' => '2', '30' => '59', '600' => '999'] ],
	99928 => ['Georgia' =>  ['0' => '0', '10' => '79', '800' => '999'] ],
	99929 => ['Mongolia' =>  ['0' => '4', '50' => '79', '800' => '999'] ],
	99930 => ['Armenia' =>  ['0' => '4', '50' => '79', '800' => '999'] ],
	99931 => ['Seychelles' =>  ['0' => '4', '50' => '79', '800' => '999'] ],
	99932 => ['Malta' =>  ['0' => '0', '10' => '59', '600' => '699', '7' => '7', '80' => '99'] ],
	99933 => ['Nepal' =>  ['0' => '2', '30' => '59', '600' => '999'] ],
	99934 => ['Dominican Republic' =>  ['0' => '1', '20' => '79', '800' => '999'] ],
	99935 => ['Haiti' =>  ['0' => '2', '30' => '59', '600' => '699', '7' => '8', '90' => '99'] ],
	99936 => ['Bhutan' =>  ['0' => '0', '10' => '59', '600' => '999'] ],
	99937 => ['Macau' =>  ['0' => '1', '20' => '59', '600' => '999'] ],
	99938 => ['Srpska, Republic of' =>  ['0' => '1', '20' => '59', '600' => '899', '90' => '99'] ],
	99939 => ['Guatemala' =>  ['0' => '5', '60' => '89', '900' => '999'] ],
	99940 => ['Georgia' =>  ['0' => '0', '10' => '69', '700' => '999'] ],
	99941 => ['Armenia' =>  ['0' => '2', '30' => '79', '800' => '999'] ],
	99942 => ['Sudan' =>  ['0' => '4', '50' => '79', '800' => '999'] ],
	99943 => ['Albania' =>  ['0' => '2', '30' => '59', '600' => '999'] ],
	99944 => ['Ethiopia' =>  ['0' => '4', '50' => '79', '800' => '999'] ],
	99945 => ['Namibia' =>  ['0' => '5', '60' => '89', '900' => '999'] ],
	99946 => ['Nepal' =>  ['0' => '2', '30' => '59', '600' => '999'] ],
	99947 => ['Tajikistan' =>  ['0' => '2', '30' => '69', '700' => '999'] ],
	99948 => ['Eritrea' =>  ['0' => '4', '50' => '79', '800' => '999'] ],
	99949 => ['Mauritius' =>  ['0' => '1', '20' => '89', '900' => '999'] ],
	99950 => ['Cambodia' =>  ['0' => '4', '50' => '79', '800' => '999'] ],
	99951 => ['Congo, The Democratic Republic' =>  ['' => ''] ],
	99952 => ['Mali' =>  ['0' => '4', '50' => '79', '800' => '999'] ],
	99953 => ['Paraguay' =>  ['0' => '2', '30' => '79', '800' => '939', '94' => '99'] ],
	99954 => ['Bolivia' =>  ['0' => '2', '30' => '69', '700' => '879', '88' => '99'] ],
	99955 => ['Srpska, Republic of' =>  ['0' => '1', '20' => '59', '600' => '799', '80' => '89', '90' => '99'] ],
	99956 => ['Albania' =>  ['00' => '59', '600' => '859', '86' => '99'] ],
	99957 => ['Malta' =>  ['0' => '1', '20' => '79', '800' => '999'] ],
	99958 => ['Bahrain' =>  ['0' => '4', '50' => '94', '950' => '999'] ],
	99959 => ['Luxembourg' =>  ['0' => '2', '30' => '59', '600' => '999'] ],
	99960 => ['Malawi' =>  ['0' => '0', '10' => '94', '950' => '999'] ],
	99961 => ['El Salvador' =>  ['0' => '3', '40' => '89', '900' => '999'] ],
	99962 => ['Mongolia' =>  ['0' => '4', '50' => '79', '800' => '999'] ],
	99963 => ['Cambodia' =>  ['00' => '49', '500' => '999'] ],
	99964 => ['Nicaragua' =>  ['0' => '1', '20' => '79', '800' => '999'] ],
	99965 => ['Macau' =>  ['0' => '3', '40' => '79', '800' => '999'] ],
	99966 => ['Kuwait' =>  ['0' => '2', '30' => '69', '700' => '799', ] ],
	99967 => ['Paraguay' =>  ['0' => '1', '20' => '59', '600' => '899', ] ],
	99968 => ['Botswana' =>  ['0' => '3', '400' => '599', '60' => '89', '900' => '999'] ],
	99969 => ['Oman' =>  ['0' => '4', '50' => '79', '800' => '999'] ],
	99970 => ['Haiti' =>  ['0' => '4', '50' => '89', '900' => '999'] ],
	);
	}

sub _get_data {
# eventually fetch this from the internet
# http://www.isbn-international.org/agency?rmxml=1

	my $file = do {
		no warnings 'uninitialized';
		   if( -e $ENV{ISBN_RANGE_MESSAGE} ) { $ENV{ISBN_RANGE_MESSAGE} }
		else {
			my $default = catfile( dirname( __FILE__ ), 'RangeMessage.xml' );
			}
		};

	my $hash = _parse_range_message( $file );

	if( defined $hash ) { return %$hash   }
	else                { _default_data() }
	}

sub _parse_range_message {
	my( $file ) = @_;

	open my $fh, '<:utf8', $file or do {
		carp "Could not open $file to get ISBN range data [$!]";
		return
		};

	my $data = do { local $/; <$fh> };

	my $ds;

	my( $serial_number ) = $data =~ m|<MessageSerialNumber>(.*?)</MessageSerialNumber>|;
	my( $date )          = $data =~ m|<MessageDate>(.*?)</MessageDate>|;

	$ds->{'_source'} = $file;
	$ds->{'_serial'} = $serial_number;
	$ds->{'_date'}   = $date;

	my( $registration_groups ) = $data =~ m|<RegistrationGroups>(.*?)</RegistrationGroups>|s;

	my @groups = $registration_groups =~ m|<Group>(.*?)</Group>|sg;

	foreach my $group ( @groups ) {
		my( $prefix ) = $group =~ m|<Prefix>(?:97[89]-)?([0-9]+?)</Prefix>|;
		my( $agency ) = $group =~ m|<Agency>(.*?)</Agency>|;
		my @rules =
			map {
				my( $range ) = m|<Range>(.*?)</Range>|;
				my( $length ) = m|<Length>(.*?)</Length>|;
				my( $low, $high ) = split /-/, $range, 2;
				( substr($low, 0, $length), substr($high, 0, $length) );
				}
			grep {
				! m|<Length>0</Length>|
				}
				$group =~ m|<Rule>(.*?)</Rule>|sg;

		$ds->{$prefix} = [ $agency => \@rules ];
		}

	$ds;
	}

%Business::ISBN::country_data = _get_data();

# I cheat a little bit here. I know that that the max length is
# 5, and that I know that those will start with 999xx. :)
# however, if the data changes I should think about this again.
$Business::ISBN::MAX_COUNTRY_CODE_LENGTH = length(
	( sort { $a <=> $b } grep { ! /\A_/ } keys %Business::ISBN::country_data )[-1]
	);

package Business::ISBN;

sub isbn_group_code_string_from_number {
	return if $_[0] =~ /\A_/;
	return $Business::ISBN::country_data{ $_[0] }[0] || '';
	}

sub isbn_publisher_ranges_from_group_number {
	return if $_[0] =~ /\A_/;
	return $Business::ISBN::country_data{ $_[0] }[1] || [];
	}

sub isbn_data_source {
	return $Business::ISBN::country_data{ '_source' } || __FILE__
	}
1;
