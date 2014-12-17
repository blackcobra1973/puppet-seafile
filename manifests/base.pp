# = Class: seafile::base
#
# - Create Seafile directories with all files needed
# - Install required packages
#
class seafile::base(
)
{

## removed: python-imaging -> python-pillow  in CentOS 7

  $seafile_packages = [ 'MySQL-python',
                        'python-simplejson',
                        'python-setuptools',
                        'python-pillow',
                      ]

  $pro_extra_packages =   [ 'poppler-utils',
                            'libreoffice',
                            'libreoffice-headless',
                            'libreoffice-pyuno',
                          ]

  ### Default Packages to install
  package { $seafile_packages:
    ensure => installed,
  }

  if $seafile::is_pro
  {
    package { $pro_extra_packages:
      ensure => installed,
    }
  }

  ### Needed directory's
  file { $seafile::base_dir:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file { "${seafile::base_dir}/installed":
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => File[$seafile::base_dir],
  }

  ### Put install source files
  if $seafile::is_pro
  {
    ### License file
    file { "${seafile::base_dir}/seafile-license.txt":
      ensure  => file,
      source  => 'puppet:///modules/seafile/seafile-license.txt',
      owner   => 'root',
      group   => 'root',
      mode    => '0444',
      require => File[$seafile::base_dir],
    }

    ### Install File
    file { 'seafile_source':
      ensure  => file,
      path    => "${seafile::base_dir}/installed/seafile-pro-server_${seafile::version}_x86-64.tar.gz",
      source  => "puppet:///modules/seafile/seafile-pro-server_${seafile::version}_x86-64.tar.gz",
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      require => File["${seafile::base_dir}/installed"],
    }
  }
  else
  {
    file { 'seafile_source':
      ensure  => file,
      path    => "${seafile::base_dir}/installed/seafile-server_${seafile::version}_x86-64.tar.gz",
      source  => "https://bitbucket.org/haiwen/seafile/downloads/seafile-server_${seafile::version}_x86-64.tar.gz",
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      require => File["${seafile::base_dir}/installed"],
    }

  }

}
