define apt::repository(
  $url,
  $distribution = $::lsbdistcodename,
  $components   = [ 'main' ],
  $keyid        = undef
) {
  include apt

  $components_str = inline_template('<%= @components.join(" ") %>')

  exec {
    "add-apt-repository-${name}":
      command => "/usr/bin/add-apt-repository 'deb ${url} ${distribution} ${components_str}'",
      unless  => "/bin/grep '^deb ${url} ${distribution}' /etc/apt/sources.list",
      require => Package['software-properties-common'];
  }


  if $keyid {
    apt::key {
      $name:
        keyid => $keyid;
    }

    Apt::Key[$name] -> Exec["add-apt-repository-${name}"]
  }

  anchor { "apt::repository::${name}::begin": } ->
    Exec["add-apt-repository-${name}"] ~>
    Exec['apt-get-update'] ->
    anchor { "apt::repository::${name}::end": }
}
