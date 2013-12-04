define docker::image(
  $repository = $name,
  $user       = undef,
  $tag        = undef
) {
  include docker

  $full_repository = $user ? {
    undef   => $repository,
    default => "${user}/${repository}",
  }

  $command = $tag ? {
    undef   => "/usr/bin/docker pull ${full_repository}",
    default => "/usr/bin/docker pull -t ${tag} ${full_repository}",
  }

  $unless = $tag ? {
    undef   => "/usr/bin/docker images | /bin/grep '^${full_repository}\\b'",
    default => "/usr/bin/docker images | /bin/grep -E '^${full_repository}\\s+${tag}\\b'",
  }

  exec {
    "docker-install-image-${name}":
      command => $command,
      unless  => $unless,
      timeout => 0,
      require => Class['docker'];
  }
}
