# init file for Seafile Installation
#
# NOTE:
#       Set variable use_global_mysql to true when you
#       already have a module who initializes MySQL.
#
class seafile (
  $is_pro           = false,
  $use_mysql        = false,
  $use_global_mysql = false,
  $mysql_user       = seafile,
  $mysql_pass       = undef,
  $mysql_host       = '127.0.0.1',
  $use_nginx        = false,
  $use_memcached    = false,
  $base_dir         = '/opt/seafile',
  $version          = '4.0.0',
  $secret_key       = '',
  $id               = '',
)
{

  ### Declaring calculated variables
  anchor  { 'seafile::start': }->
  class   { 'seafile::user': }->
  class   { 'seafile::mysql': }->
  class   { 'seafile::seamemcached': }->
  class   { 'seafile::base': }->
  class   { 'seafile::unpack': }->
  class   { 'seafile::config': }->
  class   { 'seafile::service': }->
  anchor  { 'seafile::end': }
}
