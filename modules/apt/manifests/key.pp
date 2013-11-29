define apt::key($keyid) {
  exec {
    "apt-key-${keyid}":
      command => "/usr/bin/apt-key adv --keyserver hkp://keyserver.ubuntu.com:80/ --recv-keys ${keyid}",
      unless  => "/usr/bin/apt-key list |grep ${keyid} >/dev/null 2>&1";
  }
}
