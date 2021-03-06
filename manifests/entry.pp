# Create an entry in the pound config
define pound::entry ($listen_ip,
    $listen_port,
    $listen_protocol,
    $head_require,
    $backend_ip,
    $backend_port,
    $certs = ["/etc/ssl/certs/server.pem"]) {


    concat::fragment {
        "pound_entry-${name}" :
            target => '/etc/pound/pound.cfg',
            content => template('pound/entry.cfg.erb'),
            order => 30,
            notify  => Service['pound'],
    }
}
