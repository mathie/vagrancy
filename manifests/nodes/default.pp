node default {
  include standard

  include docker

  docker::image {
    'stackbrew-ubuntu-trusty':
      repository => 'ubuntu',
      user       => 'stackbrew',
      tag        => 'trusty';

    'ubuntu':
  }
}
