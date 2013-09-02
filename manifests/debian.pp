# = Class: pound::debian
# Special debian class - inherits from pound::base
#
# You should not include this class - please refer to Class["pound"]
#
class pound::debian inherits pound::base {

  file {'/etc/default/pound':
     ensure  => file,
     content => template("pound/defaults.erb"),
     notify  => Service['pound']
  }

  Service['pound'] {
    pattern => '/usr/sbin/pound',
    restart => '/etc/init.d/pound reload',
  }

  File['pound-default'] -> Service['pound']
}
