# = Class: seafile::memcached
#
# Install and configure memcached
#
class seafile::seamemcached
{
  if $seafile::use_memcached
  {

    package { 'python-memcached':
      ensure => installed,
    }

    class { 'memcached':
      max_memory  => 128,
      listen_ip   => '127.0.0.1',
      tcp_port    => 11211,
      udp_port    => 11211,
      install_dev => true,
    }
  }
}
