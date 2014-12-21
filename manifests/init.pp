# init file for Seafile Installation
class seafile (
  $is_pro         = false,
  $use_mysql      = false,
  $mysql_user     = seafile,
  $mysql_pass     = undef,
  $mysql_host     = '127.0.0.1',
  $use_nginx      = false,
  $use_memcached  = false,
  $base_dir       = '/opt/seafile',
  $version        = '4.0.0',
  $secret_key     = '',
  $id             = '',
)
{

  ### Declaring calculated variables
  anchor  { 'seafile::start': }->
  class   { 'seafile::user': }->
  class   { 'seafile::mysql': }->
  class   { 'seafile::memcached': }->
  class   { 'seafile::base': }->
  class   { 'seafile::unpack': }->
  class   { 'seafile::service': }->
  class   { 'seafile::config': }->
  anchor  { 'seafile::end': }
}
