# = Class: seafile::mysql
#
# Install and configure MySQL/MariaDB
#
class seafile::mysql
{
  if $seafile::use_mysql and ( !$seafile::use_global_mysql )
  {
  #  include mysql::server

    $override_options = hiera_hash('mysql::override_options')

    if $override_options {
      class { 'mysql::server':
        override_options  => $override_options,
      }
    } else {
      # we don't use default options, so error if nothing is found
      fail('No hash found to override settings in profile::mysql.')
    }

    ###  Create Databases + users + grants
    $dbs = hiera_hash('mysql::databases')
    $users = hiera_hash('mysql::users')
    $grants = hiera_hash('mysql::grants')

    create_resources('mysql_database', $dbs)
    create_resources('mysql_user', $users)
    create_resources('mysql_grant', $grants)

  }
}
