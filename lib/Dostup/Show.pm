package Dostup::Show;
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






sub show
{ 
  my $self=shift;
  my $id=$self->param('id');
  my %info=&get_info($id);
  $self->render(info=>\%info)
}



sub get_info
{
 my $id=shift;
 my %info;
 my $query="select Address, comments from info where site_code=$id";  
 my $sth=$dbh->prepare($query); $sth->execute();
 my ($Address, $comments)=$sth->fetchrow_array;
 $info{Address}=$Address;
 $info{comments}=$comments;
 return %info;
}





1;
