# = Class: seafile::config
#
# Install configuration files
#
class seafile::config
{
  if $seafile::use_nginx
  {
    require nginx

    file { 'ccnet.conf.erb':
      ensure  =>  file,
      path    =>  "${seafile::base_dir}/ccnet/ccnet.conf",
      content =>  template('seafile/ccnet.conf.erb'),
      replace =>  false,
      mode    =>  '0644',
      owner   =>  'root',
      group   =>  'root',
      notify  =>  [ Service['seafile'],
                    Service['seahub'],
                  ],
    }
  }

  if $seafile::use_nginx
  {
    file { 'seahub_settings.py':
      ensure  =>  file,
      path    =>  "${seafile::base_dir}/seahub_settings.py",
      content =>  template('seafile/seahub_settings.py.erb'),
      replace =>  false,
      mode    =>  '0644',
      owner   =>  'root',
      group   =>  'root',
      notify  =>  [ Service['seafile'],
                    Service['seahub'],
                  ],
    }

  }
}
