# init file for Seafile Installation
class seafile (
  $is_pro     = false,
  $use_mysql  = false,
  $base_dir   = '/opt/seafile',
  $version    = '4.0.0',
)
{

  ### Declaring calculated variables
  anchor  { 'seafile::start': }->
  class   { 'seafile::user': }->
  class   { 'seafile::mysql': }->
  class   { 'seafile::base': }->
  class   { 'seafile::unpack': }->
  class   { 'seafile::service': }->
  anchor  { 'seafile::end': }
}
