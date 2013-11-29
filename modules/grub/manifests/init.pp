class grub {
  file {
    '/etc/default/grub':
      ensure => present,
      owner  => root,
      group  => root,
      mode   => '0644',
      source => 'puppet:///modules/grub/etc-default-grub.sh',
      notify => Exec['update-grub'];
  }

  exec {
    'update-grub':
      command     => '/usr/sbin/update-grub',
      refreshonly => true;
  }
}
