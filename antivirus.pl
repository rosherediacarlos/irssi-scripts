use strict;
use warnings;
use Irssi;

sub response {
    my ($server, $message, $nick, $address, $channel) = @_;

    if ($message =~ /^!errores$/i) {
        my $channel_info = $server->channel_find($channel);
            if ($channel_info) {
            my @users = $channel_info->nicks();
            my @found_nicks = map { $_->{nick} } 
                                grep { $_->{nick} =~ /error/i } 
                                @users;
            if (@found_nicks) {
                my $nicks_list = join(', ', @found_nicks);
                my $error_count = scalar @found_nicks;
                my $window = Irssi::active_win;  
                $window->command("me ha encontrado $error_count errores: $nicks_list");
            }
        }
    }

    if ($message =~ /^!virus$/i) {
            my $window = Irssi::active_win;  
            $window->command("me está analizando la sala de posibles virus");
            $window->command("me ha encontrado una amenaza. Eliminando...");

	    if ($server->channel_find($channel)) {
            	$server->command("kick $channel $nick Eliminando Amenza!");
		}
    }
}
Irssi::signal_add('message public', 'response');
