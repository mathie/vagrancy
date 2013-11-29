class puppet {
  include puppet::install

  anchor { 'puppet::begin': } ->
    Class['puppet::install'] ->
    anchor { 'puppet::end': }
}
