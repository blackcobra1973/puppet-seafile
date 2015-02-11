# = Class: seafile::config
#
# Install configuration files
#
class seafile::config
{

  if $seafile::use_nginx
  {
    require nginx
  }

  if $seafile::use_nginx or $seafile::use_apache
  {
    file { 'ccnet.conf.erb':
      ensure  =>  file,
      path    =>  "${seafile::base_dir}/ccnet/ccnet.conf",
      content =>  template('seafile/ccnet.conf.erb'),
      replace =>  false,
      mode    =>  '0644',
      owner   =>  'root',
      group   =>  'root',
    }
  }

  if $seafile::use_nginx or $seafile::use_memcached or $seafile::use_apache
  {
    file { 'seahub_settings.py':
      ensure  =>  file,
      path    =>  "${seafile::base_dir}/seahub_settings.py",
      content =>  template('seafile/seahub_settings.py.erb'),
      replace =>  false,
      mode    =>  '0644',
      owner   =>  'root',
      group   =>  'root',
    }

  }
}
