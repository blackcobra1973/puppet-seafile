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
      command     => "tar xzf ${seafile::base_dir}/installed/seafile-pro-server_${seafile::version}_x86-64.tar.gz",
      cwd         => $seafile::base_dir,
      creates     => "${seafile::base_dir}/seafile-pro-server_${seafile::version}",
      subscribe   => File['seafile_source'],
      refreshonly => true,
    }

    ### Symlink the directory
    file { "${seafile::base_dir}/seafile-pro-server_latest":
      ensure  => "${seafile::base_dir}/seafile-pro-server_${seafile::version}",
      require => Exec['untar-seafile'];
    }
  }
  else
  {
    ### Unpack the seafile server
    exec { 'untar-seafile':
      command     => "tar xzf ${seafile::base_dir}/installed/seafile-server_${seafile::version}_x86-64.tar.gz",
      cwd         => $seafile::base_dir,
      creates     => "${seafile::base_dir}/seafile-server_${seafile::version}",
      subscribe   => File['seafile_source'],
      refreshonly => true,
    }

    ### Symlink the directory
    file { "${seafile::base_dir}/seafile-server_latest":
      ensure  => "${seafile::base_dir}/seafile-server_${seafile::version}",
      require => Exec['untar-seafile'];
    }
  }

}
