node default {
  include standard

  include docker

  docker::image {
    'stackbrew-ubuntu-saucy':
      repository => 'ubuntu',
      user       => 'stackbrew',
      tag        => 'saucy';

    'ubuntu':
  }
}
