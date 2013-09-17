package Dostup::Search;
use Mojo::Base 'Mojolicious::Controller';
use DBI;
our $dbh;
our $db_host='85.21.12.22';
&db_connect;


#Подключаемся к БД

sub db_connect
{
  $dbh=DBI->connect("DBI:mysql:database=dostup;host=$db_host;port=3306", 'vrag', 'a3797953A') or die "\nCan't connect to mysql";
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
    my @tp=&search_tp($address);
    $self->render(tp=>\@tp);  
  }
  else
  {
   $self->render(message=>'');
  }
}



sub search_tp
{
 my $address=shift;
    $address='%'.$address.'%';
 my @tp;
 my $query="select site_name from info where upper(Address) like upper('$address')";   #Изменить на site_code
 my $sth=$dbh->prepare($query); $sth->execute();
 while (my $u=($sth->fetchrow_array))
 {
  push @tp, $u;
 }
 return @tp;
}


1;
