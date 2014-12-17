# init file for Seafile Installation
class seafile (
  $is_pro   = false,
  $base_dir = '/opt/seafile',
  $version  = '4.0.0',
)
{

  ### Declaring calculated variables
  anchor  { 'seafile::start': }->
  class   { 'seafile::user': }->
  class   { 'seafile::base': }->
  anchor  { 'seafile::end': }
}
