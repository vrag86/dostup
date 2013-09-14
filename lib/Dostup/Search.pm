package Dostup::Search;
use Mojo::Base 'Mojolicious::Controller';
use DBI;
#Подключаемся к БД



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
