# = Class: seafile::service
#
# Create seafile Services
#
class seafile::service
{
  file { 'seafile.service':
    ensure  => file,
    path    => '/etc/systemd/system/seafile.service',
    content => template('seafile/seafile.service.erb'),
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
  }

  file { 'seahub.service':
    ensure  => file,
    path    => '/etc/systemd/system/seahub.service',
    content => template('seafile/seahub.service.erb'),
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
  }
}
