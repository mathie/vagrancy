class ruby {
  include ruby::install

  anchor { 'ruby::begin': } ->
    Class['ruby::install'] ->
    anchor { 'ruby::end': }
}
