# = Class: seafile::user
#
# Create seafile user
#
class seafile::user(
)
{

  ### Group and user creation
  group { 'seafile':
    ensure => 'present',
    gid    => '1007',
    system => false,
  }

  user { 'seafile':
    ensure           => 'present',
    require          => Group['seafile'],
    comment          => 'Seafile User',
    uid              => '1007',
    gid              => 'seafile',
    password         => '$6$ZKd1b/yG$b1uVbtKC8p34XZHcjFMR0RLiFL3xlg.5VYkTOaSRqcIpO.tBRwYpGtO85D0qaZLEzfs9oFXqYcy2/dbkeuVkx0',
    password_max_age => '99999',
    password_min_age => '0',
    home             => '/home/seafile',
    managehome       => true,
    shell            => '/bin/bash',
  }

}
