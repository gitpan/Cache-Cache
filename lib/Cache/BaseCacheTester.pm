######################################################################
# $Id: BaseCacheTester.pm,v 1.3 2001/04/08 22:48:37 dclinton Exp $
# Copyright (C) 2001 DeWitt Clinton  All Rights Reserved
#
# Software distributed under the License is distributed on an "AS
# IS" basis, WITHOUT WARRANTY OF ANY KIND, either expressed or
# implied. See the License for the specific language governing
# rights and limitations under the License.
######################################################################


package Cache::BaseCacheTester;


use strict;
use Carp;


##
# Constructor
##


sub new
{
  my ( $proto, $base_test_count ) = @_;
  my $class = ref( $proto ) || $proto;
  my $self  = {};
  bless ( $self, $class );

  $base_test_count = defined $base_test_count ? $base_test_count : 0 ;

  $self->_set_test_count( $base_test_count );

  return $self;
}


##
# Public instance methods
##


sub ok
{
  my ( $self ) = @_;

  my $test_count = $self->_get_test_count( );

  print "ok $test_count\n";

  $self->_increment_test_count( );
}


sub not_ok
{
  my ( $self, $message ) = @_;

  my $test_count = $self->_get_test_count( );

  print "not ok $test_count # failed '$message'\n";

  $self->_increment_test_count( );
}


sub skip
{
  my ( $self, $message ) = @_;

  my $test_count = $self->_get_test_count( );

  print "ok $test_count # skipped $message \n";

  $self->_increment_test_count( );
}


##
# Instance properties
##


sub _set_test_count
{
  my ( $self, $test_count ) = @_;

  $self->{_Test_Count} = $test_count;
}


sub _get_test_count
{
  my ( $self ) = @_;

  return $self->{_Test_Count};
}


sub _increment_test_count
{
  my ( $self ) = @_;

  $self->{_Test_Count}++;
}


1;


__END__


=pod

=head1 NAME

Cache::BaseCacheTester -- abstract cache tester base class

=head1 DESCRIPTION

BaseCacheTester provides functionality common to all instances of a
class that will test cache implementations.

=head1 SYNOPSIS

BaseCacheTester provides functionality common to all instances of a
class that will test cache implementations.

  package Cache::MyCacheTester;

  use vars qw( @ISA );
  use Cache::BaseCacheTester;

  @ISA = qw( Cache::BaseCacheTester );

=head1 METHODS

=over 4

=item B<new( $base_test_count )>

Construct a new BaseCacheTester and initialize the test count to
'base_test_count'

=over 4

=item $base_test_count

The initial test count

=back

=item B<ok( )>

Print a message to stdout in the form "ok $test_count" and
incremements the test count.

=item B<not_ok( $message )>

Print a message to stdout in the form "not ok $test_count # $message "
and incremements the test count.

=over 4

=item $message

The reason the test failed

=back

=item B<skip( $message )>

Print a message to stdout in the form "ok $test_count # skipped $message "
and incremements the test count.

=over 4

=item $message

The reason the test was skipped

=back

=back

=head1 SEE ALSO

Cache::CacheTester, Cache::SizeAwareCacheTester

=head1 AUTHOR

Original author: DeWitt Clinton <dewitt@unto.net>

Last author:     $Author: dclinton $

Copyright (C) 2001 DeWitt Clinton

=cut


