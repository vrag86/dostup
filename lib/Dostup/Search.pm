package Dostup::Search;
use Mojo::Base 'Mojolicious::Controller';
use DBI;
our $dbh;
&db_connect;


#Подключаемся к БД

sub db_connect
{
  $dbh=DBI->connect("DBI:mysql:database=Check;host=$db_host;port=3306", 'vrag', 'a3797953A') or die "\nCan't connect to mysql";
#Включаем UTF8  
  $dbh->{'mysql_enable_utf8'} = 1;
  $dbh->do('set names utf8');
  return 1;
}






sub search
{ 
  my $self=shift;
  my $address=$self->param('address');
  if (defined($address))
  {
    $self->render(message=>$address);  
  }
  else
  {
   $self->render(message=>'');
  }
}


1;
