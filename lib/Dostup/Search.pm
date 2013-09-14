package Dostup::Search;
use Mojo::Base 'Mojolicious::Controller';
#use DBI;
#Подключаемся к БД



# This action will render a template
#sub default {
#  my $self = shift;
  # Render template "search/example.html.ep" with message
#  $self->render(
#    url_for => '/',
#    msg=>'hello world');
#}

sub search
{ 
  my $self=shift;
  my $txt=$self->param('q');
  $self->render(message=>$txt);  
}


1;
