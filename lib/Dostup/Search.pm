package Dostup::Search;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub welcome {
  my $self = shift;

  # Render template "search/example.html.ep" with message
  $self->render(
    url_for => 'Welcome to the Mojolicious real-time web framework!',
    message2=>'Eto klassnii framework');
}

1;
