use strict;
use warnings;
use Irssi;

# Registra el script con irssi
#Irssi::script_register('mi_bot', '1.0', 'Bot simple de prueba');

# Función que se llama cuando alguien habla en el canal
sub response {
    my ($server, $message, $nick, $address, $channel) = @_;
    if ($message =~ /^!adios$/i) {
        # Envía un mensaje de respuesta al canal donde se envió el comando
        $server->command("msg $channel Hasta la proxima, $nick!");
    }
    if ($message =~ /^!bye$/i) {
        # Envía un mensaje de respuesta al canal donde se envió el comando
        $server->command("msg $channel Reproduciré bye bye bye, mientras $nick se marcha moviendo el esqueleto");
    }
    if ($message =~ /^!au revoir$/i or $message =~ /^!Mon dieu$/i) {
        # Envía un mensaje de respuesta al canal donde se envió el comando
        $server->command("kick $channel $nick Franceses los justos!");
        $server->command("msg $channel Franceses los justos!");
    }
}

# Enlaza el evento de recibir un mensaje público con la función respuesta
Irssi::signal_add('message public', 'response');

