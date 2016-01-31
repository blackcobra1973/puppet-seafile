# = Class: seafile::unpack
#
# - Unpack Seafile files from tar.gz
# - Create the symbolic link
#
class seafile::unpack(
)
{

  ### Unpack the application files
  if $seafile::is_pro
  {
    ### Unpack the seafile server
    exec { 'untar-seafile':
      command     => "/bin/tar xzf ${seafile::base_dir}/installed/seafile-pro-server_${seafile::version}_x86-64.tar.gz",
      cwd         => $seafile::base_dir,
      creates     => "${seafile::base_dir}/seafile-pro-server-${seafile::version}",
      subscribe   => File['seafile_source'],
      refreshonly => true,
      user        => 'root',
    }

    ### Set file ownership
#    exec { 'set_correct_user':
#      command     => "/bin/chown -R root:root ${seafile::base_dir}/seafile-pro-server-${seafile::version}",
#      require     => Exec['untar-seafile'],
#      refreshonly => true,
#      user        => 'root',
#    }

    ### Symlink the directory
#    file { "${seafile::base_dir}/seafile-pro-server-latest":
#      ensure  => "${seafile::base_dir}/seafile-pro-server-${seafile::version}",
#      require => Exec['untar-seafile'];
#    }
  }
  else
  {
    ### Unpack the seafile server
    exec { 'untar-seafile':
      command     => "/bin/tar xzf ${seafile::base_dir}/installed/seafile-server_${seafile::version}_x86-64.tar.gz",
      cwd         => $seafile::base_dir,
      creates     => "${seafile::base_dir}/seafile-server-${seafile::version}",
      subscribe   => File['seafile_source'],
      refreshonly => true,
      user        => 'root',
    }

    ### Set file ownership
#    exec { 'set_correct_user':
#      command     => "/bin/chown -R root:root ${seafile::base_dir}/seafile-server-${seafile::version}",
#      require     => Exec['untar-seafile'],
#      refreshonly => true,
#      user        => 'root',
#    }

    ### Symlink the directory
#    file { "${seafile::base_dir}/seafile-server-latest":
#      ensure  => "${seafile::base_dir}/seafile-server-${seafile::version}",
#      require => Exec['untar-seafile'];
#    }
  }

}
