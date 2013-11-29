define apt::ppa(
  $user,
  $repo         = 'ppa',
  $distribution = $::lsbdistcodename
) {
  include apt

  exec {
    "add-apt-repository-${name}":
      command => "/usr/bin/add-apt-repository ppa:${user}/${repo}",
      creates => "/etc/apt/sources.list.d/${user}-${repo}-${distribution}.list",
      require => Package['software-properties-common'];
  }

  anchor { "apt::ppa::${name}::begin": } ->
    Exec["add-apt-repository-${name}"] ~>
    Exec['apt-get-update'] ->
    anchor { "apt::ppa::${name}::end": }
}
